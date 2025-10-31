import React, { useState } from 'react';
import { Table, Switch, Typography, App, Spin, Button, Form, Input, Checkbox, Space } from 'antd';
import { PlusOutlined, DeleteOutlined, EditOutlined, CheckOutlined, CloseOutlined } from '@ant-design/icons';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { modelRoutingApi, ModelRoutingConfig } from '@/entities/models/api/model-routing-api';
import { MODELS, MODEL_OPENROUTER_MAPPING } from '@/shared/config/models.config';
import { deleteModel, getSetting, setSetting } from '@/entities/models/api/models-api';
import AddModelModal from '@/widgets/add-model-modal';
import { supabase } from '@/shared/lib/supabase';

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
    const [isAddModalOpen, setIsAddModalOpen] = useState(false);
    const [editingKey, setEditingKey] = useState<string | null>(null);
    const [editingCost, setEditingCost] = useState('');
    const [editingDescription, setEditingDescription] = useState('');
    const [showCostInSelector, setShowCostInSelector] = useState(false);

    const { data: routingConfig, isLoading } = useQuery<ModelRoutingConfig[]>({
        queryKey: ['modelRouting'],
        queryFn: () => modelRoutingApi.getAll(),
    });

    // Load the showCostInSelector setting on mount
    React.useEffect(() => {
        const loadSetting = async () => {
            const value = await getSetting('show_cost_in_selector');
            setShowCostInSelector(value);
        };
        loadSetting();
    }, []);

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

    const saveCostMutation = useMutation({
        mutationFn: async (variables: { modelId: string; cost: string }) => {
            const { data: { session }, error: sessionError } = await supabase.auth.getSession();

            if (sessionError || !session) {
                throw new Error('User not authenticated.');
            }

            const response = await fetch(`/api/v1/admin/models/${variables.modelId}/cost`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${session.access_token}`,
                },
                body: JSON.stringify({ approximate_cost: variables.cost }),
            });

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.error || 'Failed to save cost');
            }
            return response.json();
        },
        onSuccess: () => {
            message.success('Стоимость сохранена');
            queryClient.invalidateQueries({ queryKey: ['modelRouting'] });
            setEditingKey(null);
        },
        onError: (error: any) => {
            message.error(`Ошибка при сохранении: ${error.message}`);
        },
    });

    const saveDescriptionMutation = useMutation({
        mutationFn: async (variables: { modelId: string; description: string }) => {
            const { data: { session }, error: sessionError } = await supabase.auth.getSession();

            if (sessionError || !session) {
                throw new Error('User not authenticated.');
            }

            const response = await fetch(`/api/v1/admin/models/${variables.modelId}/description`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${session.access_token}`,
                },
                body: JSON.stringify({ description: variables.description }),
            });

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.error || 'Failed to save description');
            }
            return response.json();
        },
        onSuccess: () => {
            message.success('Описание сохранено');
            queryClient.invalidateQueries({ queryKey: ['modelRouting'] });
            setEditingKey(null);
        },
        onError: (error: any) => {
            message.error(`Ошибка при сохранении: ${error.message}`);
        },
    });

    const deleteModelMutation = useMutation({
        mutationFn: (modelId: string) => deleteModel(modelId),
        onSuccess: () => {
            message.success('Модель удалена');
            queryClient.invalidateQueries({ queryKey: ['modelRouting'] });
            queryClient.invalidateQueries({ queryKey: ['users'] });
            queryClient.invalidateQueries({ queryKey: ['allModels'] });
        },
        onError: (error: any) => {
            message.error(`Ошибка при удалении: ${error.message}`);
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
            render: (modelId: string, record: ModelRoutingConfig) => {
                // Use provider from routing config if available, otherwise lookup in MODELS
                const provider = record.provider || MODELS.find(m => m.id === modelId)?.provider;
                const providerName = provider ? PROVIDER_NAMES[provider] || provider : 'N/A';
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
            title: 'Цена',
            dataIndex: 'approximate_cost',
            key: 'cost',
            width: '10%',
            render: (cost: string, record: ModelRoutingConfig) => {
                if (editingKey === record.model_id) {
                    return (
                        <Input
                            value={editingCost}
                            onChange={(e) => setEditingCost(e.target.value)}
                            placeholder="Цена"
                            size="small"
                        />
                    );
                }
                if (!cost) return <span style={{ color: '#999' }}>—</span>;
                return <span style={{ fontSize: '0.85em' }}>{cost}</span>;
            },
        },
        {
            title: 'Описание',
            dataIndex: 'description',
            key: 'description',
            width: '30%',
            render: (description: string, record: ModelRoutingConfig) => {
                if (editingKey === record.model_id) {
                    return (
                        <Input.TextArea
                            value={editingDescription}
                            onChange={(e) => setEditingDescription(e.target.value)}
                            placeholder="Описание"
                            rows={2}
                            size="small"
                        />
                    );
                }
                if (!description) return <span style={{ color: '#999' }}>—</span>;
                return (
                    <span style={{ fontSize: '0.85em', color: '#666' }}>
                        {description.length > 100 ? `${description.substring(0, 100)}...` : description}
                    </span>
                );
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
        {
            title: 'Действия',
            key: 'actions',
            align: 'center' as const,
            width: 120,
            render: (_: unknown, record: ModelRoutingConfig) => {
                if (editingKey === record.model_id) {
                    // Show save/cancel buttons when editing
                    return (
                        <Space size="small">
                            <Button
                                type="primary"
                                size="small"
                                icon={<CheckOutlined />}
                                onClick={() => {
                                    if (editingKey) {
                                        // Save both description and cost
                                        if (editingDescription !== (routingConfig?.find(m => m.model_id === editingKey)?.description || '')) {
                                            saveDescriptionMutation.mutate({
                                                modelId: editingKey,
                                                description: editingDescription,
                                            });
                                        }
                                        if (editingCost !== (routingConfig?.find(m => m.model_id === editingKey)?.approximate_cost || '')) {
                                            saveCostMutation.mutate({
                                                modelId: editingKey,
                                                cost: editingCost,
                                            });
                                        }
                                        setEditingKey(null);
                                        setEditingCost('');
                                        setEditingDescription('');
                                    }
                                }}
                                loading={saveDescriptionMutation.isPending || saveCostMutation.isPending}
                                title="Сохранить"
                            />
                            <Button
                                size="small"
                                icon={<CloseOutlined />}
                                onClick={() => {
                                    setEditingKey(null);
                                    setEditingCost('');
                                    setEditingDescription('');
                                }}
                                title="Отмена"
                            />
                        </Space>
                    );
                }

                // Show edit/delete buttons when not editing
                return (
                    <div style={{ display: 'flex', gap: 8, justifyContent: 'center' }}>
                        <Button
                            type="text"
                            size="small"
                            icon={<EditOutlined />}
                            onClick={() => {
                                setEditingKey(record.model_id);
                                setEditingCost(record.approximate_cost || '');
                                setEditingDescription(record.description || '');
                            }}
                            title="Редактировать модель"
                        />
                        <Button
                            type="text"
                            danger
                            size="small"
                            icon={<DeleteOutlined />}
                            onClick={() => {
                                if (confirm(`Вы уверены, что хотите удалить модель "${MODELS.find(m => m.id === record.model_id)?.name || record.model_id}"?`)) {
                                    deleteModelMutation.mutate(record.model_id);
                                }
                            }}
                            loading={deleteModelMutation.isPending}
                            title="Удалить модель"
                        />
                    </div>
                );
            },
        },
    ];

    return (
        <div style={{ padding: '0 0 24px 0' }}>
            <div style={{ marginBottom: 16, display: 'flex', justifyContent: 'space-between' }}>
                <Checkbox
                    checked={showCostInSelector}
                    onChange={(e) => {
                        const newValue = e.target.checked;
                        setShowCostInSelector(newValue);
                        setSetting('show_cost_in_selector', newValue);
                    }}
                >
                    Отображать стоимость
                </Checkbox>
                <Button
                    type="primary"
                    icon={<PlusOutlined />}
                    onClick={() => setIsAddModalOpen(true)}
                >
                    Добавить модель из openrouter.ai
                </Button>
            </div>
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
            <AddModelModal
                open={isAddModalOpen}
                onCancel={() => setIsAddModalOpen(false)}
            />
        </div>
    );
};

export default ModelRoutingTable;

