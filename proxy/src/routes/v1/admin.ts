import { Router } from 'express';
import { SupabaseClient } from '@supabase/supabase-js';
import { requireAdmin } from '../../middleware/auth';
import { z } from 'zod';

const userUpdateSchema = z.object({
    daily_request_limit: z.number().int().min(0).max(100000).optional(),
    role: z.enum(['user', 'admin']).optional(),
    display_name: z.string().optional(),
    email: z.string().email().optional(),
});

const modelAddSchema = z.object({
    model_id: z.string().min(1),
    display_name: z.string().min(1),
    openrouter_model_id: z.string().min(1),
    temperature: z.number().min(0).max(2).optional(),
    is_default_access: z.boolean().optional(),
    description: z.string().optional(),
});

export default (supabase: SupabaseClient) => {
    const router = Router();
    router.use(requireAdmin);

    // USER MANAGEMENT
    router.get('/admin/users', async (req, res) => {
        try {
            const { data, error } = await supabase
                .from('user_profiles')
                .select('*')
                .order('created_at', { ascending: false });

            if (error) throw error;
            res.status(200).json(data);
        } catch (error: any) {
            res.status(500).json({ error: 'Failed to fetch users', details: error.message });
        }
    });

    router.put('/admin/users/:userId', async (req, res) => {
        try {
            const { userId } = req.params;
            const validation = userUpdateSchema.safeParse(req.body);
            if (!validation.success) {
                return res.status(400).json({ error: 'Invalid update data', details: validation.error.flatten() });
            }
            const { data, error } = await supabase
                .from('user_profiles')
                .update(validation.data)
                .eq('id', userId)
                .select()
                .single();
            if (error) throw error;
            res.status(200).json(data);
        } catch (error: any) {
            res.status(500).json({ error: 'Failed to update user', details: error.message });
        }
    });

    // MODEL MANAGEMENT
    router.post('/admin/models', async (req, res) => {
        try {
            const validation = modelAddSchema.safeParse(req.body);
            if (!validation.success) {
                return res.status(400).json({ error: 'Invalid model data', details: validation.error.flatten() });
            }
            const { model_id, display_name, openrouter_model_id, temperature, is_default_access, description } = validation.data;

            // Insert into models table
            const { data: newModel, error: modelError } = await supabase
                .from('models')
                .insert({
                    model_id,
                    display_name,
                    provider: 'openrouter', // Default provider
                    temperature: temperature || 0.7,
                    is_default_access: is_default_access || false,
                    description: description || null,
                    approximate_cost: null,
                })
                .select()
                .single();

            if (modelError) throw modelError;

            // Insert into model_routing_config table
            const { error: routingError } = await supabase
                .from('model_routing_config')
                .insert({
                    model_id,
                    use_openrouter: true,
                    openrouter_model_id,
                });

            if (routingError) throw routingError;

            res.status(201).json(newModel);
        } catch (error: any) {
            if (error.code === '23505') { // unique_violation
                return res.status(409).json({ error: 'Model with this ID already exists.' });
            }
            res.status(500).json({ error: 'Failed to add model', details: error.message });
        }
    });

    router.delete('/admin/models/:modelId', async (req, res) => {
        try {
            const { modelId } = req.params;

            // First, find the model by model_id to get its UUID id
            const { data: model, error: findError } = await supabase
                .from('models')
                .select('id')
                .eq('model_id', modelId)
                .single();

            if (findError || !model) {
                return res.status(404).json({ error: `Model '${modelId}' not found.` });
            }

            // Delete from model_routing_config first (uses model_id)
            const { error: routingError } = await supabase
                .from('model_routing_config')
                .delete()
                .eq('model_id', modelId);

            if (routingError) throw routingError;

            // Delete from user_model_access (uses id from models)
            const { error: accessError } = await supabase
                .from('user_model_access')
                .delete()
                .eq('model_id', model.id);

            if (accessError) throw accessError;

            // Finally, delete from models table (uses id)
            const { error: modelError } = await supabase
                .from('models')
                .delete()
                .eq('id', model.id);

            if (modelError) throw modelError;

            res.status(200).json({ message: 'Model deleted successfully' });
        } catch (error: any) {
            res.status(500).json({ error: 'Failed to delete model', details: error.message });
        }
    });

    // Update model description
    router.put('/admin/models/:modelId/description', async (req, res) => {
        try {
            const { modelId } = req.params;
            const { description } = req.body;

            if (description === undefined || description === null) {
                return res.status(400).json({ error: 'Missing description in request body.' });
            }

            const { data, error } = await supabase
                .from('models')
                .update({ description })
                .eq('model_id', modelId)
                .select()
                .single();

            if (error) {
                if (error.code === 'PGRST116') {
                    return res.status(404).json({ error: `Model '${modelId}' not found.` });
                }
                throw error;
            }

            res.status(200).json(data);
        } catch (error: any) {
            res.status(500).json({ error: 'Failed to update model description', details: error.message });
        }
    });

    // Update model approximate cost
    router.put('/admin/models/:modelId/cost', async (req, res) => {
        try {
            const { modelId } = req.params;
            const { approximate_cost } = req.body;

            if (approximate_cost === undefined || approximate_cost === null) {
                return res.status(400).json({ error: 'Missing approximate_cost in request body.' });
            }

            const { data, error } = await supabase
                .from('models')
                .update({ approximate_cost })
                .eq('model_id', modelId)
                .select()
                .single();

            if (error) {
                if (error.code === 'PGRST116') {
                    return res.status(404).json({ error: `Model '${modelId}' not found.` });
                }
                throw error;
            }

            res.status(200).json(data);
        } catch (error: any) {
            res.status(500).json({ error: 'Failed to update model cost', details: error.message });
        }
    });

    return router;
};
