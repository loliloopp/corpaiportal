import express, { Request, Response } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { createClient, SupabaseClient } from '@supabase/supabase-js';
import axios from 'axios';

dotenv.config();

// =================================================================
// Configuration & Globals
// =================================================================
const port = process.env.PORT || 3001;

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
        origin: ['http://localhost:5173', 'http://localhost:5174', 'http://localhost:3000', 'http://185.200.179.0'],
        credentials: true,
        methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
        allowedHeaders: ['Content-Type', 'Authorization'],
    }));
    app.use(express.json());

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
        console.log("GET /api/v1/openrouter-models hit");
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

    app.get('/api/v1/model-routing', async (req, res) => {
        console.log("GET /api/v1/model-routing hit");
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
        console.log(`PUT /api/v1/model-routing/${req.params.modelId} hit`);
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
        console.log("POST /api/v1/chat hit");
        const { model, messages, jwt } = req.body;
        if (!model || !messages || !jwt) {
            return res.status(400).json({ error: 'Missing required fields.' });
        }
        try {
            const { data: { user }, error: userError } = await supabase.auth.getUser(jwt);
            if (userError || !user) {
                console.error("Auth error:", userError);
                return res.status(401).json({ error: 'Invalid JWT.' });
            }

            // (rest of the chat logic will be implemented here)
            // For now, just a placeholder response
            console.log(`Chat request for model ${model} by user ${user.id}`);
            res.status(200).json({ message: "Chat logic placeholder" });

    } catch (error: any) {
            console.error("Chat endpoint error:", error);
            res.status(500).json({ error: 'Internal server error.', details: error.message });
        }
    });
    console.log("Routes defined.");


    // 5. Start Server
    app.listen(port, () => {
        console.log(`✅ Proxy server is running and listening at http://localhost:${port}`);
    });

    // Heartbeat to keep the process alive
    setInterval(() => {
        console.log('Heartbeat: process is alive.');
    }, 10000);
}

// =================================================================
// Run the application
// =================================================================
main().catch(error => {
    console.error('💥 Failed to start proxy server:', error);
    process.exit(1);
});
