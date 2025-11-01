import { Router } from 'express';
import { SupabaseClient } from '@supabase/supabase-js';
import axios from 'axios';
import { LIMITS } from '../../config/limits';

// Simple in-memory cache for OpenRouter models
let cachedModels: any = null;
let cacheTimestamp: number = 0;

export default (supabase: SupabaseClient) => {
    const router = Router();

    router.get('/openrouter-models', async (req, res) => {
        try {
            if (cachedModels && (Date.now() - cacheTimestamp < LIMITS.CACHE_DURATION)) {
                return res.status(200).json(cachedModels);
            }
            const response = await axios.get('https://openrouter.ai/api/v1/models');
            cachedModels = response.data;
            cacheTimestamp = Date.now();
            res.status(200).json(cachedModels);
        } catch (error) {
            console.error('Error fetching from OpenRouter:', error);
            res.status(500).json({ error: 'Failed to fetch models from OpenRouter' });
        }
    });

    router.get('/configured-models', async (req, res) => {
        try {
            const { data, error } = await supabase.from('model_routing_config').select('model_id');
            if (error) throw error;
            const modelIds = data?.map((row: any) => row.model_id) || [];
            res.status(200).json(modelIds);
        } catch (error: any) {
            console.error("Error fetching configured models:", error);
            res.status(500).json({ error: 'Failed to fetch configured models', details: error.message });
        }
    });

    router.get('/models', async (req, res) => {
        try {
            const { data, error } = await supabase.from('models').select('model_id, display_name, provider');
            if (error) throw error;
            const models = data?.map((row: any) => ({
                id: row.model_id,
                name: row.display_name,
                provider: row.provider,
            })) || [];
            res.status(200).json(models);
        } catch (error: any) {
            console.error("Error fetching models:", error);
            res.status(500).json({ error: 'Failed to fetch models', details: error.message });
        }
    });

    router.get('/model-routing', async (req, res) => {
        try {
            const { data: routingConfig, error: routingError } = await supabase
                .from('model_routing_config')
                .select('*');
            
            if (routingError) throw routingError;
            
            const { data: models, error: modelsError } = await supabase
                .from('models')
                .select('model_id, provider, description, approximate_cost');
            
            if (modelsError) throw modelsError;
            
            const providerMap = new Map<string, string>();
            const descriptionMap = new Map<string, string>();
            const costMap = new Map<string, string>();
            models?.forEach((model: any) => {
                providerMap.set(model.model_id, model.provider);
                if (model.description) descriptionMap.set(model.model_id, model.description);
                if (model.approximate_cost) costMap.set(model.model_id, model.approximate_cost);
            });
            
            const result = routingConfig?.map((row: any) => ({
                ...row,
                provider: providerMap.get(row.model_id) || 'openrouter',
                description: descriptionMap.get(row.model_id) || null,
                approximate_cost: costMap.get(row.model_id) || null,
            })) || [];
            
            res.status(200).json(result);
        } catch (error: any) {
            console.error("Error fetching model routing:", error);
            res.status(500).json({ error: 'Failed to fetch model routing configuration', details: error.message });
        }
    });

    router.put('/model-routing/:modelId', async (req, res) => {
        try {
            const { modelId } = req.params;
            const { useOpenRouter, openRouterModelId } = req.body;

            if (typeof useOpenRouter !== 'boolean' || typeof openRouterModelId !== 'string') {
                return res.status(400).json({ error: 'Invalid request body. Expected useOpenRouter (boolean) and openRouterModelId (string).' });
            }

            const { data, error } = await supabase
                .from('model_routing_config')
                .update({ use_openrouter: useOpenRouter, openrouter_model_id: openRouterModelId })
                .eq('model_id', modelId)
                .select()
                .single();

            if (error) throw error;

            res.status(200).json(data);
        } catch (error: any) {
            console.error("Error updating model routing:", error);
            res.status(500).json({ error: 'Failed to update model routing configuration', details: error.message });
        }
    });

    return router;
};
