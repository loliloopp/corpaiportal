import { supabase } from "@/shared/lib/supabase";
import { Database } from "@/shared/types/supabase";

export type UserProfile = Database['public']['Tables']['user_profiles']['Row'];

// This should be a server-side only function
export const getAllUsers = async (): Promise<UserProfile[]> => {
    const { data, error } = await supabase
        .from('user_profiles')
        .select('*');

    if (error) {
        console.error('Error fetching all users:', error);
        throw error;
    }

    return data;
}

// This should be a server-side only function
export const updateUserProfile = async (
    userId: string,
    updates: Partial<UserProfile>
): Promise<UserProfile> => {
    const { data, error } = await supabase
        .from('user_profiles')
        .update(updates)
        .eq('id', userId)
        .select()
        .single();
    
    if (error) {
        console.error('Error updating user profile:', error);
        throw error;
    }

    return data;
}
