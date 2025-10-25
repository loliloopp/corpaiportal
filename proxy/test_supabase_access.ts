// Test Supabase access with service_role key
import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error('Supabase URL or Service Role Key is not defined in environment variables.');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

(async () => {
    try {
        const { data, error } = await supabase
            .from('test_table')
            .insert({ content: 'This is a test insert from service_role' })
            .select();

        if (error) throw error;
        console.log('Test successful! Inserted data:', data);
    } catch (error) {
        console.error('Test failed with error:', error.message);
    }
})();
