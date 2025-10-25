export type Provider = 'deepseek' | 'openai' | 'gemini' | 'grok';

export interface Model {
    id: string;
    name: string;
    provider: Provider;
}

export const OPENAI_MODELS: Model[] = [
  {
    name: 'GPT-5',
    id: 'gpt-5',
    provider: 'openai',
  },
  {
    name: 'GPT-5 Mini',
    id: 'gpt-5-mini',
    provider: 'openai',
  },
];

export const DEEPSEEK_MODELS: Model[] = [
    { id: 'deepseek-chat', name: 'DeepSeek Chat', provider: 'deepseek' },
];

export const GEMINI_MODELS: Model[] = [
    { id: 'gemini-2.5-pro', name: 'Google Gemini 2.5 Pro', provider: 'gemini' },
    { id: 'gemini-2.5-flash', name: 'Google Gemini 2.5 Flash', provider: 'gemini' },
];

export const GROK_MODELS: Model[] = [
    { id: 'grok-4-fast', name: 'Grok 4 Fast', provider: 'grok' },
];

export const MODELS: Model[] = [
    ...OPENAI_MODELS,
    ...DEEPSEEK_MODELS,
    ...GEMINI_MODELS,
    ...GROK_MODELS,
];
