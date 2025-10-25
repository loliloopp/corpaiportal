import { supabase } from '@/shared/lib/supabase';

interface Message {
    role: 'user' | 'assistant';
    content: string;
}

export const sendAIRequest = async (model: string, messages: Message[]) => {
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
        }),
    });

    if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Failed to fetch AI response from proxy.');
    }

    return response.json();
};
