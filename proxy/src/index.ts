import express, { Request, Response, NextFunction } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { createClient, SupabaseClient } from '@supabase/supabase-js';
import axios from 'axios';

dotenv.config();

// =================================================================
// Configuration & Globals
// =================================================================
const port = process.env.PORT || 3000;

const AI_PROVIDERS_CONFIG: Record<string, { provider: string, url: string, apiKey: string | undefined }> = {
    'gpt-5': { provider: 'openai', url: 'https://api.openai.com/v1/chat/completions', apiKey: process.env.OPENAI_API_KEY },
    'gpt-5-mini': { provider: 'openai', url: 'https://api.openai.com/v1/chat/completions', apiKey: process.env.OPENAI_API_KEY },
    'grok-4-fast': { provider: 'grok', url: 'https://api.x.ai/v1/chat/completions', apiKey: process.env.GROK_API_KEY },
    'deepseek-chat': { provider: 'deepseek', url: 'https://api.deepseek.com/v1/chat/completions', apiKey: process.env.DEEPSEEK_API_KEY },
    'gemini-2.5-pro': { provider: 'gemini', url: `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=${process.env.GEMINI_API_KEY}`, apiKey: process.env.GEMINI_API_KEY },
    'gemini-2.5-flash': { provider: 'gemini', url: `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=${process.env.GEMINI_API_KEY}`, apiKey: process.env.GEMINI_API_KEY },
};
const OPENROUTER_CONFIG = {
    provider: 'openrouter',
    url: 'https://openrouter.ai/api/v1/chat/completions',
    apiKey: process.env.OPENROUTER_API_KEY,
};
let modelRoutingConfig: Record<string, { useOpenRouter: boolean; openRouterModelId: string }> = {};
let cachedModels: any = null;
let cacheTimestamp: number = 0;
const CACHE_DURATION = 3600000;


// =================================================================
// Helper Functions
// =================================================================
async function loadModelRoutingConfig(supabase: SupabaseClient) {
    try {
        const { data, error } = await supabase.from('model_routing_config').select('*');
        if (error) throw error;

        const newConfig: typeof modelRoutingConfig = {};
        data?.forEach((config: any) => {
            newConfig[config.model_id] = {
                useOpenRouter: config.use_openrouter,
                openRouterModelId: config.openrouter_model_id,
            };
        });
        modelRoutingConfig = newConfig;
        console.log('>>> Model routing configuration loaded.');
    } catch (error: any) {
        console.error('Failed to load model routing config:', error.message);
    }
}

// Authentication & Authorization middleware
interface AuthenticatedRequest extends Request {
    user?: { id: string; email?: string };
    profile?: { role: string };
}

function createAuthMiddleware(supabase: SupabaseClient) {
    return async function authenticateUser(req: AuthenticatedRequest, res: Response, next: NextFunction) {
        try {
            const authHeader = req.headers.authorization;
            const jwt = authHeader?.replace('Bearer ', '') || req.body?.jwt;

            if (!jwt) {
                return res.status(401).json({ error: 'Missing authentication token.' });
            }

            const { data: { user }, error: userError } = await supabase.auth.getUser(jwt);
            if (userError || !user) {
                return res.status(401).json({ error: 'Invalid authentication token.' });
            }

            // Get user profile
            const { data: profile, error: profileError } = await supabase
                .from('user_profiles')
                .select('role')
                .eq('id', user.id)
                .single();

            if (profileError || !profile) {
                return res.status(403).json({ error: 'User profile not found.' });
            }

            req.user = { id: user.id, email: user.email };
            req.profile = profile;
            next();
        } catch (error: any) {
            console.error('Authentication error:', error);
            return res.status(500).json({ error: 'Authentication failed.' });
        }
    };
}

function requireAdmin(req: AuthenticatedRequest, res: Response, next: NextFunction) {
    if (!req.profile || req.profile.role !== 'admin') {
        return res.status(403).json({ error: 'Admin access required.' });
    }
    next();
}

// Validation helpers
function validateChatRequest(body: any): { valid: boolean; error?: string } {
    if (!body.model || typeof body.model !== 'string') {
        return { valid: false, error: 'Model is required and must be a string.' };
    }
    if (!body.messages || !Array.isArray(body.messages) || body.messages.length === 0) {
        return { valid: false, error: 'Messages must be a non-empty array.' };
    }
    if (body.messages.length > 100) {
        return { valid: false, error: 'Maximum 100 messages allowed per request.' };
    }
    
    // Validate each message
    for (const msg of body.messages) {
        if (!msg.role || !['user', 'assistant', 'system'].includes(msg.role)) {
            return { valid: false, error: 'Invalid message role. Must be user, assistant, or system.' };
        }
        if (!msg.content || typeof msg.content !== 'string') {
            return { valid: false, error: 'Message content is required and must be a string.' };
        }
        // Check message size - approximately 10MB limit (10MB ≈ 10,000,000 bytes ≈ 5,000,000 characters for UTF-8)
        // But we'll use a more conservative limit of 8MB to account for message overhead
        if (msg.content.length > 4000000) {
            return { valid: false, error: 'Message content exceeds maximum size of 8MB.' };
        }
    }

    if (body.conversationId && typeof body.conversationId !== 'string') {
        return { valid: false, error: 'ConversationId must be a string if provided.' };
    }

    return { valid: true };
}


