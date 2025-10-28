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

const PROXY_URL = 'http://185.200.179.0:3001';

export const openRouterApi = {
    async getModels(): Promise<OpenRouterModel[]> {
        const response = await proxyApi.get<OpenRouterModelsResponse>(`${PROXY_URL}/api/v1/openrouter-models`);
        return response.data;
    },
};

