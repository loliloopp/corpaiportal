import React, { useState } from 'react';
import { Modal, Table, Button, Form, Input, Space, Popconfirm, App } from 'antd';
import { PlusOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '@/shared/lib/supabase';

interface RagObject {
  id: string;
  name: string;
  created_at: string;
}

interface RagObjectsModalProps {
  visible: boolean;
  onClose: () => void;
}

const fetchRagObjects = async () => {
  const { data: { session } } = await supabase.auth.getSession();
  const response = await fetch('/api/v1/admin/rag/objects', {
    headers: { 'Authorization': `Bearer ${session?.access_token}` }
  });
  if (!response.ok) throw new Error('Failed to fetch objects');
  return response.json();
};

export const RagObjectsModal: React.FC<RagObjectsModalProps> = ({ visible, onClose }) => {
  const { message } = App.useApp();
  const queryClient = useQueryClient();
  const [editingItem, setEditingItem] = useState<RagObject | null>(null);
  const [form] = Form.useForm();

  const { data: objects = [], isLoading } = useQuery({
    queryKey: ['ragObjects'],
    queryFn: fetchRagObjects,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000,
    enabled: visible
  });

  const createMutation = useMutation({
    mutationFn: async (data: { name: string }) => {
      const { data: { session } } = await supabase.auth.getSession();
      const response = await fetch('/api/v1/admin/rag/objects', {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${session?.access_token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      });
      if (!response.ok) throw new Error('Failed to create object');
      return response.json();
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['ragObjects'] });
      message.success('Объект создан');
      form.resetFields();
      setEditingItem(null);
    },
    onError: () => message.error('Ошибка при создании объекта')
  });

  const updateMutation = useMutation({
    mutationFn: async ({ id, data }: { id: string; data: { name: string } }) => {
      const { data: { session } } = await supabase.auth.getSession();
      const response = await fetch(`/api/v1/admin/rag/objects/${id}`, {
        method: 'PUT',
        headers: {
          'Authorization': `Bearer ${session?.access_token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      });
      if (!response.ok) throw new Error('Failed to update object');
      return response.json();
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['ragObjects'] });
      message.success('Объект обновлён');
      form.resetFields();
      setEditingItem(null);
    },
    onError: () => message.error('Ошибка при обновлении объекта')
  });

  const deleteMutation = useMutation({
    mutationFn: async (id: string) => {
      const { data: { session } } = await supabase.auth.getSession();
      const response = await fetch(`/api/v1/admin/rag/objects/${id}`, {
        method: 'DELETE',
        headers: { 'Authorization': `Bearer ${session?.access_token}` }
      });
      if (!response.ok) throw new Error('Failed to delete object');
      return response.json();
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['ragObjects'] });
      message.success('Объект удалён');
    },
    onError: () => message.error('Ошибка при удалении объекта')
  });

  const handleSubmit = async (values: { name: string }) => {
    if (editingItem) {
      updateMutation.mutate({ id: editingItem.id, data: values });
    } else {
      createMutation.mutate(values);
    }
  };

  const handleEdit = (object: RagObject) => {
    setEditingItem(object);
    form.setFieldsValue({ name: object.name });
  };

  const handleReset = () => {
    setEditingItem(null);
    form.resetFields();
  };

  const columns = [
    { title: 'ID', dataIndex: 'id', key: 'id', width: 250, ellipsis: true },
    { title: 'Имя объекта', dataIndex: 'name', key: 'name' },
    {
      title: 'Действия',
      key: 'actions',
      render: (_: any, record: RagObject) => (
        <Space>
          <Button
            icon={<EditOutlined />}
            size="small"
            onClick={() => handleEdit(record)}
          />
          <Popconfirm
            title="Удалить объект?"
            onConfirm={() => deleteMutation.mutate(record.id)}
          >
            <Button icon={<DeleteOutlined />} size="small" danger />
          </Popconfirm>
        </Space>
      )
    }
  ];

  return (
    <Modal
      title="Управление объектами"
      open={visible}
      onCancel={() => {
        onClose();
        handleReset();
      }}
      width={800}
      footer={null}
    >
      <div style={{ marginBottom: 24 }}>
        <Form
          form={form}
          onFinish={handleSubmit}
          layout="inline"
          style={{ marginBottom: 16 }}
        >
          <Form.Item name="name" rules={[{ required: true, message: 'Введите имя объекта' }]}>
            <Input placeholder="Имя объекта" style={{ width: 300 }} />
          </Form.Item>
          <Form.Item>
            <Button type="primary" icon={<PlusOutlined />} htmlType="submit" loading={createMutation.isPending || updateMutation.isPending}>
              {editingItem ? 'Сохранить' : 'Добавить'}
            </Button>
          </Form.Item>
          {editingItem && (
            <Form.Item>
              <Button onClick={handleReset}>Отмена</Button>
            </Form.Item>
          )}
        </Form>
      </div>

      <Table
        columns={columns}
        dataSource={objects}
        rowKey="id"
        loading={isLoading}
        pagination={{ pageSize: 10 }}
      />
    </Modal>
  );
};


