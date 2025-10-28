import React from 'react';
import { Table, Select, Typography, message } from 'antd';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { modelRoutingApi, ModelRoutingConfig } from '@/entities/models/api/model-routing-api';
import { MODELS, MODEL_OPENROUTER_MAPPING } from '@/shared/config/models.config';

const { Title } = Typography;
const { Option } = Select;

const ModelRoutingTable: React.FC = () => {
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
                return model?.provider || 'N/A';
            },
        },
        {
            title: 'Маршрут API',
            dataIndex: 'use_openrouter',
            key: 'routing',
            align: 'center' as const,
            render: (useOpenRouter: boolean, record: ModelRoutingConfig) => (
                <Select
                    value={useOpenRouter ? 'openrouter' : 'direct'}
                    style={{ width: 180 }}
                    onChange={(value) => {
                        const newUseOpenRouter = value === 'openrouter';
                        const openRouterModelId = MODEL_OPENROUTER_MAPPING[record.model_id] || '';
                        updateRoutingMutation.mutate({
                            modelId: record.model_id,
                            useOpenRouter: newUseOpenRouter,
                            openRouterModelId,
                        });
                    }}
                    loading={updateRoutingMutation.isPending}
                >
                    <Option value="direct">Прямой API</Option>
                    <Option value="openrouter">OpenRouter</Option>
                </Select>
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
            render: (useOpenRouter: boolean) => {
                const model = MODELS.find(m => m.id);
                const providerName = model?.provider.toUpperCase() || 'N/A';
                return (
                    <span style={{ 
                        color: useOpenRouter ? '#1890ff' : '#52c41a',
                        fontWeight: 500,
                        fontSize: '0.85em'
                    }}>
                        {useOpenRouter ? '🔀 OpenRouter' : `✓ ${providerName}`}
                    </span>
                );
            },
        },
    ];

    return (
        <div style={{ marginTop: 48 }}>
            <Title level={2}>Управление моделями</Title>
            <Table
                dataSource={routingConfig}
                columns={columns}
                rowKey="id"
                loading={isLoading}
                bordered={false}
                scroll={{ x: 'auto' }}
                rowClassName={(_, index) => index % 2 === 0 ? 'ant-table-row-light' : 'ant-table-row-gray'}
                pagination={false}
            />
        </div>
    );
};

export default ModelRoutingTable;

