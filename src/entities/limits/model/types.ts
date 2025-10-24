export interface UserProfile {
  id: string;
  email: string | null;
  daily_request_limit: number;
  daily_request_limit_enabled: boolean;
  monthly_request_limit: number;
  monthly_request_limit_enabled: boolean;
  daily_token_limit: number;
  daily_token_limit_enabled: boolean;
  monthly_token_limit: number;
  monthly_token_limit_enabled: boolean;
  created_at: string;
  updated_at: string;
}

export interface UsageLog {
  id: string;
  user_id: string;
  conversation_id: string | null;
  model: string | null;
  prompt_tokens: number | null;
  completion_tokens: number | null;
  total_tokens: number | null;
  status: 'success' | 'error' | 'rate_limited' | null;
  created_at: string;
}
