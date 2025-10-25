import express, { Request, Response } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import axios from 'axios';

dotenv.config();

// Supabase client for server-side operations
const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceRoleKey) {
    throw new Error('Supabase URL or Service Role Key is not defined in environment variables.');
}

const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);


const app = express();
const port = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());

const AI_PROVIDERS_CONFIG: Record<string, { provider: string, url: string, apiKey: string | undefined }> = {
    'gpt-5': { provider: 'openai', url: 'https://api.openai.com/v1/chat/completions', apiKey: process.env.OPENAI_API_KEY },
    'gpt-5-mini': { provider: 'openai', url: 'https://api.openai.com/v1/chat/completions', apiKey: process.env.OPENAI_API_KEY },
    'grok-4-fast': { provider: 'grok', url: 'https://api.x.ai/v1/chat/completions', apiKey: process.env.GROK_API_KEY },
    'deepseek-chat': { provider: 'deepseek', url: 'https://api.deepseek.com/v1/chat/completions', apiKey: process.env.DEEPSEEK_API_KEY },
    'gemini-2.5-pro': { provider: 'gemini', url: `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=${process.env.GEMINI_API_KEY}`, apiKey: process.env.GEMINI_API_KEY },
    'gemini-2.5-flash': { provider: 'gemini', url: `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=${process.env.GEMINI_API_KEY}`, apiKey: process.env.GEMINI_API_KEY },
};


// Main chat proxy endpoint
app.post('/api/v1/chat', async (req: Request, res: Response) => {
    const { model, messages, jwt } = req.body;

    if (!model || !messages || !jwt) {
        return res.status(400).json({ error: 'Missing model, messages, or jwt in request body.' });
    }

    try {
        // 1. Authenticate user with JWT
        const { data: { user }, error: userError } = await supabase.auth.getUser(jwt);
        if (userError || !user) {
            return res.status(401).json({ error: 'Invalid JWT. Authentication failed.' });
        }

        // 2. Check user's daily request limit
        const { data: usageData, error: usageError } = await supabase.rpc('get_user_usage_stats', { p_user_id: user.id });

        if (usageError) throw new Error(usageError.message);
        if (usageData.usage >= usageData.limit) {
            return res.status(429).json({ error: 'Дневной лимит запросов исчерпан.' });
        }
        
        const providerConfig = AI_PROVIDERS_CONFIG[model];
        if (!providerConfig) {
            return res.status(400).json({ error: `Model ${model} is not configured on the proxy.` });
        }
        if (!providerConfig.apiKey) {
            return res.status(500).json({ error: `API key for ${providerConfig.provider} is not configured on the server.` });
        }

        let requestBody;
        let headers;
        
        // Adapt body and headers for Gemini
        if (providerConfig.provider === 'gemini') {
            requestBody = {
                contents: messages.map((msg: any) => ({
                    role: msg.role === 'assistant' ? 'model' : msg.role,
                    parts: [{ text: msg.content }],
                })),
            };
            headers = { 'Content-Type': 'application/json' };
        } else {
            requestBody = { model, messages };
            headers = {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${providerConfig.apiKey}`,
            };
        }

        // 3. Forward request to the appropriate AI provider
        const aiResponse = await axios.post(providerConfig.url, requestBody, { headers });

        // 4. Log usage
        const usage = providerConfig.provider === 'gemini' 
            ? aiResponse.data.usageMetadata 
            : aiResponse.data.usage;
        
        const logData = {
            user_id: user.id,
            model: model,
            prompt_tokens: usage.promptTokenCount || usage.prompt_tokens,
            completion_tokens: usage.candidatesTokenCount || usage.completion_tokens,
            total_tokens: usage.totalTokenCount || usage.total_tokens,
            status: 'success',
        };

        const { error: logError } = await supabase.from('usage_logs').insert([logData]);

        if (logError) {
            // Log the error but don't block the user response
            console.error('Failed to log usage:', logError);
        }

        res.status(200).json(aiResponse.data);
    } catch (error: any) {
        // Also log errors from AI providers
        console.error('Error in chat proxy:', error.response ? error.response.data : error.message);

        // Attempt to log the failed request
        // You would need to get the user ID from JWT even on failure
        // For simplicity, we are skipping detailed error logging for now.
        
        res.status(error.response?.status || 500).json({ error: error.response?.data?.error || error.message });
    }
});


app.get('/api/health', (req: Request, res: Response) => {
    res.status(200).send('Proxy server is running');
});

app.listen(port, () => {
    console.log(`Proxy server listening at http://localhost:${port}`);
});
