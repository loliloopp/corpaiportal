import { Router } from 'express';
import { SupabaseClient } from '@supabase/supabase-js';

export default (supabase: SupabaseClient) => {
    const router = Router();

    // PUT /api/v1/settings/:settingName (requires auth + admin)
    router.put('/settings/:settingName', async (req, res) => {
        const { settingName } = req.params;
        const { value, rag_reranker_model } = req.body;

        try {
            // Check if user is authenticated (middleware should ensure this)
            if (!req.user) {
                return res.status(401).json({ error: 'Authentication required.' });
            }

            // Check if user is admin
            if (!req.profile || req.profile.role !== 'admin') {
                return res.status(403).json({ error: 'Admin access required.' });
            }

            // Determine what to update based on setting name
            let updateData: any = {};
            
            if (settingName === 'rag_reranker_model' && rag_reranker_model !== undefined) {
                // Update rag_reranker_model column
                updateData.rag_reranker_model = rag_reranker_model;
            } else if (value !== undefined) {
                // Update value column for other settings
                updateData.value = value === true || value === 'true' ? true : (value === false || value === 'false' ? false : value);
            } else {
                return res.status(400).json({ error: 'Missing value or rag_reranker_model in request body.' });
            }

            // Try to update existing setting
            const { data, error } = await supabase
                .from('settings')
                .update(updateData)
                .eq('key', settingName)
                .select()
                .single();

            if (error) {
                if (error.code === 'PGRST116') {
                    // Record doesn't exist, create it
                    console.log(`Setting '${settingName}' not found, creating...`);
                    const insertData = { key: settingName, ...updateData };
                    const { data: newData, error: insertError } = await supabase
                        .from('settings')
                        .insert(insertData)
                        .select()
                        .single();

                    if (insertError) throw insertError;
                    return res.status(200).json(newData);
                }
                throw error;
            }

            res.status(200).json(data);
        } catch (error: any) {
            console.error(`Error updating setting '${settingName}':`, error);
            res.status(500).json({ error: `Failed to update setting '${settingName}'`, details: error.message });
        }
    });

    return router;
};
