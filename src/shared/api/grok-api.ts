import { AIProviderResponse } from "./deepseek-api";
import { checkUsageLimit } from "./usage-api";

const GROK_API_KEY = import.meta.env.VITE_GROK_API_KEY;

interface GrokMessage {
  role: 'system' | 'user' | 'assistant';
  content: string;
}

interface GrokRequest {
  model: string;
  messages: GrokMessage[];
  temperature?: number;
  max_tokens?: number;
}

export const sendGrokRequest = async (
  model: string,
  messages: GrokMessage[]
): Promise<AIProviderResponse> => {
  if (!GROK_API_KEY) {
    throw new Error('GROK_API_KEY не установлен');
  }

  await checkUsageLimit();

  const requestBody: GrokRequest = {
    model,
    messages,
    temperature: 0.7,
  };

  try {
    const response = await fetch('https://api.x.ai/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${GROK_API_KEY}`,
      },
      body: JSON.stringify(requestBody),
    });

    if (!response.ok) {
      const errorData = await response.json();
      console.error('Grok API error:', errorData);
      throw new Error(`Grok API error: ${response.status}`);
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
    console.error('Error calling Grok API:', error);
    throw error;
  }
};