// =================================================================
// Main Application Setup
// =================================================================
async function main() {
    // 1. Setup Supabase
    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
    if (!supabaseUrl || !supabaseServiceRoleKey) {
        console.error('Supabase environment variables are not set.');
        process.exit(1);
    }
    const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);
    console.log("Supabase client created.");


    // 2. Initial data loading
    await loadModelRoutingConfig(supabase);

    // 3. Create Express App
    const app = express();
    app.use(cors({
        origin: ['http://localhost:5173', 'http://localhost:5174', 'http://localhost:3000', 'http://185.200.179.0', 'https://aihub.fvds.ru'],
        credentials: true,
        methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
        allowedHeaders: ['Content-Type', 'Authorization'],
    }));
    app.use(express.json({ limit: '10mb' }));

    // 4. Define Routes
    console.log("Defining routes...");
    app.get('/test', (req, res) => {
        console.log("GET /test hit");
        res.status(200).send('Test route is working!');
    });

    app.get('/api/health', (req, res) => {
        console.log("GET /api/health hit");
        res.status(200).send('Proxy server is running');
    });

    app.get('/api/v1/openrouter-models', async (req, res) => {
        try {
            if (cachedModels && (Date.now() - cacheTimestamp < CACHE_DURATION)) {
                return res.status(200).json(cachedModels);
            }
            const response = await axios.get('https://openrouter.ai/api/v1/models');
            cachedModels = response.data;
            cacheTimestamp = Date.now();
            res.status(200).json(cachedModels);
        } catch (error) {
            console.error('Error fetching from OpenRouter:', error);
            res.status(500).json({ error: 'Failed to fetch models from OpenRouter' });
        }
    });

    app.get('/api/v1/configured-models', async (req, res) => {
        try {
            const { data, error } = await supabase.from('model_routing_config').select('model_id');
            if (error) throw error;
            const modelIds = data?.map((row: any) => row.model_id) || [];
            res.status(200).json(modelIds);
        } catch (error: any) {
            console.error("Error fetching configured models:", error);
            res.status(500).json({ error: 'Failed to fetch configured models', details: error.message });
        }
    });

    app.get('/api/v1/models', async (req, res) => {
        try {
            const { data, error } = await supabase.from('models').select('model_id, display_name, provider');
            if (error) throw error;
            const models = data?.map((row: any) => ({
                id: row.model_id,
                name: row.display_name,
                provider: row.provider,
            })) || [];
            res.status(200).json(models);
        } catch (error: any) {
            console.error("Error fetching models:", error);
            res.status(500).json({ error: 'Failed to fetch models', details: error.message });
        }
    });

    app.get('/api/v1/model-routing', async (req, res) => {
        try {
            const { data, error } = await supabase.from('model_routing_config').select('*');
            if (error) throw error;
            res.status(200).json(data);
        } catch (error: any) {
            console.error("Error fetching model routing:", error);
            res.status(500).json({ error: 'Failed to fetch model routing configuration', details: error.message });
        }
    });

    app.put('/api/v1/model-routing/:modelId', async (req, res) => {
        try {
            const { modelId } = req.params;
            const { useOpenRouter, openRouterModelId } = req.body;
            const { data, error } = await supabase
                .from('model_routing_config')
                .update({ use_openrouter: useOpenRouter, openrouter_model_id: openRouterModelId })
                .eq('model_id', modelId)
                .select().single();
            if (error) throw error;
            await loadModelRoutingConfig(supabase); // Reload config
            res.status(200).json(data);
        } catch (error: any) {
            console.error("Error updating model routing:", error);
            res.status(500).json({ error: 'Failed to update model routing configuration', details: error.message });
        }
    });

    app.post('/api/v1/chat', async (req, res) => {
        // Validate request body
        const validation = validateChatRequest(req.body);
        if (!validation.valid) {
            return res.status(400).json({ error: validation.error });
        }

        const { model, messages, jwt, conversationId: convId } = req.body;
        let conversationId = convId;

        if (!jwt) {
            return res.status(400).json({ error: 'Missing authentication token.' });
        }

        try {
            // 1. Authenticate user
            const { data: { user }, error: userError } = await supabase.auth.getUser(jwt);
            if (userError || !user) {
                console.error("Auth error:", userError);
                return res.status(401).json({ error: 'Invalid JWT.' });
            }

            // 1.5 Check user request limit
            const { data: profile, error: profileError } = await supabase
                .from('user_profiles')
                .select('daily_request_limit')
                .eq('id', user.id)
                .single();

            if (profileError || !profile) {
                console.error("Profile error:", profileError);
                return res.status(500).json({ error: 'Could not fetch user profile.' });
            }

            const today = new Date().toISOString().slice(0, 10); // YYYY-MM-DD
            const todayStart = `${today}T00:00:00.000Z`;

            // Check daily request limit
            const { count, error: countError } = await supabase
                .from('usage_logs')
                .select('*', { count: 'exact', head: true })
                .eq('user_id', user.id)
                .eq('status', 'success')
                .gte('created_at', todayStart);

            if (countError) {
                console.error("Usage count error:", countError);
                return res.status(500).json({ error: 'Could not count user usage.' });
            }

            const requestLimit = profile.daily_request_limit || 0;
            if (count !== null && count >= requestLimit) {
                return res.status(429).json({ 
                    error: 'Вы достигли дневного лимита запросов.',
                    limit: requestLimit,
                    used: count,
                    code: 'DAILY_LIMIT_EXCEEDED'
                });
            }


            // 2. Create conversation if it's a new one
            if (!conversationId) {
                const { data: newConversation, error: createError } = await supabase
                    .from('conversations')
                    .insert({ user_id: user.id, title: messages[0]?.content.substring(0, 50) || 'New Chat' })
                    .select()
                    .single();

                if (createError) throw createError;
                conversationId = newConversation.id;
            }

            // 3. Save user message
            const userMessage = messages[messages.length - 1];
            const { data: savedUserMessage, error: saveMessageError } = await supabase.from('messages').insert({
                conversation_id: conversationId,
                user_id: user.id,
                role: 'user',
                content: userMessage.content,
            }).select().single();
            
            if (saveMessageError) throw saveMessageError;
            const userMessageId = savedUserMessage?.id;


            // TODO: Implement user limits check here


            // 4. Determine routing and prepare API call
            const routeConfig = modelRoutingConfig[model];
            const useOpenRouter = routeConfig?.useOpenRouter ?? false;

            // Clean messages - remove id, model, and other fields that providers don't expect
            const cleanedMessages = messages.map((msg: any) => ({
                role: msg.role,
                content: msg.content,
            }));

            let targetUrl: string;
            let apiKey: string | undefined;
            let provider: string;
            let finalModelId: string;
            let requestBody: any;

            if (useOpenRouter && OPENROUTER_CONFIG.apiKey) {
                targetUrl = OPENROUTER_CONFIG.url;
                apiKey = OPENROUTER_CONFIG.apiKey;
                provider = OPENROUTER_CONFIG.provider;
                finalModelId = routeConfig?.openRouterModelId || model; // Fallback to original model ID
                requestBody = { model: finalModelId, messages: cleanedMessages };
            } else {
                const providerConfig = AI_PROVIDERS_CONFIG[model];
                if (!providerConfig || !providerConfig.apiKey) {
                    throw new Error(`Configuration for model ${model} is missing or incomplete.`);
                }
                targetUrl = providerConfig.url;
                apiKey = providerConfig.apiKey;
                provider = providerConfig.provider;
                finalModelId = model;
                
                if (provider === 'gemini') {
                    // Gemini has a different payload structure
                    requestBody = {
                        contents: cleanedMessages
                            .filter((msg: any) => msg.role === 'user' || msg.role === 'assistant')
                            .map((msg: any) => ({
                                role: msg.role === 'assistant' ? 'model' : 'user',
                                parts: [{ text: msg.content }],
                            })),
                    };
                } else {
                    // OpenAI-compatible payload
                    requestBody = { model: finalModelId, messages: cleanedMessages };
                }
            }
            
            if (!apiKey) {
                 throw new Error(`API key for provider ${provider} is not configured.`);
            }

            // 5. Make the request to the AI provider
            const aiResponse = await axios.post(targetUrl, requestBody, {
                headers: {
                    'Authorization': `Bearer ${apiKey}`,
                    'Content-Type': 'application/json',
                },
            });

            // 6. Normalize the response
            let assistantContent: string;
            if (provider === 'gemini') {
                assistantContent = aiResponse.data.candidates[0].content.parts[0].text;
            } else { // OpenAI and OpenRouter
                assistantContent = aiResponse.data.choices[0].message.content;
            }

            // 7. Save assistant message
            const { error: saveAssistantError } = await supabase.from('messages').insert({
                conversation_id: conversationId,
                user_id: user.id,
                role: 'assistant',
                content: assistantContent,
            });
            if (saveAssistantError) throw saveAssistantError;

            // Log usage and token counts
            // For now, count tokens as input + output tokens
            // OpenAI-compatible response structure: { choices: [{ message: { content } }], usage: { prompt_tokens, completion_tokens } }
            const inputTokens = aiResponse.data.usage?.prompt_tokens || Math.ceil(cleanedMessages.map((m: any) => m.content).join(' ').split(' ').length / 0.75);
            const outputTokens = aiResponse.data.usage?.completion_tokens || Math.ceil(assistantContent.split(' ').length / 0.75);
            const totalTokens = inputTokens + outputTokens;

            const { error: usageError } = await supabase.from('usage_logs').insert({
                user_id: user.id,
                model: model,
                prompt_tokens: inputTokens,
                completion_tokens: outputTokens,
                total_tokens: totalTokens,
                status: 'success',
                message_id: userMessageId,
            });
            if (usageError) {
                console.error('Failed to log usage:', usageError.message);
                // Don't throw - usage logging failure shouldn't break the response
            }

            // 8. Send response back to the client
            const clientResponse = {
                id: conversationId,
                choices: [{
                    message: {
                        content: assistantContent,
                    },
                }],
            };

            res.status(200).json(clientResponse);

        } catch (error: any) {
            console.error("Chat endpoint error:", error.response ? JSON.stringify(error.response.data, null, 2) : error.message);
            res.status(500).json({ error: 'Internal server error.', details: error.message });
        }
    });

    // Create auth middleware with supabase client
    const authenticateUser = createAuthMiddleware(supabase);

    // Admin endpoints - require authentication and admin role
    app.get('/api/v1/admin/users', authenticateUser, requireAdmin, async (req: AuthenticatedRequest, res) => {
        try {
            const { data, error } = await supabase
                .from('user_profiles')
                .select('*')
                .order('created_at', { ascending: false });

            if (error) throw error;
            res.status(200).json(data);
        } catch (error: any) {
            console.error("Error fetching users:", error);
            res.status(500).json({ error: 'Failed to fetch users', details: error.message });
        }
    });

    app.put('/api/v1/admin/users/:userId', authenticateUser, requireAdmin, async (req: AuthenticatedRequest, res) => {
        try {
            const { userId } = req.params;
            const updates = req.body;

            // Validate updates - only allow specific fields
            const allowedFields = ['daily_request_limit', 'role', 'display_name', 'email'];
            const filteredUpdates: any = {};
            for (const field of allowedFields) {
                if (updates[field] !== undefined) {
                    filteredUpdates[field] = updates[field];
                }
            }

            if (Object.keys(filteredUpdates).length === 0) {
                return res.status(400).json({ error: 'No valid fields to update.' });
            }

            // Validate role if provided
            if (filteredUpdates.role !== undefined) {
                if (!['user', 'admin'].includes(filteredUpdates.role)) {
                    return res.status(400).json({ error: 'Invalid role. Must be "user" or "admin".' });
                }
                // Ensure role is lowercase for enum type
                filteredUpdates.role = filteredUpdates.role.toLowerCase();
            }

            // Validate daily_request_limit if provided
            if (filteredUpdates.daily_request_limit !== undefined) {
                const limit = Number(filteredUpdates.daily_request_limit);
                if (isNaN(limit) || limit < 0 || limit > 100000) {
                    return res.status(400).json({ error: 'daily_request_limit must be a number between 0 and 100000.' });
                }
                filteredUpdates.daily_request_limit = limit;
            }

            const { data, error } = await supabase
                .from('user_profiles')
                .update(filteredUpdates)
                .eq('id', userId)
                .select()
                .single();

            if (error) {
                console.error("Error updating user:", error);
                throw error;
            }
            
            res.status(200).json(data);
        } catch (error: any) {
            console.error("Error updating user:", error);
            res.status(500).json({ 
                error: 'Failed to update user', 
                details: error.message || error.details || 'Unknown error',
            });
        }
    });

    console.log("Routes defined.");


    // 5. Start Server
    app.listen(port, () => {
        console.log(`✅ Proxy server is running and listening at http://localhost:${port}`);
        console.log(`📋 Admin endpoints available:`);
        console.log(`   GET  /api/v1/admin/users`);
        console.log(`   PUT  /api/v1/admin/users/:userId`);
    });

    // This promise never resolves, which will keep the process running.
    // This is a workaround for an unusual environment issue where app.listen()
    // alone is not keeping the process alive.
    await new Promise(() => {});
}

// =================================================================
// Run the application
// =================================================================
main().catch(error => {
    console.error('💥 Failed to start proxy server:', error);
    process.exit(1);
});
