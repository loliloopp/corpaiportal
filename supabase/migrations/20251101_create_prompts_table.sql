-- Create prompts table for storing AI roles and their configurations
CREATE TABLE public.prompts (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    role_name text NOT NULL UNIQUE,
    system_prompt text NOT NULL,
    temperature numeric(3, 2),
    "top_p" numeric(3, 2),
    created_by uuid NOT NULL REFERENCES public.user_profiles(id) ON DELETE SET NULL,
    by_default boolean DEFAULT false,
    created_at timestamp DEFAULT now(),
    updated_at timestamp DEFAULT now()
);

-- Create index for by_default to find default role quickly
CREATE INDEX idx_prompts_by_default ON public.prompts(by_default) WHERE by_default = true;

-- Grant permissions for service_role
GRANT SELECT, INSERT, UPDATE, DELETE ON public.prompts TO service_role;

-- Add enable_prompt_preprocessing column to settings table
ALTER TABLE public.settings ADD COLUMN enable_prompt_preprocessing boolean DEFAULT false;
