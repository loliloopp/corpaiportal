CREATE OR REPLACE FUNCTION get_current_user_simple_stats(p_user_id UUID)
RETURNS json AS $$
DECLARE
    result json;
    total_requests BIGINT;
    weekly_requests BIGINT;
BEGIN
    -- Get total requests
    SELECT count(*)
    INTO total_requests
    FROM public.messages
    WHERE user_id = p_user_id AND role = 'user';

    -- Get weekly requests
    SELECT count(*)
    INTO weekly_requests
    FROM public.messages
    WHERE user_id = p_user_id 
      AND role = 'user'
      AND created_at >= date_trunc('week', now() at time zone 'utc');

    SELECT json_build_object(
        'total', total_requests,
        'weekly', weekly_requests
    )
    INTO result;
    RETURN result;
END;
$$ LANGUAGE plpgsql;
