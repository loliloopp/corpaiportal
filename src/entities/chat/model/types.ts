export interface Message {
  id: string;
  role: 'user' | 'assistant';
  content: string;
  model?: string | null; // model_id of the AI model that generated the response
}

export type StreamData =
  | { type: 'chunk'; content: string }
  | { type: 'done'; conversationId?: string }
  | { type: 'error'; error: string; details?: any };