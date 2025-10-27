-- Function to set a user's permission for a specific model
CREATE OR REPLACE FUNCTION public.set_user_model_permission(p_user_id uuid, p_model_id uuid, p_has_access boolean)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER -- To allow service_role to modify permissions
AS $$
BEGIN
    IF p_has_access THEN
        -- Grant access by inserting a record, ignoring if it already exists
        INSERT INTO public.user_model_access (user_id, model_id)
        VALUES (p_user_id, p_model_id)
        ON CONFLICT (user_id, model_id) DO NOTHING;
    ELSE
        -- Revoke access by deleting the record
        DELETE FROM public.user_model_access
        WHERE user_id = p_user_id AND model_id = p_model_id;
    END IF;
END;
$$;
COMMENT ON FUNCTION public.set_user_model_permission(uuid, uuid, boolean) IS 'Grants or revokes a user''s access to a specific model. To be called by admin users.';

-- Function to get all models and indicate which ones are available to a specific user
CREATE OR REPLACE FUNCTION public.get_available_models_for_user(p_user_id uuid)
RETURNS TABLE(
    id uuid,
    model_id text,
    display_name text,
    provider text,
    temperature real,
    has_access boolean
)
LANGUAGE sql
STABLE
AS $$
    SELECT
        m.id,
        m.model_id,
        m.display_name,
        m.provider,
        m.temperature,
        (
            m.is_default_access OR
            EXISTS (
                SELECT 1
                FROM public.user_model_access uma
                WHERE uma.user_id = p_user_id AND uma.model_id = m.id
            )
        ) as has_access
    FROM
        public.models m
    ORDER BY
        m.provider, m.display_name;
$$;
COMMENT ON FUNCTION public.get_available_models_for_user(uuid) IS 'Returns all models, indicating whether the specified user has access to each.';


-- Function to check if a user has access to a specific model by its text ID
CREATE OR REPLACE FUNCTION public.check_model_access(p_user_id uuid, p_model_id text)
RETURNS boolean
LANGUAGE sql
STABLE
AS $$
    SELECT EXISTS (
        SELECT 1
        FROM public.models m
        LEFT JOIN public.user_model_access uma ON m.id = uma.model_id AND uma.user_id = p_user_id
        WHERE m.model_id = p_model_id AND (m.is_default_access OR uma.user_id IS NOT NULL)
    );
$$;
COMMENT ON FUNCTION public.check_model_access(uuid, text) IS 'Checks if a user has access to a model by its text ID. Returns true if access is granted, false otherwise.';


-- Grant execution permissions
GRANT EXECUTE ON FUNCTION public.set_user_model_permission(uuid, uuid, boolean) TO service_role;
GRANT EXECUTE ON FUNCTION public.get_available_models_for_user(uuid) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.check_model_access(uuid, text) TO service_role;
