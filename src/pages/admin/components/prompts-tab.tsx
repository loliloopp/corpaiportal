import React, { useState, useEffect } from 'react';
import { Table, Button, Modal, Form, Input, InputNumber, Switch, Space, Spin, message, Popconfirm, Checkbox } from 'antd';
import { EditOutlined, DeleteOutlined, PlusOutlined } from '@ant-design/icons';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getAllPrompts, createPrompt, updatePrompt, deletePrompt, Prompt } from '@/entities/prompts';
import { useAuthStore } from '@/features/auth';
import { useThemeContext } from '@/app/providers/theme-provider';
import { getSetting, setSetting } from '@/entities/models/api/models-api';

export const PromptsTab: React.FC = () => {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [form] = Form.useForm();
  const [enablePreprocessing, setEnablePreprocessing] = useState(false);
  const [savingPreprocessing, setSavingPreprocessing] = useState(false);
  const user = useAuthStore((state) => state.user);
  const queryClient = useQueryClient();
  const { message: messageApi } = Modal;
  const { theme } = useThemeContext();
  const isDark = theme === 'dark';

  const { data: prompts = [], isLoading } = useQuery({
    queryKey: ['allPrompts'],
    queryFn: getAllPrompts,
  });

  // Load preprocessing setting on mount
  useEffect(() => {
    const loadSetting = async () => {
      try {
        const enabled = await getSetting('enable_prompt_preprocessing');
        setEnablePreprocessing(enabled);
      } catch (error) {
        console.error('Failed to load preprocessing setting:', error);
      }
    };
    loadSetting();
  }, []);

  const handlePreprocessingChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const checked = e.target.checked;
    setSavingPreprocessing(true);
    try {
      await setSetting('enable_prompt_preprocessing', checked);
      setEnablePreprocessing(checked);
      message.success(checked ? 'Предобработка включена' : 'Предобработка отключена');
    } catch (error: any) {
      message.error(`Ошибка: ${error.message}`);
      setEnablePreprocessing(!checked);
    } finally {
      setSavingPreprocessing(false);
    }
  };

  const createMutation = useMutation({
    mutationFn: (newPrompt: any) => createPrompt({
      ...newPrompt,
      created_by: user?.id || '',
    }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['allPrompts'] });
      message.success('Роль создана успешно');
      setIsModalOpen(false);
      form.resetFields();
    },
    onError: (error: any) => {
      message.error(`Ошибка: ${error.message}`);
    },
  });

  const updateMutation = useMutation({
    mutationFn: ({ id, updates }: { id: string; updates: any }) => updatePrompt(id, updates),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['allPrompts'] });
      message.success('Роль обновлена успешно');
      setIsModalOpen(false);
      setEditingId(null);
      form.resetFields();
    },
    onError: (error: any) => {
      message.error(`Ошибка: ${error.message}`);
    },
  });

  const deleteMutation = useMutation({
    mutationFn: (id: string) => deletePrompt(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['allPrompts'] });
      message.success('Роль удалена успешно');
    },
    onError: (error: any) => {
      message.error(`Ошибка: ${error.message}`);
    },
  });

  const handleAddClick = () => {
    setEditingId(null);
    form.resetFields();
    setIsModalOpen(true);
  };

  const handleEditClick = (prompt: Prompt) => {
    setEditingId(prompt.id);
    form.setFieldsValue({
      role_name: prompt.role_name,
      system_prompt: prompt.system_prompt,
      temperature: prompt.temperature,
      top_p: prompt.top_p,
      by_default: prompt.by_default,
    });
    setIsModalOpen(true);
  };

  const handleModalOk = async () => {
    try {
      const values = await form.validateFields();
      if (editingId) {
        updateMutation.mutate({ id: editingId, updates: values });
      } else {
        createMutation.mutate(values);
      }
    } catch (error) {
      // Validation failed
    }
  };

  const handleModalCancel = () => {
    setIsModalOpen(false);
    setEditingId(null);
    form.resetFields();
  };

  const columns = [
    {
      title: 'Роль',
      dataIndex: 'role_name',
      key: 'role_name',
      width: '15%',
    },
    {
      title: 'Системный промт',
      dataIndex: 'system_prompt',
      key: 'system_prompt',
      width: '40%',
      render: (text: string) => (
        <span style={{ fontSize: '0.9em', color: isDark ? '#ccc' : '#666' }}>
          {text.length > 100 ? `${text.substring(0, 100)}...` : text}
        </span>
      ),
    },
    {
      title: 'Temperature',
      dataIndex: 'temperature',
      key: 'temperature',
      width: '10%',
      render: (temp: number | null) => temp !== null ? temp.toFixed(2) : '—',
    },
    {
      title: 'Top P',
      dataIndex: 'top_p',
      key: 'top_p',
      width: '10%',
      render: (topP: number | null) => topP !== null ? topP.toFixed(2) : '—',
    },
    {
      title: 'По умолчанию',
      dataIndex: 'by_default',
      key: 'by_default',
      width: '12%',
      render: (byDefault: boolean, record: Prompt) => (
        <Switch
          checked={byDefault}
          onChange={(checked) => {
            updateMutation.mutate({
              id: record.id,
              updates: { by_default: checked },
            });
          }}
          loading={updateMutation.isPending}
        />
      ),
    },
    {
      title: 'Действия',
      key: 'actions',
      width: '13%',
      render: (_: unknown, record: Prompt) => (
        <Space size="small">
          <Button
            type="text"
            size="small"
            icon={<EditOutlined />}
            onClick={() => handleEditClick(record)}
            title="Редактировать"
          />
          <Popconfirm
            title="Удалить роль?"
            description="Это действие нельзя отменить."
            onConfirm={() => deleteMutation.mutate(record.id)}
            okText="Удалить"
            cancelText="Отмена"
          >
            <Button
              type="text"
              danger
              size="small"
              icon={<DeleteOutlined />}
              loading={deleteMutation.isPending}
              title="Удалить"
            />
          </Popconfirm>
        </Space>
      ),
    },
  ];

  return (
    <Spin spinning={isLoading || createMutation.isPending || updateMutation.isPending}>
      <div style={{ marginBottom: 16 }}>
        <Space size="large">
          <Button
            type="primary"
            icon={<PlusOutlined />}
            onClick={handleAddClick}
          >
            Добавить роль
          </Button>
          <Checkbox
            checked={enablePreprocessing}
            onChange={handlePreprocessingChange}
            disabled={savingPreprocessing}
          >
            Использовать предобработку запросов
          </Checkbox>
        </Space>
      </div>

      <Table
        dataSource={prompts}
        columns={columns}
        rowKey="id"
        pagination={false}
        bordered
        size="small"
      />

      <Modal
        title={editingId ? 'Редактировать роль' : 'Добавить новую роль'}
        open={isModalOpen}
        onOk={handleModalOk}
        onCancel={handleModalCancel}
        width={700}
        okText="Сохранить"
        cancelText="Отмена"
      >
        <Form
          form={form}
          layout="vertical"
          requiredMark="optional"
        >
          <Form.Item
            label="Роль"
            name="role_name"
            rules={[{ required: true, message: 'Укажите название роли' }]}
          >
            <Input placeholder="Например: Аналитик, Писатель, Кодер" disabled={!!editingId} />
          </Form.Item>

          <Form.Item
            label="Системный промт"
            name="system_prompt"
            rules={[{ required: true, message: 'Укажите системный промт' }]}
          >
            <Input.TextArea rows={6} placeholder="Введите системный промт для модели" />
          </Form.Item>

          <Form.Item
            label="Temperature (0-2)"
            name="temperature"
          >
            <InputNumber
              min={0}
              max={2}
              step={0.01}
              placeholder="Оставьте пусто, чтобы не отправлять"
            />
          </Form.Item>

          <Form.Item
            label="Top P (0-1)"
            name="top_p"
          >
            <InputNumber
              min={0}
              max={1}
              step={0.01}
              placeholder="Оставьте пусто, чтобы не отправлять"
            />
          </Form.Item>

          <Form.Item
            label="По умолчанию"
            name="by_default"
            valuePropName="checked"
          >
            <Switch />
          </Form.Item>
        </Form>
      </Modal>
    </Spin>
  );
};
