import { Router } from 'express';
import { SupabaseClient } from '@supabase/supabase-js';
import { requireAdmin } from '../../middleware/auth';
import { z } from 'zod';
import { validate, userUpdateSchema, modelAddSchema } from '../../middleware/validation';

export default (supabase: SupabaseClient) => {
    const router = Router();
    router.use(requireAdmin);

    // User management
    router.get('/users', async (req, res) => {
        try {
            const { data: users, error } = await supabase.from('user_profiles').select('*');
            if (error) throw error;
            res.status(200).json(users);
        } catch (error: any) {
            req.log.error({ err: error }, 'Failed to get all users.');
            res.status(500).json({ error: 'Failed to retrieve users', details: error.message });
        }
    });

    router.put('/users/:userId', validate(userUpdateSchema), async (req, res) => {
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
            req.log.error({ err: error, userId: req.params.userId }, 'Failed to update user.');
            res.status(500).json({ error: 'Failed to update user', details: error.message });
        }
    });

    // Model management
    router.post('/models', async (req, res) => {
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

    router.delete('/models/:modelId', async (req, res) => {
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
            req.log.error({ err: error, modelId: req.params.modelId }, 'Failed to delete model.');
            res.status(500).json({ error: 'Failed to delete model', details: error.message });
        }
    });

    // Update model description
    router.put('/models/:modelId/description', async (req, res) => {
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
            req.log.error({ err: error, modelId: req.params.modelId }, 'Failed to update model description.');
            res.status(500).json({ error: 'Failed to update model description', details: error.message });
        }
    });

    // Update model approximate cost
    router.put('/models/:modelId/cost', async (req, res) => {
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
            req.log.error({ err: error, modelId: req.params.modelId }, 'Failed to update model cost.');
            res.status(500).json({ error: 'Failed to update model cost', details: error.message });
        }
    });

    return router;
};
