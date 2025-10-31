import React, { useState, useMemo } from 'react';
import { Modal, Input, Button, List, App, Spin, Typography } from 'antd';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { openRouterApi, OpenRouterModel } from '@/entities/models/api/openrouter-api';
import { addModelFromOpenRouter } from '@/entities/models/api/models-api';

const { Search } = Input;
const { Text } = Typography;

interface AddModelModalProps {
    open: boolean;
    onCancel: () => void;
}

const AddModelModal: React.FC<AddModelModalProps> = ({ open, onCancel }) => {
    const { message } = App.useApp();
    const queryClient = useQueryClient();
    const [searchText, setSearchText] = useState('');
    const [selectedModel, setSelectedModel] = useState<OpenRouterModel | null>(null);
    const [displayName, setDisplayName] = useState('');

    const { data: openRouterModels, isLoading } = useQuery({
        queryKey: ['openRouterModels'],
        queryFn: () => openRouterApi.getModels(),
        enabled: open,
    });

    const addModelMutation = useMutation({
        mutationFn: (modelData: { model_id: string; display_name: string; openrouter_model_id: string }) =>
            addModelFromOpenRouter({
                model_id: modelData.model_id,
                display_name: modelData.display_name,
                openrouter_model_id: modelData.openrouter_model_id,
                description: selectedModel?.description,
            }),
        onSuccess: () => {
            message.success('Модель успешно добавлена');
            queryClient.invalidateQueries({ queryKey: ['modelRouting'] });
            queryClient.invalidateQueries({ queryKey: ['users'] });
            queryClient.invalidateQueries({ queryKey: ['allModels'] });
            handleCancel();
        },
        onError: (error: Error) => {
            message.error(`Ошибка при добавлении модели: ${error.message}`);
        },
    });

    const filteredModels = useMemo(() => {
        if (!openRouterModels) return [];
        if (!searchText.trim()) return openRouterModels.slice(0, 100); // Limit to first 100 for performance

        const searchLower = searchText.toLowerCase();
        return openRouterModels.filter(
            (model: OpenRouterModel) =>
                model.name?.toLowerCase().includes(searchLower) ||
                model.id?.toLowerCase().includes(searchLower) ||
                model.description?.toLowerCase().includes(searchLower)
        ).slice(0, 100);
    }, [openRouterModels, searchText]);

    const handleModelSelect = (model: OpenRouterModel) => {
        setSelectedModel(model);
        // Pre-fill display name from OpenRouter model name, removing provider prefix
        if (!displayName && model.name) {
            // Remove provider prefix if format is "Provider: Name" or "provider/name"
            let cleanName = model.name;
            if (cleanName.includes(': ')) {
                cleanName = cleanName.split(': ')[1];
            } else if (cleanName.includes('/')) {
                cleanName = cleanName.split('/')[1];
            }
            setDisplayName(cleanName);
        }
    };

    const handleAdd = () => {
        if (!selectedModel) {
            message.warning('Выберите модель из списка');
            return;
        }
        if (!displayName.trim()) {
            message.warning('Введите отображаемое имя модели');
            return;
        }

        // Generate model_id from OpenRouter model id (replace / with -)
        const modelId = selectedModel.id.replace(/\//g, '-').replace(/:/g, '-');

        addModelMutation.mutate({
            model_id: modelId,
            display_name: displayName.trim(),
            openrouter_model_id: selectedModel.id,
        });
    };

    const handleCancel = () => {
        setSearchText('');
        setSelectedModel(null);
        setDisplayName('');
        onCancel();
    };

    return (
        <Modal
            title="Добавить модель из OpenRouter.ai"
            open={open}
            onCancel={handleCancel}
            width={800}
            footer={[
                <Button key="cancel" onClick={handleCancel}>
                    Отмена
                </Button>,
                <Button
                    key="add"
                    type="primary"
                    onClick={handleAdd}
                    loading={addModelMutation.isPending}
                    disabled={!selectedModel || !displayName.trim()}
                >
                    Добавить
                </Button>,
            ]}
        >
            <div style={{ marginBottom: 16 }}>
                <Search
                    placeholder="Поиск модели по имени или ID..."
                    value={searchText}
                    onChange={(e) => setSearchText(e.target.value)}
                    allowClear
                />
            </div>

            <div style={{ marginBottom: 16 }}>
                <Text strong>Выбранная модель: </Text>
                {selectedModel ? (
                    <Text code>{selectedModel.name || selectedModel.id}</Text>
                ) : (
                    <Text type="secondary">Не выбрана</Text>
                )}
            </div>

            {selectedModel && (
                <div style={{ marginBottom: 16 }}>
                    <Text strong>Отображаемое имя: </Text>
                    <Input
                        value={displayName}
                        onChange={(e) => setDisplayName(e.target.value)}
                        placeholder="Введите имя для отображения"
                        style={{ marginTop: 8 }}
                    />
                </div>
            )}

            <div style={{ maxHeight: '400px', overflowY: 'auto', border: '1px solid #d9d9d9', borderRadius: '4px' }}>
                <Spin spinning={isLoading}>
                    <List
                        dataSource={filteredModels}
                        renderItem={(model: OpenRouterModel) => (
                            <List.Item
                                onClick={() => handleModelSelect(model)}
                                style={{
                                    cursor: 'pointer',
                                    backgroundColor: selectedModel?.id === model.id ? '#e6f7ff' : 'transparent',
                                    padding: '12px 16px',
                                }}
                            >
                                <List.Item.Meta
                                    title={
                                        <div>
                                            <Text strong>{model.name || model.id}</Text>
                                            {model.description && (
                                                <div>
                                                    <Text type="secondary" style={{ fontSize: '0.85em' }}>
                                                        {model.description.length > 100
                                                            ? `${model.description.substring(0, 100)}...`
                                                            : model.description}
                                                    </Text>
                                                </div>
                                            )}
                                        </div>
                                    }
                                    description={
                                        <div>
                                            <Text code style={{ fontSize: '0.85em' }}>
                                                {model.id}
                                            </Text>
                                            {model.context_length && (
                                                <Text type="secondary" style={{ marginLeft: 8, fontSize: '0.85em' }}>
                                                    Context: {model.context_length.toLocaleString()}
                                                </Text>
                                            )}
                                        </div>
                                    }
                                />
                            </List.Item>
                        )}
                    />
                </Spin>
            </div>
        </Modal>
    );
};

export default AddModelModal;

