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
    return data;
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

export const getUserAccessibleModels = async (userId: string): Promise<Array<{ id: string; name: string; provider: string }>> => {
    // Get all models first (from cache or fresh)
    const allModels = await getDatabaseModels();

    // Get user's accessible model UUIDs from user_model_access table
    const { data: accessData, error: accessError } = await supabase
        .from('user_model_access')
        .select('model_id')
        .eq('user_id', userId);

    if (accessError) {
        console.error('Error fetching user model access:', accessError);
        throw accessError;
    }

    if (!accessData || accessData.length === 0) {
        return [];
    }

    // Get the list of model UUIDs the user has access to
    const userAccessModelIds = accessData.map((row: any) => row.model_id);

    // Now get the actual models from models table that match these UUIDs
    const { data: modelData, error: modelError } = await supabase
        .from('models')
        .select('model_id, display_name, provider')
        .in('id', userAccessModelIds);

    if (modelError) {
        console.error('Error fetching accessible models:', modelError);
        throw modelError;
    }

    return modelData?.map(row => ({
        id: row.model_id,
        name: row.display_name,
        provider: row.provider,
    })) || [];
};