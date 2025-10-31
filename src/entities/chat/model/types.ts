export interface Message {
  id: string;
  role: 'user' | 'assistant';
  content: string;
  model?: string | null; // model_id of the AI model that generated the response
}
