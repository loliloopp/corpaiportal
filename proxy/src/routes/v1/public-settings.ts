import { Router } from 'express';
import { SupabaseClient } from '@supabase/supabase-js';

export default (supabase: SupabaseClient) => {
    const router = Router();

    // GET /api/v1/settings/:settingName (public, no auth required)
    router.get('/settings/:settingName', async (req, res) => {
        const { settingName } = req.params;
        try {
            let { data, error } = await supabase
                .from('settings')
                .select('*')
                .eq('key', settingName)
                .single();

            if (error && error.code === 'PGRST116') {
                // Setting not found, create it with default values
                console.log(`Setting '${settingName}' not found, creating with defaults...`);
                
                const defaultValues: Record<string, any> = {
                    rag_query_mode: { key: settingName, value: false, rag_reranker_model: null },
                    rag_reranker_model: { key: settingName, value: false, rag_reranker_model: 'BAAI/bge-reranker-v2-m3' },
                    enable_prompt_preprocessing: { key: settingName, value: false, rag_reranker_model: null },
                    show_cost_in_selector: { key: settingName, value: false, rag_reranker_model: null }
                };

                const defaultValue = defaultValues[settingName] || { key: settingName, value: false, rag_reranker_model: null };

                const { data: newData, error: insertError } = await supabase
                    .from('settings')
                    .insert(defaultValue)
                    .select()
                    .single();

                if (insertError) throw insertError;
                
                console.log(`Setting '${settingName}' created successfully`);
                return res.status(200).json(newData);
            }

            if (error) throw error;

            res.status(200).json(data);
        } catch (error: any) {
            console.error(`Error fetching setting '${settingName}':`, error);
            res.status(500).json({ error: `Failed to fetch setting '${settingName}'`, details: error.message });
        }
    });

    return router;
};

