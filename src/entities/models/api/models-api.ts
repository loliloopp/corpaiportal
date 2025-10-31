import { supabase } from '@/shared/lib/supabase';
import { proxyApi } from '@/shared/api/proxy-api';

// This corresponds to the return type of the get_available_models_for_user RPC
export interface ModelWithAccess {
    id: string;
    model_id: string;
    display_name: string;
    provider: string;
    temperature: number;
    has_access: boolean;
}

export const getModelsWithAccess = async (userId: string): Promise<ModelWithAccess[]> => {
    const { data, error } = await supabase.rpc('get_available_models_for_user', {
        p_user_id: userId,
    });

    if (error) {
        console.error('Error fetching models with access:', error);
        throw error;
    }
    return data || [];
};

/**
 * Get model access for all users at once using optimized query
 * Returns a map: userId -> ModelWithAccess[]
 */
export const getAllUsersModelAccess = async (userIds: string[]): Promise<Map<string, ModelWithAccess[]>> => {
    if (userIds.length === 0) {
        return new Map();
    }

    // Get all models first
    const { data: allModels, error: modelsError } = await supabase
        .from('models')
        .select('id, model_id, display_name, provider, temperature');

    if (modelsError) {
        console.error('Error fetching all models:', modelsError);
        throw modelsError;
    }

    if (!allModels || allModels.length === 0) {
        return new Map();
    }

    // Get all user_model_access records for these users in one query
    // Note: model_id in user_model_access is UUID referencing models.id
    const { data: accessData, error: accessError } = await supabase
        .from('user_model_access')
        .select('user_id, model_id')
        .in('user_id', userIds);

    if (accessError) {
        console.error('Error fetching user model access:', accessError);
        throw accessError;
    }

    // Build access map: userId -> Set<modelUUID>
    const accessMap = new Map<string, Set<string>>();
    userIds.forEach(userId => {
        accessMap.set(userId, new Set());
    });

    accessData?.forEach((row: { user_id: string; model_id: string }) => {
        const userAccess = accessMap.get(row.user_id);
        if (userAccess) {
            // model_id in user_model_access is UUID (models.id), not model_id text
            userAccess.add(row.model_id);
        }
    });

    // Build result map: userId -> ModelWithAccess[]
    const result = new Map<string, ModelWithAccess[]>();
    
    userIds.forEach(userId => {
        const userAccessSet = accessMap.get(userId) || new Set();
        const models: ModelWithAccess[] = allModels.map((model: { id: string; model_id: string; display_name: string; provider: string; temperature: number }) => ({
            id: model.id,
            model_id: model.model_id,
            display_name: model.display_name,
            provider: model.provider,
            temperature: model.temperature,
            // Check access by UUID (models.id), not by model_id text
            has_access: userAccessSet.has(model.id),
        }));
        result.set(userId, models);
    });

    return result;
};

export const setModelPermission = async (userId: string, modelId: string, hasAccess: boolean) => {
    const { error } = await supabase.rpc('set_user_model_permission', {
        p_user_id: userId,
        p_model_id: modelId,
        p_has_access: hasAccess,
    });

    if (error) {
        console.error('Error setting model permission:', error);
        throw error;
    }
    return null;
};

export const getConfiguredModels = async (): Promise<string[]> => {
    const response = await proxyApi.get<string[]>('/api/v1/configured-models');
    return response;
};

export const getDatabaseModels = async (): Promise<Array<{ id: string; name: string; provider: string }>> => {
    const response = await proxyApi.get<Array<{ id: string; name: string; provider: string }>>('/api/v1/models');
    return response;
};

export interface AccessibleModel {
    id: string;
    name: string;
    provider: string;
}

/**
 * Optimized version using RPC function with JOIN instead of 2 separate queries
 */
export const getUserAccessibleModels = async (userId: string): Promise<AccessibleModel[]> => {
    // Use RPC function that already does JOIN and returns models with has_access flag
    const { data, error } = await supabase.rpc('get_available_models_for_user', {
        p_user_id: userId,
    });

    if (error) {
        console.error('Error fetching accessible models:', error);
        throw error;
    }

    if (!data || data.length === 0) {
        return [];
    }

    // Filter only models with access and transform to required format
    return data
        .filter((model: ModelWithAccess) => model.has_access === true)
        .map((model: ModelWithAccess) => ({
            id: model.model_id,
            name: model.display_name,
            provider: model.provider,
        }));
};

export interface AddModelRequest {
    model_id: string;
    display_name: string;
    openrouter_model_id: string;
    description?: string;
}

export interface AddModelResponse {
    id: string;
    model_id: string;
    display_name: string;
    provider: string;
}

/**
 * Add a new model from OpenRouter
 */
