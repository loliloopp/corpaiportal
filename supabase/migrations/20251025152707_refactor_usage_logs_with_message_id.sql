-- Add the new message_id column with a foreign key constraint
ALTER TABLE public.usage_logs
ADD COLUMN message_id UUID REFERENCES public.messages(id) ON DELETE SET NULL;

-- Note: We are not backfilling data as it's complex. 
-- New logs will have message_id, old ones will be NULL.

-- Drop the old conversation_id column
ALTER TABLE public.usage_logs
DROP COLUMN IF EXISTS conversation_id;
