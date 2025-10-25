import { supabase } from "@/shared/lib/supabase";

export const getGeneralStats = async (period: 'day' | 'week' | 'month') => {
    const { data, error } = await supabase.rpc('get_general_stats', { period });
    if (error) throw error;
    return data;
};

export const getUserStats = async (userId: string, period: 'day' | 'week' | 'month') => {
    const { data, error } = await supabase.rpc('get_user_stats', { p_user_id: userId, period });
    if (error) throw error;
    return data;
};

export const getModelUsageStats = async (period: 'day' | 'week' | 'month') => {
    const { data, error } = await supabase.rpc('get_model_usage_stats', { period });
    if (error) throw error;
    return data;
};

export const getUserMessageHistory = async (userId: string, period: 'day' | 'week' | 'month', pageSize: number, page: number) => {
    const { data, error } = await supabase.rpc('get_user_message_history', { p_user_id: userId, period, page_size: pageSize, page_number: page });
    if (error) throw error;
    return data;
}

// We can reuse the one from users-api, but for consistency let's have it here too.
export const getAllUsersForStats = async () => {
    const { data, error } = await supabase
        .from('user_profiles')
        .select('id, email');
    if (error) throw error;
    return data;
}
