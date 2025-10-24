export type Provider = 'deepseek' | 'openai' | 'gemini';

export interface Model {
    id: string;
    name: string;
    provider: Provider;
}

export const MODELS: Model[] = [
    { id: 'deepseek-chat', name: 'DeepSeek Chat', provider: 'deepseek' },
    { id: 'gpt-4o', name: 'OpenAI GPT-4o', provider: 'openai' },
    { id: 'gemini-2.5-pro', name: 'Google Gemini 2.5 Pro', provider: 'gemini' },
    { id: 'gemini-2.5-flash', name: 'Google Gemini 2.5 Flash', provider: 'gemini' },
];
