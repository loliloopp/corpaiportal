export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      conversations: {
        Row: {
          id: string
          user_id: string
          title: string
          created_at: string
        }
        Insert: {
          id?: string
          user_id: string
          title: string
          created_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          title?: string
          created_at?: string
        }
      }
      messages: {
        Row: {
          id: string
          conversation_id: string
          user_id: string
          role: "user" | "assistant"
          content: string
          model: string | null
          created_at: string
        }
        Insert: {
          id?: string
          conversation_id: string
          user_id: string
          role: "user" | "assistant"
          content: string
          model?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          conversation_id?: string
          user_id?: string
          role?: "user" | "assistant"
          content?: string
          model?: string | null
          created_at?: string
        }
      }
      models: {
        Row: {
          id: string
          model_id: string
          display_name: string
          provider: string
          temperature: number
          is_default_access: boolean
          description: string | null
          approximate_cost: string | null
          created_at: string
        }
        Insert: {
          id?: string
          model_id: string
          display_name: string
          provider: string
          temperature?: number
          is_default_access?: boolean
          description?: string | null
          approximate_cost?: string | null
          created_at?: string
        }
        Update: {
          id?: string
          model_id?: string
          display_name?: string
          provider?: string
          temperature?: number
          is_default_access?: boolean
          description?: string | null
          approximate_cost?: string | null
          created_at?: string
        }
      }
      settings: {
        Row: {
          id: string
          key: string
          value: boolean
          enable_prompt_preprocessing: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          key: string
          value?: boolean
          enable_prompt_preprocessing?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          key?: string
          value?: boolean
          enable_prompt_preprocessing?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      prompts: {
        Row: {
          id: string
          role_name: string
          system_prompt: string
          temperature: number | null
          top_p: number | null
          created_by: string
          by_default: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          role_name: string
          system_prompt: string
          temperature?: number | null
          top_p?: number | null
          created_by: string
          by_default?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          role_name?: string
          system_prompt?: string
          temperature?: number | null
          top_p?: number | null
          created_by?: string
          by_default?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      user_profiles: {
        Row: {
          id: string
          email: string | null
          daily_request_limit: number
          daily_request_limit_enabled: boolean
          monthly_request_limit: number
          monthly_request_limit_enabled: boolean
          daily_token_limit: number
          daily_token_limit_enabled: boolean
          monthly_token_limit: number
          monthly_token_limit_enabled: boolean
          created_at: string
          updated_at: string
        }
        Insert: {
          id: string
          email?: string | null
          daily_request_limit?: number
          daily_request_limit_enabled?: boolean
          monthly_request_limit?: number
          monthly_request_limit_enabled?: boolean
          daily_token_limit?: number
          daily_token_limit_enabled?: boolean
          monthly_token_limit?: number
          monthly_token_limit_enabled?: boolean
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          email?: string | null
          daily_request_limit?: number
          daily_request_limit_enabled?: boolean
          monthly_request_limit?: number
          monthly_request_limit_enabled?: boolean
          daily_token_limit?: number
          daily_token_limit_enabled?: boolean
          monthly_token_limit?: number
          monthly_token_limit_enabled?: boolean
          created_at?: string
          updated_at?: string
        }
      }
      usage_logs: {
        Row: {
          id: string
          user_id: string
          conversation_id: string | null
          model: string | null
          prompt_tokens: number | null
          completion_tokens: number | null
          total_tokens: number | null
          status: string | null
          cost: number | null
          created_at: string
        }
        Insert: {
          id?: string
          user_id: string
          conversation_id?: string | null
          model?: string | null
          prompt_tokens?: number | null
          completion_tokens?: number | null
          total_tokens?: number | null
          status?: string | null
          cost?: number | null
          created_at?: string
        }
        Update: {
          id?: string
          user_id?: string
          conversation_id?: string | null
          model?: string | null
          prompt_tokens?: number | null
          completion_tokens?: number | null
          total_tokens?: number | null
          status?: string | null
          cost?: number | null
          created_at?: string
        }
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
  }
}
