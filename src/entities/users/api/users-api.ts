import { supabase } from "@/shared/lib/supabase";
import { Database } from "@/shared/types/supabase";

export type UserProfile = Database['public']['Tables']['user_profiles']['Row'];

// Get JWT token for authenticated requests
async function getAuthToken(): Promise<string> {
    const { data: { session }, error } = await supabase.auth.getSession();
    if (error || !session) {
        throw new Error('User not authenticated.');
    }
    return session.access_token;
}

// Admin function - requires admin role, uses proxy API
export const getAllUsers = async (): Promise<UserProfile[]> => {
    const token = await getAuthToken();
    const response = await fetch('/api/v1/admin/users', {
        headers: {
            'Authorization': `Bearer ${token}`,
        },
    });

    if (!response.ok) {
        const errorData = await response.json().catch(() => ({ error: 'Failed to fetch users' }));
        throw new Error(errorData.error || 'Failed to fetch users');
    }

    return response.json();
}

// Admin function - requires admin role, uses proxy API
export const updateUserProfile = async (
    userId: string,
    updates: Partial<UserProfile>
): Promise<UserProfile> => {
    const token = await getAuthToken();
    const response = await fetch(`/api/v1/admin/users/${userId}`, {
        method: 'PUT',
        headers: {
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(updates),
    });

    if (!response.ok) {
        const errorData = await response.json().catch(() => ({ error: 'Failed to update user' }));
        throw new Error(errorData.error || 'Failed to update user');
    }

    return response.json();
}

export const getCurrentUserSimpleStats = async (userId: string) => {
    const { data, error } = await supabase.rpc('get_current_user_simple_stats', { p_user_id: userId });
    if (error) throw error;
    return data;
}
