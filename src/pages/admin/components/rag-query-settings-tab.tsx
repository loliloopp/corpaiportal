import React, { useState, useEffect } from 'react';
import { Card, Switch, Select, Space, Typography, message, App, Row, Col } from 'antd';
import { useQuery, useMutation } from '@tanstack/react-query';
import { supabase } from '@/shared/lib/supabase';
import { apiClient } from '@/shared/lib/api-client';

const { Title, Text, Paragraph } = Typography;

// Fetch available reranker models
const fetchRerankerModels = async () => {
  return apiClient.get('/admin/rag/reranker-models');
};

// Fetch current settings
const fetchRagQuerySettings = async () => {
  try {
    return await apiClient.get('/settings/rag_query_mode');
  } catch {
    return { value: 'simple' }; // Default to simple mode
  }
};

const fetchRagRerankerModel = async () => {
  try {
    return await apiClient.get('/settings/rag_reranker_model');
  } catch {
    return { rag_reranker_model: 'bge-reranker-base' };
  }
};

export const RagQuerySettingsTab: React.FC = () => {
  const { message: messageApi } = App.useApp();
  const [isReranking, setIsReranking] = useState(false);
  const [selectedRerankerModel, setSelectedRerankerModel] = useState<string | null>(null);

  // Fetch reranker models
  const { data: rerankerModels = [] } = useQuery({
    queryKey: ['rerankerModels'],
    queryFn: fetchRerankerModels,
    refetchOnWindowFocus: false,
    staleTime: 10 * 60 * 1000
  });

  // Fetch current RAG query mode setting
  const { data: queryModeSetting } = useQuery({
    queryKey: ['ragQueryMode'],
    queryFn: fetchRagQuerySettings,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000
  });

  // Fetch current reranker model setting
  const { data: rerankerModelSetting } = useQuery({
    queryKey: ['ragRerankerModel'],
    queryFn: fetchRagRerankerModel,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000
  });

  // Update settings mutation
  const updateSettingMutation = useMutation({
    mutationFn: async ({ key, value }: { key: string; value: string | null }) => {
      return apiClient.put(`/settings/${key}`, { value });
    },
    onSuccess: () => {
      messageApi.success('Настройка сохранена');
    },
    onError: () => {
      messageApi.error('Ошибка при сохранении настройки');
    }
  });

  // Handle query mode toggle
  const handleQueryModeChange = (checked: boolean) => {
    setIsReranking(checked);
    // Send boolean: true = use reranking, false = simple mode
    updateSettingMutation.mutate({ key: 'rag_query_mode', value: checked });
  };

  // Handle reranker model selection
  const handleRerankerModelChange = (value: string | null) => {
    setSelectedRerankerModel(value);
    updateRerankerModelMutation.mutate(value);
  };

  // Separate mutation for reranker model (uses different field)
  const updateRerankerModelMutation = useMutation({
    mutationFn: async (model: string | null) => {
      return apiClient.put('/settings/rag_reranker_model', { rag_reranker_model: model });
    },
    onSuccess: () => {
      messageApi.success('Модель переранжирования сохранена');
    },
    onError: () => {
      messageApi.error('Ошибка при сохранении модели');
    }
  });

  // Initialize from settings
  useEffect(() => {
    if (queryModeSetting?.value !== undefined) {
      // value is boolean: true = reranking enabled, false = simple mode
      setIsReranking(queryModeSetting.value === true);
    }
  }, [queryModeSetting]);

  useEffect(() => {
    if (rerankerModelSetting?.rag_reranker_model) {
      setSelectedRerankerModel(rerankerModelSetting.rag_reranker_model);
    }
  }, [rerankerModelSetting]);

  return (
    <div style={{ padding: '24px' }}>
      <Card>
        <Space direction="vertical" size="large" style={{ width: '100%' }}>
          <div>
            <Title level={4}>Тип запроса к RAG</Title>
            <Paragraph type="secondary">
              Выберите режим работы системы извлечения информации. Переранжирование улучшает релевантность результатов, но требует больше вычислительных ресурсов.
            </Paragraph>
          </div>

          <Row gutter={24}>
            <Col xs={24} sm={12}>
              <Card type="inner" title="Режим запроса">
                <Space direction="vertical" style={{ width: '100%' }}>
                  <div>
                    <Text strong>Использовать переранжирование</Text>
                  </div>
                  <Switch
                    checked={isReranking}
                    onChange={handleQueryModeChange}
                    loading={updateSettingMutation.isPending}
                  />
                  <Paragraph type="secondary" style={{ marginTop: 12, marginBottom: 0 }}>
                    <strong>Простой запрос:</strong> Быстрое извлечение релевантных документов
                  </Paragraph>
                  <Paragraph type="secondary" style={{ marginBottom: 0 }}>
                    <strong>Запрос с переранжированием:</strong> Дополнительная переранжировка результатов для повышения релевантности
                  </Paragraph>
                </Space>
              </Card>
            </Col>

            {isReranking && (
              <Col xs={24} sm={12}>
                <Card type="inner" title="Модель переранжирования">
                  <Space direction="vertical" style={{ width: '100%' }}>
                    <Text type="secondary">
                      Выберите модель, которая будет использоваться для переранжирования результатов поиска
                    </Text>
                    <Select
                      placeholder="Выберите модель переранжирования"
                      value={selectedRerankerModel}
                      onChange={handleRerankerModelChange}
                      disabled={!isReranking || updateRerankerModelMutation.isPending}
                      options={rerankerModels.map((model: any) => ({
                        label: model.name || model.id,
                        value: model.id
                      }))}
                      style={{ width: '100%' }}
                    />
                    {selectedRerankerModel && (
                      <Paragraph type="success" style={{ marginTop: 12, marginBottom: 0 }}>
                        ✓ Выбранная модель: {selectedRerankerModel}
                      </Paragraph>
                    )}
                  </Space>
                </Card>
              </Col>
            )}
          </Row>

          <Card type="inner" style={{ backgroundColor: '#fafafa' }}>
            <Title level={5}>Информация</Title>
            <Paragraph type="secondary">
              Текущий режим: <Text strong>{isReranking ? 'Запрос с переранжированием' : 'Простой запрос'}</Text>
            </Paragraph>
            {isReranking && selectedRerankerModel && (
              <Paragraph type="secondary">
                Модель переранжирования: <Text strong>{selectedRerankerModel}</Text>
              </Paragraph>
            )}
          </Card>
        </Space>
      </Card>
    </div>
  );
};

