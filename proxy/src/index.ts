/// <reference path="./types/express.d.ts" />

// Load environment variables FIRST, before any other imports
import dotenv from 'dotenv';
dotenv.config();

import express from 'express';
import cors from 'cors';
import { createClient } from '@supabase/supabase-js';

// Configs
import { CORS_OPTIONS } from './config/cors';
import { LIMITS } from './config/limits';

// Middleware
import { createAuthMiddleware, requireAdmin } from './middleware/auth';
import { apiLimiter, chatLimiter } from './middleware/rateLimiter';

// Routes
import chatRoutes from './routes/v1/chat';
import modelRoutes from './routes/v1/models';
import adminRoutes from './routes/v1/admin';
import settingsRoutes from './routes/v1/settings';

// Services
import ChatService from './services/chatService';

async function main() {
    const port = process.env.PORT || 3000;

    // 1. Setup Supabase
    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
    if (!supabaseUrl || !supabaseServiceRoleKey) {
        console.error('Supabase environment variables are not set.');
        process.exit(1);
    }
    const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);
    console.log("Supabase client created.");

    // 2. Preload critical services
    const chatService = new ChatService(supabase);
    // Wait for critical data to load before starting the server
    await chatService.loadModelRoutingConfig();
    await chatService.fetchOpenRouterPricing();
    console.log("Critical services preloaded.");

    // 3. Create Express App
    const app = express();
    app.use(cors(CORS_OPTIONS));
    app.use(express.json({ limit: `${LIMITS.MAX_MESSAGE_SIZE_BYTES}b` }));
    app.use('/api', apiLimiter); // Apply general rate limiting to all /api requests

    // Create auth middleware instance
    const authenticateUser = createAuthMiddleware(supabase);

    // 4. Define Routes
    app.get('/api/health', (req, res) => res.status(200).send('Proxy server is running'));

    // Public routes (no auth required)
    app.use('/api/v1', modelRoutes(supabase));
    
    // Public GET for settings (no auth required)
    app.get('/api/v1/settings/:settingName', async (req, res) => {
        const { settingName } = req.params;
        try {
            const { data, error } = await supabase
                .from('settings')
                .select('value')
                .eq('key', settingName)
                .single();

            if (error) {
                if (error.code === 'PGRST116') {
                    return res.status(404).json({ error: `Setting '${settingName}' not found.` });
                }
                throw error;
            }

            res.status(200).json(data);
        } catch (error: any) {
            console.error(`Error fetching setting '${settingName}':`, error);
            res.status(500).json({ error: `Failed to fetch setting '${settingName}'`, details: error.message });
        }
    });
    
    // Authenticated routes
    app.use('/api/v1', authenticateUser); // All subsequent routes require a valid user
    
    // Settings routes (PUT requires auth)
    app.use('/api/v1', settingsRoutes(supabase));
    
    // Chat routes (add specific limiter)
    app.use('/api/v1', chatLimiter, chatRoutes(supabase, chatService));

    // Admin routes (require admin role)
    app.use('/api/v1', adminRoutes(supabase));

    console.log("Routes defined.");

    // 5. Start Server
    app.listen(port, () => {
        console.log(`✅ Proxy server is running and listening at http://localhost:${port}`);
    });
}

main().catch(error => {
    console.error('💥 Failed to start proxy server:', error);
    process.exit(1);
});
