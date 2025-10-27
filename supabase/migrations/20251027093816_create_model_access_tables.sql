CREATE TABLE models (
    id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
    model_id text NOT NULL UNIQUE,
    display_name text NOT NULL,
    provider text NOT NULL,
    temperature real NOT NULL DEFAULT 0.7,
    is_default_access boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE user_model_access (
    user_id uuid NOT NULL REFERENCES public.user_profiles(id) ON DELETE CASCADE,
    model_id uuid NOT NULL REFERENCES models(id) ON DELETE CASCADE,
    created_at timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id, model_id)
);

CREATE INDEX idx_user_model_access_user_id ON user_model_access(user_id);
CREATE INDEX idx_user_model_access_model_id ON user_model_access(model_id);

GRANT SELECT, INSERT, UPDATE, DELETE ON models TO service_role;
GRANT SELECT ON models TO authenticated;

GRANT SELECT, INSERT, DELETE ON user_model_access TO service_role;
GRANT SELECT ON user_model_access TO authenticated;

INSERT INTO models (model_id, display_name, provider, is_default_access)
VALUES
    ('gpt-5', 'GPT-5', 'openai', false),
    ('gpt-5-mini', 'GPT-5 Mini', 'openai', true),
    ('deepseek-chat', 'DeepSeek Chat', 'deepseek', false),
    ('gemini-2.5-pro', 'Google Gemini 2.5 Pro', 'gemini', false),
    ('gemini-2.5-flash', 'Google Gemini 2.5 Flash', 'gemini', false),
    ('grok-4-fast', 'Grok 4 Fast', 'grok', true);
