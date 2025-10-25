-- 1. Enable RLS for the tables if not already enabled.
ALTER TABLE public.conversations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.messages ENABLE ROW LEVEL SECURITY;

-- 2. Drop any existing policies for service_role to avoid conflicts.
DROP POLICY IF EXISTS "Allow full access to service_role" ON public.conversations;
DROP POLICY IF EXISTS "Allow full access to service_role" ON public.messages;

-- 3. Create a new policy that grants full access to the 'service_role'.
-- This policy allows any action (SELECT, INSERT, UPDATE, DELETE) on the table
-- for any request that is authenticated with the service_role key.
CREATE POLICY "Allow full access to service_role"
ON public.conversations
FOR ALL
TO service_role
USING (true)
WITH CHECK (true);

CREATE POLICY "Allow full access to service_role"
ON public.messages
FOR ALL
TO service_role
USING (true)
WITH CHECK (true);
