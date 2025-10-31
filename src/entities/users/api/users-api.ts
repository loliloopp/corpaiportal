import { supabase } from "@/shared/lib/supabase";
import { Database } from "@/shared/types/supabase";
import { APIError, parseAPIError } from "@/shared/lib/error-handler";

export type UserProfile = Database['public']['Tables']['user_profiles']['Row'];

// Get JWT token for authenticated requests
async function getAuthToken(): Promise<string> {
    const { data: { session }, error } = await supabase.auth.getSession();
    if (error || !session) {
        throw new APIError('User not authenticated.', 401, 'AUTH_REQUIRED');
    }
    return session.access_token;
}

// Admin function - requires admin role, uses proxy API
export const getAllUsers = async (): Promise<UserProfile[]> => {
    try {
        const token = await getAuthToken();
        const response = await fetch('/api/v1/admin/users', {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        });

        if (!response.ok) {
            let errorData: { error?: string; code?: string } | undefined;
            try {
                errorData = await response.json();
            } catch {
                // Ignore JSON parse errors
            }
            throw parseAPIError(response, errorData);
        }

        return response.json();
    } catch (error) {
        if (error instanceof APIError) {
            throw error;
        }
        throw new APIError('Failed to fetch users', 500, 'FETCH_ERROR', error);
    }
}

// Admin function - requires admin role, uses proxy API
export const updateUserProfile = async (
    userId: string,
    updates: Partial<UserProfile>
): Promise<UserProfile> => {
    try {
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
            let errorData: { error?: string; code?: string } | undefined;
            try {
                errorData = await response.json();
            } catch {
                // Ignore JSON parse errors
            }
            throw parseAPIError(response, errorData);
        }

        return response.json();
    } catch (error) {
        if (error instanceof APIError) {
            throw error;
        }
        throw new APIError('Failed to update user', 500, 'UPDATE_ERROR', error);
    }
}

export const getCurrentUserSimpleStats = async (userId: string) => {
    const { data, error } = await supabase.rpc('get_current_user_simple_stats', { p_user_id: userId });
    if (error) throw error;
    return data;
}
