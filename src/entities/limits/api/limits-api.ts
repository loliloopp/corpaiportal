import { supabase } from '@/shared/lib/supabase';
import { LogData } from './model/types';

export const logUsage = async (logData: Partial<LogData>) => {
  const { error } = await supabase.from('usage_logs').insert([logData]);
  if (error) {
    console.error('Error logging usage:', error);
  }
};
