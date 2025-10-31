-- Disable RLS on all tables (security is handled via proxy, not RLS)
ALTER TABLE public.conversations DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.messages DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.models DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.model_routing_config DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_model_access DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_profiles DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.usage_logs DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.settings DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.prompts DISABLE ROW LEVEL SECURITY;

-- Grant permissions to anon role (for public read access via proxy)
GRANT SELECT ON public.prompts TO anon;

-- Grant permissions to authenticated role
GRANT SELECT, INSERT, UPDATE, DELETE ON public.prompts TO authenticated;

-- Grant permissions to service_role (for proxy operations)
GRANT SELECT, INSERT, UPDATE, DELETE ON public.prompts TO service_role;
