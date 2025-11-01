import { SupabaseClient } from '@supabase/supabase-js';
import { Response } from 'express';
import axios, { AxiosError, AxiosInstance } from 'axios';
import { z } from 'zod';
import pino from 'pino';
import { getProviderConfig } from '../config/aiProviders';
import { LIMITS } from '../config/limits';
import { ChatRequest, ModelRoutingItem, OpenAIResponse } from '../types/main';
import { openAIResponseSchema, geminiResponseSchema } from '../middleware/validation';
import CostLimiterService from './costLimiterService';

class ChatService {
  private supabase: SupabaseClient;
  private modelRoutingConfig: Map<string, ModelRoutingItem> = new Map();
  private costLimiterService: CostLimiterService;
  private pricingCache: { timestamp: number; data: any[] | null } = { timestamp: 0, data: null };
  private axiosInstance: AxiosInstance;

  constructor(supabase: SupabaseClient) {
    this.supabase = supabase;
    this.axiosInstance = axios.create();
    this.costLimiterService = new CostLimiterService(supabase);
  }

  public async loadModelRoutingConfig(log?: pino.Logger): Promise<void> {
    log?.info('Loading model routing config.');
    const { data, error } = await this.supabase.from('model_routing_config').select('*');
    if (error) {
      log?.error({ error }, 'Failed to load model routing config');
      throw new Error('Failed to load model routing config');
    }
    this.modelRoutingConfig = new Map(data.map((item: any) => [item.model_id, item]));
    log?.info(`Model routing configuration loaded for ${this.modelRoutingConfig.size} models.`);
  }

  public async fetchOpenRouterPricing(log?: pino.Logger): Promise<void> {
    if (this.pricingCache.data && Date.now() - this.pricingCache.timestamp < LIMITS.PRICING_CACHE_DURATION) {
      log?.debug({ cacheKey: 'openRouterPricing', status: 'HIT' }, 'OpenRouter pricing cache hit.');
      return;
    }

    log?.debug({ cacheKey: 'openRouterPricing', status: 'MISS' }, 'OpenRouter pricing cache miss.');
    try {
      const response = await this.axiosInstance.get('https://openrouter.ai/api/v1/models');
      this.pricingCache = {
        timestamp: Date.now(),
        data: response.data.data,
      };
      log?.info(`Cached pricing for ${response.data.data.length} OpenRouter models.`);
    } catch (error) {
      log?.error({ error }, 'Failed to fetch OpenRouter pricing');
    }
  }

  private calculateCost(model: string, promptTokens: number, completionTokens: number, log?: pino.Logger): number | null {
    if (!this.pricingCache.data) {
      log?.warn('Pricing data not available for cost calculation.');
      return null;
    }
    const modelInfo = this.pricingCache.data.find((m: any) => m.id === model);
    if (!modelInfo || !modelInfo.pricing) {
      log?.warn({ model }, 'Pricing info not found for model');
      return null;
    }
    const cost = (promptTokens / 1000000) * parseFloat(modelInfo.pricing.input) + (completionTokens / 1000000) * parseFloat(modelInfo.pricing.output);
    return parseFloat(cost.toFixed(8));
  }

