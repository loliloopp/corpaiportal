import { supabase } from "@/shared/lib/supabase";

export const checkUsageLimit = async () => {
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    // Or handle anonymous users appropriately
    return;
  }

  const { data, error } = await supabase.rpc('get_user_usage_stats', { p_user_id: user.id });

  if (error) {
    console.error('Error fetching usage stats:', error);
    // Decide if you want to block the request or not
    return;
  }

  if (data.usage >= data.limit) {
    throw new Error('Дневной лимит запросов исчерпан.');
  }
};
