import { supabase } from '@/shared/lib/supabase';
import { APIError, NetworkError, parseAPIError } from '@/shared/lib/error-handler';

export interface ChatMessage {
    role: 'user' | 'assistant' | 'system';
    content: string;
}

export interface ChatRequest {
    model: string;
    messages: ChatMessage[];
    jwt: string;
    conversationId: string | null;
}

export interface ChatResponse {
    id: string;
    choices: Array<{
        message: {
            role: 'assistant';
            content: string;
        };
    }>;
    usage?: {
        prompt_tokens: number;
        completion_tokens: number;
        total_tokens: number;
    };
}

export const sendAIRequest = async (
    model: string,
    messages: ChatMessage[],
    conversationId: string | null
): Promise<ChatResponse> => {
    const { data: { session }, error: sessionError } = await supabase.auth.getSession();

    if (sessionError || !session) {
        throw new APIError('User not authenticated.', 401, 'AUTH_REQUIRED');
    }

    const requestBody: ChatRequest = {
        model,
        messages,
        jwt: session.access_token,
        conversationId,
    };

    try {
        const response = await fetch('/api/v1/chat', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(requestBody),
        });

        if (!response.ok) {
            let errorData: { error?: string; code?: string; details?: unknown } | undefined;
            
            try {
                errorData = await response.json();
            } catch (e) {
                // If response is not JSON, try to get text
                try {
                    const textError = await response.text();
                    errorData = { error: textError || `Request failed with status ${response.status}` };
                } catch {
                    errorData = { error: `Request failed with status ${response.status}` };
                }
            }
            
            throw parseAPIError(response, errorData);
        }

        const data: ChatResponse = await response.json();
        return data;
    } catch (error) {
        if (error instanceof APIError) {
            throw error;
        }
        if (error instanceof Error) {
            throw new NetworkError(error.message, error);
        }
        throw new NetworkError('Network request failed', error);
    }
};

/**
 * Send AI request with streaming response
 * Yields chunks of text as they arrive from the server
 */
export const sendAIRequestStreaming = async (
    model: string,
    messages: ChatMessage[],
    conversationId: string | null,
    onChunk: (chunk: string) => void,
    onComplete: (response: ChatResponse) => void,
    onError: (error: Error) => void
): Promise<void> => {
    const { data: { session }, error: sessionError } = await supabase.auth.getSession();

    if (sessionError || !session) {
        onError(new APIError('User not authenticated.', 401, 'AUTH_REQUIRED'));
        return;
    }

    const requestBody: ChatRequest = {
        model,
        messages,
        jwt: session.access_token,
        conversationId,
    };

    try {
        const response = await fetch('/api/v1/chat/stream', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(requestBody),
        });

        if (!response.ok) {
            let errorData: { error?: string; code?: string; details?: unknown } | undefined;
            
            try {
                errorData = await response.json();
            } catch (e) {
                try {
                    const textError = await response.text();
                    errorData = { error: textError || `Request failed with status ${response.status}` };
                } catch {
                    errorData = { error: `Request failed with status ${response.status}` };
                }
            }
            
            const error = parseAPIError(response, errorData);
            onError(error);
            return;
        }

        if (!response.body) {
            onError(new NetworkError('Response body is empty'));
            return;
        }

        const reader = response.body.getReader();
        const decoder = new TextDecoder();
        let fullContent = '';
        let messageId = '';
        let usage = { prompt_tokens: 0, completion_tokens: 0, total_tokens: 0 };

        try {
            while (true) {
                const { done, value } = await reader.read();
                if (done) break;

                const chunk = decoder.decode(value, { stream: true });
                const lines = chunk.split('\n').filter(line => line.trim());

                for (const line of lines) {
                    if (line.startsWith('data: ')) {
                        const data = line.slice(6);
                        
                        try {
                            const parsed = JSON.parse(data);
                            
                            if (parsed.type === 'content') {
                                fullContent += parsed.content;
                                onChunk(parsed.content);
                            } else if (parsed.type === 'complete') {
                                messageId = parsed.id;
                                usage = parsed.usage || usage;
                            }
                        } catch (e) {
                            // Skip unparseable lines
                        }
                    }
                }
            }

            // Call onComplete with the final response
            onComplete({
                id: messageId,
                choices: [
                    {
                        message: {
                            role: 'assistant',
                            content: fullContent,
                        },
                    },
                ],
                usage,
            });
        } catch (error) {
            if (error instanceof Error) {
                onError(new NetworkError(error.message, error));
            } else {
                onError(new NetworkError('Streaming failed'));
            }
        } finally {
            reader.releaseLock();
        }
    } catch (error) {
        if (error instanceof APIError) {
            onError(error);
        } else if (error instanceof Error) {
            onError(new NetworkError(error.message, error));
        } else {
            onError(new NetworkError('Network request failed', error));
        }
    }
};

// Proxy API helper object for making requests to proxy server endpoints
export const proxyApi = {
    async get<T>(endpoint: string): Promise<T> {
        try {
            const response = await fetch(endpoint);
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
            if (error instanceof Error) {
                throw new NetworkError(error.message, error);
            }
            throw new NetworkError('API request failed', error);
        }
    },

    async put<T>(endpoint: string, body: unknown): Promise<T> {
        try {
            const response = await fetch(endpoint, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(body),
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
            if (error instanceof Error) {
                throw new NetworkError(error.message, error);
            }
            throw new NetworkError('API request failed', error);
        }
    },

    async post<T>(endpoint: string, body: unknown, headers?: Record<string, string>): Promise<T> {
        try {
            const response = await fetch(endpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    ...headers,
                },
                body: JSON.stringify(body),
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
            if (error instanceof Error) {
                throw new NetworkError(error.message, error);
            }
            throw new NetworkError('API request failed', error);
        }
    },
};