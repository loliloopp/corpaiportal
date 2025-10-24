import { AIProviderResponse } from "./deepseek-api"; // We'll centralize this later

const OPENAI_API_KEY = import.meta.env.VITE_OPENAI_API_KEY;

interface OpenAIMessage {
  role: 'system' | 'user' | 'assistant';
  content: string;
}

interface OpenAIRequest {
  model: string;
  messages: OpenAIMessage[];
  temperature?: number;
  max_tokens?: number;
}

export const sendOpenAIRequest = async (
  model: string,
  messages: OpenAIMessage[]
): Promise<AIProviderResponse> => {
  if (!OPENAI_API_KEY) {
    throw new Error('OPENAI_API_KEY не установлен');
  }

  const requestBody: OpenAIRequest = {
    model,
    messages,
    temperature: 0.7,
  };

  try {
    const response = await fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${OPENAI_API_KEY}`,
      },
      body: JSON.stringify(requestBody),
    });

    if (!response.ok) {
      const errorData = await response.json();
      console.error('OpenAI API error:', errorData);
      throw new Error(`OpenAI API error: ${response.status}`);
    }

    const data = await response.json();
    return {
      content: data.choices[0].message.content,
      usage: {
        prompt_tokens: data.usage.prompt_tokens,
        completion_tokens: data.usage.completion_tokens,
        total_tokens: data.usage.total_tokens,
      },
    };
  } catch (error) {
    console.error('Error calling OpenAI API:', error);
    throw error;
  }
};
