DROP FUNCTION IF EXISTS get_general_stats(text);
CREATE OR REPLACE FUNCTION get_general_stats(period TEXT)
RETURNS json AS $$
DECLARE
    result json;
BEGIN
    SELECT json_agg(t)
    INTO result
    FROM (
        SELECT
            to_char(date_trunc(period, created_at), 'YYYY-MM-DD') AS date_trunc,
            count(*) AS total_requests,
            sum(total_tokens) AS total_tokens
        FROM public.usage_logs
        WHERE status = 'success'
        GROUP BY 1
        ORDER BY 1
    ) t;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS get_user_stats(uuid, text);
CREATE OR REPLACE FUNCTION get_user_stats(p_user_id UUID, period TEXT)
RETURNS json AS $$
DECLARE
    result json;
BEGIN
     SELECT json_agg(t)
    INTO result
    FROM (
        SELECT
            to_char(date_trunc(period, created_at), 'YYYY-MM-DD') AS date_trunc,
            count(*) AS total_requests,
            sum(total_tokens) AS total_tokens
        FROM public.usage_logs
        WHERE user_id = p_user_id AND status = 'success'
        GROUP BY 1
        ORDER BY 1
    ) t;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS get_model_usage_stats();
CREATE OR REPLACE FUNCTION get_model_usage_stats(period TEXT)
RETURNS json AS $$
DECLARE
    result json;
BEGIN
    SELECT json_agg(t)
    INTO result
    FROM (
        SELECT
            model,
            count(*) AS total_requests,
            sum(total_tokens) AS total_tokens
        FROM public.usage_logs
        WHERE status = 'success' AND created_at >= date_trunc(period, now() at time zone 'utc')
        GROUP BY 1
        ORDER BY 1
    ) t;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS get_user_message_history(uuid, text, integer, integer);
CREATE OR REPLACE FUNCTION get_user_message_history(p_user_id UUID, period TEXT, p_page_size INT, p_page_number INT)
RETURNS json AS $$
DECLARE
    result json;
    total_count BIGINT;
    offset_val INT;
BEGIN
    offset_val := (p_page_number - 1) * p_page_size;

    -- Get total count first
    SELECT count(*)
    INTO total_count
    FROM public.messages m
    WHERE m.user_id = p_user_id 
      AND m.role = 'user'
      AND m.created_at >= date_trunc(period, now() at time zone 'utc');

    -- Then get paginated data
    SELECT json_build_object(
        'total', total_count,
        'data', COALESCE(json_agg(t), '[]'::json)
    )
    INTO result
    FROM (
        SELECT 
            to_char(m.created_at, 'YYYY-MM-DD HH24:MI:SS') as created_at,
            m.content,
            m.model,
            ul.total_tokens
        FROM public.messages m
        LEFT JOIN public.usage_logs ul ON m.id = ul.message_id
        WHERE m.user_id = p_user_id 
          AND m.role = 'user'
          AND m.created_at >= date_trunc(period, now() at time zone 'utc')
        ORDER BY m.created_at DESC
        LIMIT p_page_size
        OFFSET offset_val
    ) t;

    RETURN result;
END;
$$ LANGUAGE plpgsql;
