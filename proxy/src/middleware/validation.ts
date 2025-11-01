import { z } from 'zod';
import { LIMITS } from '../config/limits';

export const chatRequestSchema = z.object({
    model: z.string().min(1, 'Model is required.'),
    messages: z.array(z.object({
        role: z.enum(['user', 'assistant', 'system']),
        content: z.string().min(1, 'Message content is required.').max(LIMITS.MAX_MESSAGE_CONTENT_LENGTH, `Message content exceeds maximum size of ${LIMITS.MAX_MESSAGE_CONTENT_LENGTH} characters.`),
    })).min(1, 'Messages must be a non-empty array.').max(LIMITS.MAX_MESSAGES_PER_REQUEST, `Maximum ${LIMITS.MAX_MESSAGES_PER_REQUEST} messages allowed per request.`),
    jwt: z.string().min(1, 'Missing authentication token.'),
    conversationId: z.string().uuid().nullable().optional(),
    temperature: z.number().min(0).max(2).nullable().optional(),
    top_p: z.number().min(0).max(1).nullable().optional(),
});

export type ChatRequestPayload = z.infer<typeof chatRequestSchema>;