  public async handleStreamRequest(
    userId: string,
    body: ChatRequest,
    res: Response,
    log: pino.Logger,
  ): Promise<void> {
    log.info({ model: body.model }, 'Handling stream request.');
    const { model, messages, temperature, top_p } = body;

    log.debug('Checking user daily request limit.');
    try {
      const { count: userRequestCount } = await this.supabase
        .from('usage_logs')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', userId)
        .gte('created_at', new Date(new Date().setHours(0, 0, 0, 0)).toISOString());

      const { data: profile } = await this.supabase.from('profiles').select('daily_request_limit').eq('id', userId).single();
      const dailyRequestLimit = profile?.daily_request_limit ?? 0;

      if (dailyRequestLimit > 0 && (userRequestCount ?? 0) >= dailyRequestLimit) {
        log.warn({ userId, limit: dailyRequestLimit, count: userRequestCount }, 'Daily request limit exceeded.');
        res.status(429).json({ code: 'DAILY_LIMIT_EXCEEDED', error: 'You have exceeded your daily request limit.' });
        return;
      }
      log.debug('User daily request limit check passed.');
    } catch (error) {
      log.error({ error }, 'Failed to check user daily request limit');
    }

    const providerConfig = getProviderConfig(model, this.modelRoutingConfig);
    if (!providerConfig) {
      log.error({ model }, 'Provider configuration not found for model.');
      res.status(500).json({ error: `Configuration for model ${model} not found.` });
      return;
    }

    log.debug('Checking hourly cost limit.');
    if (this.costLimiterService.isLimitExceeded()) {
      log.warn({ hourlyLimit: this.costLimiterService.getHourlyLimit() }, 'Hourly cost limit exceeded.');
      res.status(429).json({ code: 'HOURLY_LIMIT_EXCEEDED', error: 'The system is currently experiencing high load. Please try again later.' });
      return;
    }
    log.debug('Hourly cost limit check passed.');

    const requestBody = { messages, model: providerConfig.modelId, temperature, top_p, stream: true };

    let streamTimeout: NodeJS.Timeout;
    const resetTimeout = () => {
      clearTimeout(streamTimeout);
      streamTimeout = setTimeout(() => {
        if (!res.writableEnded) {
          log.warn('Stream timeout occurred.');
          res.write(`data: ${JSON.stringify({ type: 'error', error: `Stream timeout after ${LIMITS.STREAM_TIMEOUT / 1000} seconds` })}\n\n`);
          res.end();
        }
      }, LIMITS.STREAM_TIMEOUT);
    };

    try {
      log.info({ providerUrl: providerConfig.url, modelId: providerConfig.modelId }, 'Sending request to AI provider.');
      const providerResponse = await this.axiosInstance.post(providerConfig.url, requestBody, {
        headers: { Authorization: `Bearer ${providerConfig.apiKey}`, 'Content-Type': 'application/json' },
        responseType: 'stream',
      });

      const providerTraceId = providerResponse.headers['x-request-id'] || 'N/A';
      log.info({ providerTraceId }, 'Provider stream opened.');

      res.writeHead(200, {
        'Content-Type': 'text/event-stream',
        'Cache-Control': 'no-cache',
        Connection: 'keep-alive',
        'X-Content-Type-Options': 'nosniff',
      });

      let responseBuffer = '';
      let completionTokens = 0;
      let promptTokens = 0;
      let lastChunkTime = Date.now();

      resetTimeout();

      providerResponse.data.on('data', (chunk: Buffer) => {
        resetTimeout();
        const timeSinceLastChunk = Date.now() - lastChunkTime;
        lastChunkTime = Date.now();
        log.debug({ timeSinceLastChunk }, 'Chunk received from provider.');

        responseBuffer += chunk.toString('utf-8');
        const lines = responseBuffer.split('\n');
        lines.slice(0, -1).forEach(line => {
          if (line.startsWith('data:')) {
            const content = line.substring('data:'.length).trim();
            if (content === '[DONE]' || !content) {
              return;
            }
            try {
              const jsonContent = JSON.parse(content);
              log.debug({ chunk: jsonContent }, 'Raw chunk from provider');
              const parsed = this.parseProviderResponse(jsonContent, providerConfig.provider, log);
              if (parsed) {
                if (parsed.promptTokens) promptTokens = parsed.promptTokens;
                if (parsed.completionTokens) completionTokens += 1; 
                res.write(`data: ${JSON.stringify({ type: 'chunk', content: parsed.content || '' })}\n\n`);
              }
            } catch (e) {
              log.debug({ error: e, content: line }, 'Failed to parse stream chunk JSON.');
            }
          }
        });
        responseBuffer = lines[lines.length - 1];
      });

      providerResponse.data.on('end', async () => {
        log.info('Provider stream ended.');
        clearTimeout(streamTimeout);
        if (!res.writableEnded) {
          const cost = this.calculateCost(providerConfig.modelId, promptTokens, completionTokens, log);
          if (cost !== null) {
            this.costLimiterService.addCost(cost);
            log.info({ cost, totalHourlyCost: this.costLimiterService.getCurrentCost() }, 'Cost calculated and added.');
          }
          // Log usage to DB
          res.write(`data: ${JSON.stringify({ type: 'done' })}\n\n`);
          res.end();
        }
      });

      providerResponse.data.on('error', (err: any) => {
        log.error({ err }, 'Provider stream error.');
        clearTimeout(streamTimeout);
        if (!res.writableEnded) {
          res.write(`data: ${JSON.stringify({ type: 'error', error: 'Streaming error occurred' })}\n\n`);
          res.end();
        }
      });
    } catch (error: any) {
      log.error({ err: error }, 'Error during stream request processing.');
      clearTimeout(streamTimeout);
      if (!res.headersSent) {
        const status = error.response?.status || 500;
        res.status(status).json({ error: 'Failed to get response from AI provider', details: error.message });
      } else if (!res.writableEnded) {
        res.write(`data: ${JSON.stringify({ type: 'error', error: 'Failed to get response from AI provider' })}\n\n`);
        res.end();
      }
    }
  }

  private parseProviderResponse(jsonContent: any, provider: string, log: pino.Logger): { content: string | null; promptTokens?: number; completionTokens?: number } | null {
    let schema: z.ZodSchema<OpenAIResponse>;
    switch (provider) {
      case 'gemini':
        schema = geminiResponseSchema;
        break;
      default:
        schema = openAIResponseSchema;
    }
    const validation = schema.safeParse(jsonContent);
    if (!validation.success) {
      log.warn({ errors: validation.error.flatten(), data: jsonContent }, 'Failed to validate provider response chunk.');
      return null;
    }
    const data = validation.data;
    if ('choices' in data) {
      return {
        content: data.choices[0].delta?.content || '',
        promptTokens: data.usage?.prompt_tokens,
        completionTokens: data.usage?.completion_tokens,
      };
    } else {
      return { content: data.candidates[0].content.parts[0].text || '' };
    }
  }
}

export default ChatService;
