import { ModelRoutingItem } from "../types/main";

export const AI_PROVIDERS_CONFIG: Record<string, { provider: string, url: string, apiKey: string | undefined }> = {
    'gpt-5': { provider: 'openai', url: 'https://api.openai.com/v1/chat/completions', apiKey: process.env.OPENAI_API_KEY },
    'gpt-5-mini': { provider: 'openai', url: 'https://api.openai.com/v1/chat/completions', apiKey: process.env.OPENAI_API_KEY },
    'grok-4-fast': { provider: 'grok', url: 'https://api.x.ai/v1/chat/completions', apiKey: process.env.GROK_API_KEY },
    'deepseek-chat': { provider: 'deepseek', url: 'https://api.deepseek.com/v1/chat/completions', apiKey: process.env.DEEPSEEK_API_KEY },
    'gemini-2.5-pro': { provider: 'gemini', url: `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=${process.env.GEMINI_API_KEY}`, apiKey: process.env.GEMINI_API_KEY },
    'gemini-2.5-flash': { provider: 'gemini', url: `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=${process.env.GEMINI_API_KEY}`, apiKey: process.env.GEMINI_API_KEY },
};

export const OPENROUTER_CONFIG = {
    provider: 'openrouter',
    url: 'https://openrouter.ai/api/v1/chat/completions',
    apiKey: process.env.OPENROUTER_API_KEY,
};

interface ProviderConfig {
  provider: string;
  url: string;
  apiKey: string;
  modelId: string;
}

export function getProviderConfig(
  model: string,
  modelRoutingConfig: Map<string, ModelRoutingItem>
): ProviderConfig | null {
  const route = modelRoutingConfig.get(model);

  // Priority 1: Use OpenRouter if specified in routing config and both key and model ID are available
  if (route && route.use_openrouter && OPENROUTER_CONFIG.apiKey && route.openrouter_model_id) {
    return {
      ...OPENROUTER_CONFIG,
      modelId: route.openrouter_model_id,
    };
  }

  // Priority 2: Use a direct provider if it's explicitly configured
  const directProvider = AI_PROVIDERS_CONFIG[model];
  if (directProvider && directProvider.apiKey) {
    return {
      ...directProvider,
      modelId: model,
    };
  }
  
  // Fallback to OpenRouter if no specific route or direct provider is set
  if (OPENROUTER_CONFIG.apiKey) {
    return {
        ...OPENROUTER_CONFIG,
        modelId: route?.openrouter_model_id || model,
    };
  }

  return null;
}
