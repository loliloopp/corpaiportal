import { proxyApi } from '@/shared/api/proxy-api';

export interface OpenRouterModel {
    id: string;
    name: string;
    description?: string;
    context_length?: number;
    pricing?: {
        prompt: string;
        completion: string;
    };
    top_provider?: {
        max_completion_tokens?: number;
    };
}

export interface OpenRouterModelsResponse {
    data: OpenRouterModel[];
}

export const openRouterApi = {
    async getModels(): Promise<OpenRouterModel[]> {
        const response = await proxyApi.get<OpenRouterModelsResponse>('/api/v1/openrouter-models');
        return response.data;
    },
};

