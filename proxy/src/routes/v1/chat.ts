import { Router, Request, Response } from 'express';
import { chatRequestSchema, ChatRequestPayload } from '../../middleware/validation';
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

    router.post('/chat/stream', validateRequest, async (req: Request, res: Response) => {
        try {
            if (!req.user) {
                // This should not happen if auth middleware is applied before this router
                return res.status(401).json({ error: 'Authentication required.' });
            }
            await chatService.handleStreamChatRequest(req.body as ChatRequestPayload, req.user.id, res);
        } catch (error: any) {
            // This will catch initial errors before streaming begins, e.g., limit checks
            const status = error.code === 'DAILY_LIMIT_EXCEEDED' ? 429 : 500;
             if (!res.headersSent) {
                res.status(status).json({ error: error.message || 'Internal server error' });
            } else if (!res.writableEnded) {
                res.write(`data: ${JSON.stringify({ type: 'error', error: error.message || 'Internal server error' })}\n\n`);
                res.end();
            }
        }
    });

    return router;
};
