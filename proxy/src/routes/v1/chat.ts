import { Router, Request, Response } from 'express';
import { chatRequestSchema, validate } from '../../middleware/validation';
import ChatService from '../../services/chatService';
import { SupabaseClient } from '@supabase/supabase-js';

export default (supabase: SupabaseClient, chatService: ChatService) => {
    const router = Router();

    const validateRequest = (req: Request, res: Response, next: any) => {
        const result = chatRequestSchema.safeParse(req.body);
        if (!result.success) {
            return res.status(400).json({ error: 'Invalid request body', details: result.error.flatten() });
        }
        req.body = result.data; // Use validated data
        next();
    };

    router.post('/chat', validateRequest, async (req: Request, res: Response) => {
        // Non-streaming endpoint is not implemented as client uses streaming
        res.status(501).json({ error: 'Non-streaming chat is not implemented. Use /chat/stream.' });
    });

    router.post('/chat/stream', validate(chatRequestSchema), async (req, res) => {
        if (!req.user) {
            return res.status(401).json({ error: 'User not authenticated' });
        }

        try {
            await chatService.handleStreamRequest(req.user.id, req.body, res, req.log);
        } catch (error: any) {
            req.log.error({ err: error }, 'Error in chat stream route handler');
            if (!res.headersSent) {
                res.status(500).json({ error: 'Failed to process chat stream', details: error.message });
            }
        }
    });

    // Get user-accessible models endpoint
    router.get('/user-accessible-models', async (req, res) => {
        if (!req.user) {
            return res.status(401).json({ error: 'User not authenticated' });
        }

        try {
            // Get all models first
            const { data: allModels, error: modelsError } = await supabase
                .from('models')
                .select('model_id, display_name, provider');
            
            if (modelsError) throw modelsError;

            // Get user's accessible models (if row exists, access is granted)
            const { data: userAccess, error: accessError } = await supabase
                .from('user_model_access')
                .select('model_id')
                .eq('user_id', req.user.id);
            
            if (accessError) throw accessError;

            const accessibleModelIds = new Set(userAccess?.map(row => row.model_id) || []);

            // Check for default access
            const { data: defaultAccess, error: defaultError } = await supabase
                .from('models')
                .select('model_id')
                .eq('is_default_access', true);
            
            if (defaultError) throw defaultError;

            const defaultModelIds = new Set(defaultAccess?.map(row => row.model_id) || []);

            // Filter models: user has explicit access OR model has default access
            const accessibleModels = allModels
                ?.filter((model: any) => 
                    accessibleModelIds.has(model.model_id) || defaultModelIds.has(model.model_id)
                )
                .map((row: any) => ({
                    id: row.model_id,
                    name: row.display_name,
                    provider: row.provider,
                })) || [];

            res.status(200).json(accessibleModels);
        } catch (error: any) {
            req.log.error({ err: error }, 'Error fetching user-accessible models');
            res.status(500).json({ error: 'Failed to fetch accessible models', details: error.message });
        }
    });

    return router;
};
