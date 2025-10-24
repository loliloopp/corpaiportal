import { supabase } from '@/shared/lib/supabase';

export const getUserProfile = async (userId: string) => {
  const { data, error } = await supabase
    .from('user_profiles')
    .select('id, email, daily_request_limit, daily_request_limit_enabled, monthly_request_limit, monthly_request_limit_enabled, daily_token_limit, daily_token_limit_enabled, monthly_token_limit, monthly_token_limit_enabled, created_at, updated_at')
    .eq('id', userId)
    .single();

  if (error && error.code !== 'PGRST116') {
    console.error('Error fetching user profile:', error);
    throw error;
  }

  return data;
};

export const createUserProfile = async (userId: string, email: string) => {
    const { data, error } = await supabase
        .from('user_profiles')
        .insert({ id: userId, email: email })
        .select()
        .single();

    if (error) {
        console.error('Error creating user profile:', error);
        throw error;
    }
    return data;
}

export type UsageLogInsert = {
  user_id: string;
  conversation_id?: string | null;
  model: string;
  prompt_tokens: number;
  completion_tokens: number;
  total_tokens: number;
  status: 'success' | 'error' | 'rate_limited';
}

export const logUsage = async (params: UsageLogInsert) => {
    const { error } = await supabase.from('usage_logs').insert(params);

    if (error) {
        console.error('Error logging usage:', error);
        throw error;
    }

    return true;
};

export const getUsage = async (userId: string) => {
    const today = new Date();
    const monthStart = new Date(today.getFullYear(), today.getMonth(), 1).toISOString();

    const { data, error } = await supabase
        .from('usage_logs')
        .select('total_tokens, created_at')
        .eq('user_id', userId)
        .gte('created_at', monthStart);

    if (error) {
        console.error('Error fetching usage logs:', error);
        throw error;
    }

    const todayStart = new Date(today.getFullYear(), today.getMonth(), today.getDate());

    const dailyLogs = data.filter(log => new Date(log.created_at) >= todayStart);

    const dailyUsage = {
        requests: dailyLogs.length,
        tokens: dailyLogs.reduce((sum, log) => sum + (log.total_tokens || 0), 0),
    };

    const monthlyUsage = {
        requests: data.length,
        tokens: data.reduce((sum, log) => sum + (log.total_tokens || 0), 0),
    };

    return { dailyUsage, monthlyUsage };
}
