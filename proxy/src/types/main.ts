import { z } from 'zod';
import { chatRequestSchema, openAIResponseSchema } from '../middleware/validation';

export type ChatRequest = z.infer<typeof chatRequestSchema>;
export type OpenAIResponse = z.infer<typeof openAIResponseSchema>;

export interface ModelRoutingItem {
  model_id: string;
  use_openrouter: boolean;
  openrouter_model_id: string | null;
}

export interface UsageLog {
  id: string;
  created_at: string;
  user_id: string;
  model_id: string;
  prompt_tokens: number;
  completion_tokens: number;
  total_tokens: number;
  cost: number | null;
  status: 'success' | 'error';
}