export const addModelFromOpenRouter = async (modelData: AddModelRequest): Promise<AddModelResponse> => {
    const { data: { session }, error: sessionError } = await supabase.auth.getSession();

    if (sessionError || !session) {
        throw new Error('User not authenticated.');
    }

    const response = await fetch('/api/v1/admin/models', {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${session.access_token}`,
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(modelData),
    });

    if (!response.ok) {
        let errorData: { error?: string; details?: string } | undefined;
        try {
            errorData = await response.json();
        } catch {
            // Ignore JSON parse errors
        }
        throw new Error(errorData?.error || `Failed to add model: ${response.statusText}`);
    }

    return response.json();
};

/**
 * Delete a model and its routing config
 */
export const deleteModel = async (modelId: string): Promise<void> => {
    const { data: { session }, error: sessionError } = await supabase.auth.getSession();

    if (sessionError || !session) {
        throw new Error('User not authenticated.');
    }

    const response = await fetch(`/api/v1/admin/models/${modelId}`, {
        method: 'DELETE',
        headers: {
            'Authorization': `Bearer ${session.access_token}`,
            'Content-Type': 'application/json',
        },
    });

    if (!response.ok) {
        let errorData: { error?: string; details?: string } | undefined;
        try {
            errorData = await response.json();
        } catch {
            // Ignore JSON parse errors
        }
        throw new Error(errorData?.error || `Failed to delete model: ${response.statusText}`);
    }
};

/**
 * Get model descriptions from database with in-memory caching
 * Returns a map: modelId -> description
 */
let descriptionsCache: Map<string, string | null> | null = null;
let descriptionsCacheTime: number = 0;
const DESCRIPTIONS_CACHE_DURATION = 5 * 60 * 1000; // 5 minutes

export const getModelDescriptions = async (): Promise<Map<string, string | null>> => {
    const now = Date.now();
    
    // Return cached descriptions if still valid
    if (descriptionsCache && (now - descriptionsCacheTime) < DESCRIPTIONS_CACHE_DURATION) {
        return descriptionsCache;
    }
    
    try {
        const { data: models, error } = await supabase
            .from('models')
            .select('model_id, description');
        
        if (error) throw error;
        
        const descMap = new Map<string, string | null>();
        models?.forEach((model: any) => {
            descMap.set(model.model_id, model.description || null);
        });
        
        // Update cache
        descriptionsCache = descMap;
        descriptionsCacheTime = now;
        
        return descMap;
    } catch (error) {
        console.error('Error fetching model descriptions:', error);
        // Return empty map on error instead of throwing
        return new Map();
    }
};

/**
 * Get model costs from database with in-memory caching
 * Returns a map: modelId -> approximate_cost
 */
let costsCache: Map<string, string | null> | null = null;
let costsCacheTime: number = 0;
const COSTS_CACHE_DURATION = 5 * 60 * 1000; // 5 minutes

export const getModelCosts = async (): Promise<Map<string, string | null>> => {
    const now = Date.now();
    
    // Return cached costs if still valid
    if (costsCache && (now - costsCacheTime) < COSTS_CACHE_DURATION) {
        return costsCache;
    }
    
    try {
        const { data: models, error } = await supabase
            .from('models')
            .select('model_id, approximate_cost');
        
        if (error) throw error;
        
        const costMap = new Map<string, string | null>();
        models?.forEach((model: any) => {
            costMap.set(model.model_id, model.approximate_cost || null);
        });
        
        // Update cache
        costsCache = costMap;
        costsCacheTime = now;
        
        return costMap;
    } catch (error) {
        console.error('Error fetching model costs:', error);
        // Return empty map on error instead of throwing
        return new Map();
    }
};

/**
 * Get a boolean setting by key via proxy
 */
export const getSetting = async (key: string): Promise<boolean> => {
    try {
        const response = await fetch(`/api/v1/settings/${key}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        });
        
        if (response.status === 404) {
            // Setting doesn't exist, return false (this is normal for first access)
            return false;
        }
        
        if (!response.ok) {
            throw new Error(`Failed to fetch setting: ${response.statusText}`);
        }
        
        const data = await response.json();
        return data.value ?? false;
    } catch (error) {
        // Silently return false on error - 404 is expected and normal
        return false;
    }
};

/**
 * Update or create a boolean setting via proxy
 */
export const setSetting = async (key: string, value: boolean): Promise<void> => {
    try {
        const response = await fetch(`/api/v1/settings/${key}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ value }),
        });

        if (!response.ok) {
            const error = await response.json();
            throw new Error(error.error || 'Failed to save setting');
        }
    } catch (error) {
        console.error('Error updating setting:', error);
        throw error;
    }
};