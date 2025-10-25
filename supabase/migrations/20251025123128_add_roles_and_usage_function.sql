-- 1. Create ENUM for user roles
CREATE TYPE public.user_role AS ENUM ('admin', 'user');

-- 2. Add 'role' column to user_profiles table
ALTER TABLE public.user_profiles
ADD COLUMN role public.user_role NOT NULL DEFAULT 'user';

-- 3. Create RPC function to get user usage stats
CREATE OR REPLACE FUNCTION public.get_user_usage_stats(p_user_id uuid)
RETURNS json
STABLE
LANGUAGE plpgsql
AS $$
DECLARE
    requests_count INT;
    requests_limit INT;
BEGIN
    -- Count user requests for today (UTC) from messages where the role is 'user'
    SELECT COUNT(*)
    INTO requests_count
    FROM public.messages
    WHERE user_id = p_user_id
      AND role = 'user'
      AND created_at >= date_trunc('day', now() at time zone 'utc');

    -- Get user's daily limit
    SELECT daily_request_limit
    INTO requests_limit
    FROM public.user_profiles
    WHERE id = p_user_id;

    -- Return result as JSON
    RETURN json_build_object(
        'usage', requests_count,
        'limit', requests_limit
    );
END;
$$;
