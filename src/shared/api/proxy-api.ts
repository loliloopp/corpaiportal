import { supabase } from '@/shared/lib/supabase';

interface Message {
    role: 'user' | 'assistant';
    content: string;
}

export const sendAIRequest = async (model: string, messages: Message[], conversationId: string | null) => {
    const { data: { session }, error: sessionError } = await supabase.auth.getSession();

    if (sessionError || !session) {
        throw new Error('User not authenticated.');
    }

    const response = await fetch('/api/v1/chat', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            model,
            messages,
            jwt: session.access_token,
            conversationId,
        }),
    });

    if (!response.ok) {
        let errorMsg = `Request failed with status ${response.status}`;
        let errorCode: string | undefined;
        
        try {
            // Try to parse the error response as JSON
            const errorData = await response.json();
            if (errorData && typeof errorData.error === 'string') {
                errorMsg = errorData.error;
            }
            if (errorData && errorData.code) {
                errorCode = errorData.code;
            }
        } catch (e) {
            // If response is not JSON (e.g., a 404 from Nginx returns HTML), use the response text
            try {
                const textError = await response.text();
                errorMsg = textError || errorMsg;
            } catch {
                // Fallback to default message
            }
        }
        
        const error = new Error(errorMsg) as Error & { code?: string; status?: number };
        error.code = errorCode;
        error.status = response.status;
        throw error;
    }

    return response.json();
};

// Proxy API helper object for making requests to proxy server endpoints
export const proxyApi = {
    async get<T = any>(endpoint: string): Promise<T> {
        const response = await fetch(endpoint);
        if (!response.ok) {
            throw new Error(`API request failed: ${response.statusText}`);
        }
        return response.json();
    },

    async put<T = any>(endpoint: string, body: any): Promise<T> {
        const response = await fetch(endpoint, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(body),
        });
        if (!response.ok) {
            throw new Error(`API request failed: ${response.statusText}`);
        }
        return response.json();
    },
};