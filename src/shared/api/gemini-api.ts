import { AIProviderResponse } from "./deepseek-api";

const GEMINI_API_KEY = import.meta.env.VITE_GEMINI_API_KEY;

interface GeminiMessage {
  role: 'user' | 'model';
  parts: { text: string }[];
}

interface GeminiRequest {
  contents: GeminiMessage[];
}

export const sendGeminiRequest = async (
  model: string,
  messages: { role: 'user' | 'assistant' | 'system'; content: string }[]
): Promise<AIProviderResponse> => {
  if (!GEMINI_API_KEY) {
    throw new Error('GEMINI_API_KEY не установлен');
  }

  const contents: GeminiMessage[] = messages
    .filter(msg => msg.role === 'user' || msg.role === 'assistant')
    .map(msg => ({
      role: msg.role === 'assistant' ? 'model' : 'user',
      parts: [{ text: msg.content }],
    }));

  const requestBody: GeminiRequest = {
    contents,
  };

  try {
    const response = await fetch(`https://generativelanguage.googleapis.com/v1/models/${model}:generateContent?key=${GEMINI_API_KEY}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(requestBody),
    });

    if (!response.ok) {
      const errorData = await response.json();
      console.error('Gemini API error:', errorData);
      throw new Error(`Gemini API error: ${response.status}`);
    }

    const data = await response.json();
    
    if (!data.candidates || data.candidates.length === 0) {
      throw new Error('Gemini API returned no candidates.');
    }

    const content = data.candidates[0].content.parts[0].text;
    
    const tokenResponse = await fetch(`https://generativelanguage.googleapis.com/v1/models/${model}:countTokens?key=${GEMINI_API_KEY}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(requestBody),
    });

    const tokenData = await tokenResponse.json();
    const prompt_tokens = tokenData.totalTokens || 0;

    const completionTokenResponse = await fetch(`https://generativelanguage.googleapis.com/v1/models/${model}:countTokens?key=${GEMINI_API_KEY}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ contents: [{ role: 'model', parts: [{ text: content }] }] }),
    });
    const completionTokenData = await completionTokenResponse.json();
    const completion_tokens = completionTokenData.totalTokens || 0;

    return {
      content,
      usage: {
        prompt_tokens: prompt_tokens,
        completion_tokens: completion_tokens,
        total_tokens: prompt_tokens + completion_tokens,
      },
    };
  } catch (error) {
    console.error('Error calling Gemini API:', error);
    throw error;
  }
};
