import React from 'react';
import { Table, Switch, Typography, App, Spin } from 'antd';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { modelRoutingApi, ModelRoutingConfig } from '@/entities/models/api/model-routing-api';
import { MODELS, MODEL_OPENROUTER_MAPPING } from '@/shared/config/models.config';

const { Title } = Typography;

const PROVIDER_NAMES: Record<string, string> = {
    openai: 'OpenAI',
    deepseek: 'DeepSeek',
    gemini: 'Google Gemini',
    grok: 'Grok',
    openrouter: 'OpenRouter.ai',
};

const ModelRoutingTable: React.FC = () => {
    const { message } = App.useApp();
    const queryClient = useQueryClient();

    const { data: routingConfig, isLoading } = useQuery<ModelRoutingConfig[]>({
        queryKey: ['modelRouting'],
        queryFn: () => modelRoutingApi.getAll(),
    });

    const updateRoutingMutation = useMutation({
        mutationFn: (variables: { modelId: string; useOpenRouter: boolean; openRouterModelId: string }) =>
            modelRoutingApi.update(variables.modelId, variables.useOpenRouter, variables.openRouterModelId),
        onSuccess: () => {
            message.success('Маршрутизация модели обновлена');
            queryClient.invalidateQueries({ queryKey: ['modelRouting'] });
        },
        onError: (error: any) => {
            message.error(`Ошибка при обновлении: ${error.message}`);
        },
    });

    // Sort data alphabetically by model name
    const sortedData = React.useMemo(() => {
        if (!routingConfig) return [];
        return [...routingConfig].sort((a, b) => {
            const modelA = MODELS.find(m => m.id === a.model_id);
            const modelB = MODELS.find(m => m.id === b.model_id);
            const nameA = modelA?.name || a.model_id;
            const nameB = modelB?.name || b.model_id;
            return nameA.localeCompare(nameB);
        });
    }, [routingConfig]);

    const columns = [
        {
            title: 'Модель',
            dataIndex: 'model_id',
            key: 'model_id',
            render: (modelId: string) => {
                const model = MODELS.find(m => m.id === modelId);
                return (
                    <div>
                        <div style={{ fontWeight: 500 }}>{model?.name || modelId}</div>
                        <div style={{ fontSize: '0.85em', color: '#999' }}>{modelId}</div>
                    </div>
                );
            },
        },
        {
            title: 'Провайдер',
            dataIndex: 'model_id',
            key: 'provider',
            align: 'center' as const,
            render: (modelId: string) => {
                const model = MODELS.find(m => m.id === modelId);
                const providerName = model?.provider ? PROVIDER_NAMES[model.provider] || model.provider : 'N/A';
                return providerName;
            },
        },
        {
            title: 'Маршрут API',
            dataIndex: 'use_openrouter',
            key: 'routing',
            align: 'center' as const,
            render: (useOpenRouter: boolean, record: ModelRoutingConfig) => (
                <Switch
                    checked={useOpenRouter}
                    onChange={(checked) => {
                        const openRouterModelId = MODEL_OPENROUTER_MAPPING[record.model_id] || '';
                        updateRoutingMutation.mutate({
                            modelId: record.model_id,
                            useOpenRouter: checked,
                            openRouterModelId,
                        });
                    }}
                    disabled={updateRoutingMutation.isPending}
                    checkedChildren="OpenRouter"
                    unCheckedChildren="Прямой"
                />
            ),
        },
        {
            title: 'OpenRouter ID',
            dataIndex: 'openrouter_model_id',
            key: 'openrouter_id',
            render: (openRouterModelId: string, record: ModelRoutingConfig) => {
                if (!record.use_openrouter) return <span style={{ color: '#999' }}>—</span>;
                return <code style={{ fontSize: '0.85em' }}>{openRouterModelId}</code>;
            },
        },
        {
            title: 'Статус',
            dataIndex: 'use_openrouter',
            key: 'status',
            align: 'center' as const,
            render: (useOpenRouter: boolean, record: ModelRoutingConfig) => {
                const model = MODELS.find(m => m.id === record.model_id);
                const providerName = model?.provider ? PROVIDER_NAMES[model.provider] || model.provider.toUpperCase() : 'N/A';
                return (
                    <span style={{ 
                        color: useOpenRouter ? '#1890ff' : '#52c41a',
                        fontWeight: 500,
                        fontSize: '0.85em'
                    }}>
                        {useOpenRouter ? '🔀 OpenRouter.ai' : `✓ ${providerName}`}
                    </span>
                );
            },
        },
    ];

    return (
        <div style={{ padding: '0 0 24px 0' }}>
            <Spin spinning={isLoading}>
                <Table
                    dataSource={sortedData}
                    columns={columns}
                    rowKey="model_id"
                    bordered={false}
                    scroll={{ x: 'auto' }}
                    sticky
                    rowClassName={(_, index) => index % 2 === 0 ? 'ant-table-row-light' : 'ant-table-row-gray'}
                    pagination={false}
                />
            </Spin>
        </div>
    );
};

export default ModelRoutingTable;

