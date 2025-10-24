-- Create user_profiles table
CREATE TABLE public.user_profiles (
    id uuid NOT NULL PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email text,
    daily_request_limit integer DEFAULT 100 NOT NULL,
    daily_request_limit_enabled boolean DEFAULT true NOT NULL,
    monthly_request_limit integer DEFAULT 3000 NOT NULL,
    monthly_request_limit_enabled boolean DEFAULT true NOT NULL,
    daily_token_limit integer DEFAULT 100000 NOT NULL,
    daily_token_limit_enabled boolean DEFAULT true NOT NULL,
    monthly_token_limit integer DEFAULT 3000000 NOT NULL,
    monthly_token_limit_enabled boolean DEFAULT true NOT NULL,
    created_at timestamptz(6) DEFAULT now() NOT NULL,
    updated_at timestamptz(6) DEFAULT now() NOT NULL
);

-- Function to update updated_at column
CREATE OR REPLACE FUNCTION public.handle_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to update updated_at on user_profiles
CREATE TRIGGER on_user_profiles_updated
BEFORE UPDATE ON public.user_profiles
FOR EACH ROW
EXECUTE FUNCTION public.handle_updated_at();

-- Create usage_logs table
CREATE TABLE public.usage_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL PRIMARY KEY,
    user_id uuid NOT NULL REFERENCES public.user_profiles(id) ON DELETE CASCADE,
    conversation_id uuid REFERENCES public.conversations(id) ON DELETE SET NULL,
    model text,
    prompt_tokens integer,
    completion_tokens integer,
    total_tokens integer,
    status text,
    created_at timestamptz(6) DEFAULT now() NOT NULL
);

-- Add indexes
CREATE INDEX ix_usage_logs_user_id_created_at ON public.usage_logs (user_id, created_at);

-- Grant permissions to authenticated role
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.user_profiles TO authenticated;
GRANT SELECT, INSERT ON TABLE public.usage_logs TO authenticated;

-- Grant permissions to anon role
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.user_profiles TO anon;
GRANT SELECT, INSERT ON TABLE public.usage_logs TO anon;
