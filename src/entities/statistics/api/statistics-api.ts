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
    const { data, error } = await supabase.rpc('get_user_message_history', { 
        p_user_id: userId, 
        period, 
        p_page_size: pageSize, 
        p_page_number: page 
    });
    if (error) throw error;
    return data;
}

export const getUserModelUsageStats = async (userId: string, period: 'day' | 'week' | 'month') => {
    const { data, error } = await supabase.rpc('get_user_model_usage_stats', { 
        p_user_id: userId, 
        period 
    });
    if (error) throw error;
    return data;
}

// Admin function - uses proxy API for consistency
export const getAllUsersForStats = async () => {
    const { getAllUsers } = await import('@/entities/users/api/users-api');
    const users = await getAllUsers();
    // Return only needed fields for stats
    return users.map(user => ({
        id: user.id,
        email: user.email,
        display_name: user.display_name,
    }));
}
