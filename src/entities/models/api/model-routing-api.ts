import { proxyApi } from '@/shared/api/proxy-api';

export interface ModelRoutingConfig {
    id: string;
    model_id: string;
    use_openrouter: boolean;
    openrouter_model_id: string | null;
    created_at: string;
    updated_at: string;
}

const PROXY_URL = 'http://185.200.179.0:3001';

export const modelRoutingApi = {
    async getAll(): Promise<ModelRoutingConfig[]> {
        const response = await proxyApi.get<ModelRoutingConfig[]>(`${PROXY_URL}/api/v1/model-routing`);
        return response;
    },

    async update(modelId: string, useOpenRouter: boolean, openRouterModelId: string): Promise<ModelRoutingConfig> {
        const response = await proxyApi.put<ModelRoutingConfig>(`${PROXY_URL}/api/v1/model-routing/${modelId}`, {
            useOpenRouter,
            openRouterModelId,
        });
        return response;
    },
};

