import { Request, Response, NextFunction } from 'express';
import { z, ZodSchema } from 'zod';
import { LIMITS } from '../config/limits';

export const validate = (schema: ZodSchema<any>) => (req: Request, res: Response, next: NextFunction) => {
    try {
        schema.parse(req.body);
        next();
    } catch (error) {
        if (error instanceof z.ZodError) {
            return res.status(400).json({
                error: 'Invalid request body',
                details: error.flatten().fieldErrors,
            });
        }
        return res.status(500).json({ error: 'Internal Server Error' });
    }
};

export const userUpdateSchema = z.object({
    daily_request_limit: z.number().int().min(0).max(100000).optional(),
    role: z.enum(['user', 'admin']).optional(),
    display_name: z.string().optional(),
    email: z.string().email().optional(),
});

export const modelAddSchema = z.object({
    model_id: z.string().min(1),
    display_name: z.string().min(1),
    openrouter_model_id: z.string().min(1),
    temperature: z.number().min(0).max(2).optional(),
    is_default_access: z.boolean().optional(),
    description: z.string().optional(),
});

export const chatRequestSchema = z.object({
    model: z.string().min(1, 'Model is required.'),
    messages: z.array(z.object({
        role: z.enum(['user', 'assistant', 'system']),
        content: z.string().min(1, 'Message content is required.').max(LIMITS.MAX_MESSAGE_CONTENT_LENGTH, `Message content exceeds maximum size of ${LIMITS.MAX_MESSAGE_CONTENT_LENGTH} characters.`),
    })).min(1, 'Messages must be a non-empty array.').max(LIMITS.MAX_MESSAGES_PER_REQUEST, `Maximum ${LIMITS.MAX_MESSAGES_PER_REQUEST} messages allowed per request.`),
    conversationId: z.string().uuid().nullable().optional(),
    temperature: z.number().min(0).max(2).nullable().optional(),
    top_p: z.number().min(0).max(1).nullable().optional(),
});

export type ChatRequestPayload = z.infer<typeof chatRequestSchema>;

// Provider response schemas - designed to be flexible and accept various formats
export const openAIResponseSchema = z.object({
    id: z.string().optional(),
    object: z.string().optional(),
    created: z.number().optional(),
    model: z.string().optional(),
    provider: z.string().optional(),
    choices: z.array(z.object({
        index: z.number().optional(),
        delta: z.object({
            role: z.string().optional(),
            content: z.string().optional(),
        }).optional(),
        message: z.object({
            role: z.string().optional(),
            content: z.string().optional(),
        }).optional(),
        finish_reason: z.string().nullable().optional(),
        native_finish_reason: z.string().nullable().optional(),
        logprobs: z.any().optional(),
    })).optional(),
    usage: z.object({
        prompt_tokens: z.number().optional(),
        completion_tokens: z.number().optional(),
        total_tokens: z.number().optional(),
    }).optional(),
    error: z.object({
        message: z.string().optional(),
        code: z.string().optional(),
    }).optional(),
}).passthrough(); // Allow extra fields

export const geminiResponseSchema = z.object({
    candidates: z.array(z.object({
        content: z.object({
            parts: z.array(z.object({
                text: z.string().optional(),
            })).optional(),
        }).optional(),
        finishReason: z.string().optional(),
        safetyRatings: z.array(z.any()).optional(),
    })).optional(),
    usage: z.object({
        promptTokenCount: z.number().optional(),
        candidatesTokenCount: z.number().optional(),
        totalTokenCount: z.number().optional(),
    }).optional(),
}).passthrough(); // Allow extra fields
