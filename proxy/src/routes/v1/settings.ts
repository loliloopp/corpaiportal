import { Router } from 'express';
import { SupabaseClient } from '@supabase/supabase-js';

export default (supabase: SupabaseClient) => {
    const router = Router();

    // PUT /api/v1/settings/:settingName (requires auth + admin)
    router.put('/settings/:settingName', async (req, res) => {
        const { settingName } = req.params;
        const { value } = req.body;

        try {
            // Check if user is authenticated (middleware should ensure this)
            if (!req.user) {
                return res.status(401).json({ error: 'Authentication required.' });
            }

            // Check if user is admin
            if (!req.profile || req.profile.role !== 'admin') {
                return res.status(403).json({ error: 'Admin access required.' });
            }

            if (value === undefined || value === null) {
                return res.status(400).json({ error: 'Missing or invalid value in request body.' });
            }

            const { data, error } = await supabase
                .from('settings')
                .update({ value: String(value) })
                .eq('key', settingName)
                .select()
                .single();

            if (error) {
                if (error.code === 'PGRST116') {
                    return res.status(404).json({ error: `Setting '${settingName}' not found.` });
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
