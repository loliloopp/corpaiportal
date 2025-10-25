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
        try {
            // Try to parse the error response as JSON
            const errorData = await response.json();
            if (errorData && typeof errorData.error === 'string') {
                errorMsg = errorData.error;
            }
        } catch (e) {
            // If response is not JSON (e.g., a 404 from Nginx returns HTML), use the response text
            const textError = await response.text();
            errorMsg = textError || errorMsg;
        }
        throw new Error(errorMsg);
    }

    return response.json();
};
