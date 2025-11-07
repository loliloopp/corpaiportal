import React, { useState } from 'react';
import { Table, Button, Modal, Form, Input, Select, Space, Typography, App, Popconfirm, InputNumber } from 'antd';
import { PlusOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '@/shared/lib/supabase';

const { Title, Text } = Typography;
const { TextArea } = Input;

// Fetch functions for admin
const fetchRagObjects = async () => {
  const { data: { session } } = await supabase.auth.getSession();
  const response = await fetch('/api/v1/admin/rag/objects', {
    headers: { 'Authorization': `Bearer ${session?.access_token}` }
  });
  if (!response.ok) throw new Error('Failed to fetch objects');
  return response.json();
};

const fetchLogicalSections = async () => {
  const { data: { session } } = await supabase.auth.getSession();
  const response = await fetch('/api/v1/admin/rag/logical-sections', {
    headers: { 'Authorization': `Bearer ${session?.access_token}` }
  });
  if (!response.ok) throw new Error('Failed to fetch sections');
  return response.json();
};

const fetchS3Buckets = async () => {
  const { data: { session } } = await supabase.auth.getSession();
  const response = await fetch('/api/v1/admin/rag/buckets', {
    headers: { 'Authorization': `Bearer ${session?.access_token}` }
  });
  if (!response.ok) throw new Error('Failed to fetch buckets');
  return response.json();
};

const fetchKnowledgeBases = async () => {
  const { data: { session } } = await supabase.auth.getSession();
  const response = await fetch('/api/v1/admin/rag/knowledge-bases', {
    headers: { 'Authorization': `Bearer ${session?.access_token}` }
  });
  if (!response.ok) throw new Error('Failed to fetch knowledge bases');
  return response.json();
};

export const RagManagementTab: React.FC = () => {
  const { message } = App.useApp();
  const queryClient = useQueryClient();
  const [activeSection, setActiveSection] = useState<'objects' | 'sections' | 'buckets' | 'kb'>('objects');

  // Modals
  const [objectModalVisible, setObjectModalVisible] = useState(false);
  const [sectionModalVisible, setSectionModalVisible] = useState(false);
  const [bucketModalVisible, setBucketModalVisible] = useState(false);
  const [kbModalVisible, setKbModalVisible] = useState(false);

  const [editingItem, setEditingItem] = useState<any>(null);
  const [form] = Form.useForm();

  // Queries
  const { data: objects = [], isLoading: objectsLoading } = useQuery({ 
    queryKey: ['ragObjects'], 
    queryFn: fetchRagObjects,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000 // 5 minutes
  });
  const { data: sections = [], isLoading: sectionsLoading } = useQuery({ 
    queryKey: ['ragSections'], 
    queryFn: fetchLogicalSections,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000 // 5 minutes
  });
  const { data: buckets = [], isLoading: bucketsLoading } = useQuery({ 
    queryKey: ['ragBuckets'], 
    queryFn: fetchS3Buckets,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000 // 5 minutes
  });
  const { data: knowledgeBases = [], isLoading: kbLoading } = useQuery({ 
    queryKey: ['ragKnowledgeBases'], 
    queryFn: fetchKnowledgeBases,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000 // 5 minutes
  });

  // Helper to determine which queries to invalidate based on endpoint
  const getQueriesToInvalidate = (endpoint: string): string[] => {
    const queries = [];
    if (endpoint.includes('/rag/objects')) queries.push('ragObjects');
    if (endpoint.includes('/rag/logical-sections')) queries.push('ragSections');
    if (endpoint.includes('/rag/buckets')) queries.push('ragBuckets');
    if (endpoint.includes('/rag/knowledge-bases')) queries.push('ragKnowledgeBases');
    return queries;
  };

  // CRUD Mutations
  const createMutation = useMutation({
    mutationFn: async ({ endpoint, data }: { endpoint: string; data: any }) => {
      const { data: { session } } = await supabase.auth.getSession();
      const response = await fetch(endpoint, {
        method: 'POST',
        headers: { 
          'Authorization': `Bearer ${session?.access_token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      });
      if (!response.ok) throw new Error('Failed to create');
      return response.json();
    },
    onSuccess: (_, { endpoint }) => {
      const queriesToInvalidate = getQueriesToInvalidate(endpoint);
      queriesToInvalidate.forEach(key => {
        queryClient.invalidateQueries({ queryKey: [key] });
      });
      message.success('Успешно создано');
      closeModals();
    },
    onError: () => message.error('Ошибка при создании')
  });

  const updateMutation = useMutation({
    mutationFn: async ({ endpoint, data }: { endpoint: string; data: any }) => {
      const { data: { session } } = await supabase.auth.getSession();
      const response = await fetch(endpoint, {
        method: 'PUT',
        headers: { 
          'Authorization': `Bearer ${session?.access_token}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      });
      if (!response.ok) throw new Error('Failed to update');
      return response.json();
    },
    onSuccess: (_, { endpoint }) => {
      const queriesToInvalidate = getQueriesToInvalidate(endpoint);
      queriesToInvalidate.forEach(key => {
        queryClient.invalidateQueries({ queryKey: [key] });
      });
      message.success('Успешно обновлено');
      closeModals();
    },
    onError: () => message.error('Ошибка при обновлении')
  });

  const deleteMutation = useMutation({
    mutationFn: async (endpoint: string) => {
      const { data: { session } } = await supabase.auth.getSession();
      const response = await fetch(endpoint, {
        method: 'DELETE',
        headers: { 'Authorization': `Bearer ${session?.access_token}` }
      });
      if (!response.ok) throw new Error('Failed to delete');
    },
    onSuccess: (_, endpoint) => {
      const queriesToInvalidate = getQueriesToInvalidate(endpoint);
      queriesToInvalidate.forEach(key => {
        queryClient.invalidateQueries({ queryKey: [key] });
      });
      message.success('Успешно удалено');
    },
    onError: () => message.error('Ошибка при удалении')
  });

  const closeModals = () => {
    setObjectModalVisible(false);
    setSectionModalVisible(false);
    setBucketModalVisible(false);
    setKbModalVisible(false);
    setEditingItem(null);
    form.resetFields();
  };

  // Handlers for Objects
  const handleObjectSubmit = (values: any) => {
    if (editingItem) {
      updateMutation.mutate({
        endpoint: `/api/v1/admin/rag/objects/${editingItem.id}`,
        data: values
      });
    } else {
      createMutation.mutate({
        endpoint: '/api/v1/admin/rag/objects',
        data: values
      });
    }
  };

  const handleDeleteObject = (id: string) => {
    deleteMutation.mutate(`/api/v1/admin/rag/objects/${id}`);
  };

  // Handlers for Sections
  const handleSectionSubmit = (values: any) => {
    if (editingItem) {
      updateMutation.mutate({
        endpoint: `/api/v1/admin/rag/logical-sections/${editingItem.id}`,
        data: values
      });
    } else {
      createMutation.mutate({
        endpoint: '/api/v1/admin/rag/logical-sections',
        data: values
      });
    }
  };

  const handleDeleteSection = (id: string) => {
    deleteMutation.mutate(`/api/v1/admin/rag/logical-sections/${id}`);
  };

  // Handlers for Buckets
  const handleBucketSubmit = (values: any) => {
    if (editingItem) {
      updateMutation.mutate({
        endpoint: `/api/v1/admin/rag/buckets/${editingItem.id}`,
        data: values
      });
    } else {
      createMutation.mutate({
        endpoint: '/api/v1/admin/rag/buckets',
        data: values
      });
    }
  };

  const handleDeleteBucket = (id: string) => {
    deleteMutation.mutate(`/api/v1/admin/rag/buckets/${id}`);
  };

  // Handlers for Knowledge Bases
  const handleKbSubmit = async (values: any) => {
    if (editingItem) {
      updateMutation.mutate({
        endpoint: `/api/v1/admin/rag/knowledge-bases/${editingItem.id}`,
        data: values
      });
    } else {
      // For new KB, calculate version_number automatically
      try {
        // Count existing KBs with the same cloud_kb_root_id
        const { data: { session } } = await supabase.auth.getSession();
        const response = await fetch('/api/v1/admin/rag/knowledge-bases', {
          headers: { 'Authorization': `Bearer ${session?.access_token}` }
        });
        const existingKbs = await response.json();
        const sameRootIdKbs = existingKbs.filter((kb: any) => kb.cloud_kb_root_id === values.cloud_kb_root_id);
        const nextVersion = sameRootIdKbs.length + 1;
        
        createMutation.mutate({
          endpoint: '/api/v1/admin/rag/knowledge-bases',
          data: { ...values, version_number: nextVersion }
        });
      } catch (error) {
        console.error('Error calculating version number:', error);
        message.error('Ошибка при расчете номера версии');
      }
    }
  };

  const handleDeleteKb = (id: string) => {
    deleteMutation.mutate(`/api/v1/admin/rag/knowledge-bases/${id}`);
  };

  // Table columns
  const objectColumns = [
    { title: 'ID', dataIndex: 'id', key: 'id', width: 280 },
    { title: 'Название', dataIndex: 'name', key: 'name' },
    {
      title: 'Действия',
      key: 'actions',
      render: (_: any, record: any) => (
        <Space>
          <Button 
            icon={<EditOutlined />} 
            size="small"
            onClick={() => {
              setEditingItem(record);
              form.setFieldsValue(record);
              setObjectModalVisible(true);
            }}
          />
          <Popconfirm
            title="Удалить объект?"
            onConfirm={() => handleDeleteObject(record.id)}
          >
            <Button icon={<DeleteOutlined />} size="small" danger />
          </Popconfirm>
        </Space>
      )
    }
  ];

  const sectionColumns = [
    { title: 'ID', dataIndex: 'id', key: 'id', width: 280 },
    { title: 'Название', dataIndex: 'name', key: 'name' },
    {
      title: 'Действия',
      key: 'actions',
      render: (_: any, record: any) => (
        <Space>
          <Button 
            icon={<EditOutlined />} 
            size="small"
            onClick={() => {
              setEditingItem(record);
              form.setFieldsValue(record);
              setSectionModalVisible(true);
            }}
          />
          <Popconfirm
            title="Удалить раздел?"
            onConfirm={() => handleDeleteSection(record.id)}
          >
            <Button icon={<DeleteOutlined />} size="small" danger />
          </Popconfirm>
        </Space>
      )
    }
  ];

  const bucketColumns = [
    { title: 'ID', dataIndex: 'id', key: 'id', width: 200 },
    { title: 'Имя бакета', dataIndex: 'name', key: 'name' },
    { title: 'ID Тенанта', dataIndex: 'tenant_id', key: 'tenant_id', width: 200 },
    { 
      title: 'Объект', 
      key: 'object',
      render: (_: any, record: any) => record.rag_objects?.name || 'N/A'
    },
    {
      title: 'Действия',
      key: 'actions',
      render: (_: any, record: any) => (
        <Space>
          <Button 
            icon={<EditOutlined />} 
            size="small"
            onClick={() => {
              setEditingItem(record);
              form.setFieldsValue({
                name: record.name,
                rag_object_id: record.rag_object_id,
                tenant_id: record.tenant_id
              });
              setBucketModalVisible(true);
            }}
          />
          <Popconfirm
            title="Удалить бакет?"
            onConfirm={() => handleDeleteBucket(record.id)}
          >
            <Button icon={<DeleteOutlined />} size="small" danger />
          </Popconfirm>
        </Space>
      )
    }
  ];

  const kbColumns = [
    { title: 'ID', dataIndex: 'id', key: 'id', width: 180 },
    { title: 'Название', dataIndex: 'name', key: 'name', width: 150 },
    { title: 'Root ID', dataIndex: 'cloud_kb_root_id', key: 'cloud_kb_root_id', width: 180 },
    { title: 'Version ID', dataIndex: 'cloud_kb_version_id', key: 'cloud_kb_version_id', width: 180 },
    { title: 'Версия', dataIndex: 'version_number', key: 'version_number', width: 80 },
    { 
      title: 'Раздел', 
      key: 'section',
      width: 150,
      render: (_: any, record: any) => record.rag_logical_sections?.name || 'N/A'
    },
    {
      title: 'Действия',
      key: 'actions',
      width: 120,
      render: (_: any, record: any) => (
        <Space>
          <Button 
            icon={<EditOutlined />} 
            size="small"
            onClick={() => {
              setEditingItem(record);
              form.setFieldsValue({
                name: record.name,
                cloud_kb_root_id: record.cloud_kb_root_id,
                cloud_kb_version_id: record.cloud_kb_version_id,
                version_number: record.version_number,
                s3_bucket_id: record.s3_bucket_id,
                logical_section_id: record.logical_section_id
              });
              setKbModalVisible(true);
            }}
          />
          <Popconfirm
            title="Удалить базу знаний?"
            onConfirm={() => handleDeleteKb(record.id)}
          >
            <Button icon={<DeleteOutlined />} size="small" danger />
          </Popconfirm>
        </Space>
      )
    }
  ];

  return (
    <div>
      <Title level={3}>Управление RAG</Title>

      <Space style={{ marginBottom: 16 }}>
        <Button 
          type={activeSection === 'objects' ? 'primary' : 'default'}
          onClick={() => setActiveSection('objects')}
        >
          Объекты
        </Button>
        <Button 
          type={activeSection === 'sections' ? 'primary' : 'default'}
          onClick={() => setActiveSection('sections')}
        >
          Логические разделы
        </Button>
        <Button 
          type={activeSection === 'buckets' ? 'primary' : 'default'}
          onClick={() => setActiveSection('buckets')}
        >
          S3 Бакеты
        </Button>
        <Button 
          type={activeSection === 'kb' ? 'primary' : 'default'}
          onClick={() => setActiveSection('kb')}
        >
          Базы знаний
        </Button>
      </Space>

      {activeSection === 'objects' && (
        <>
          <Button 
            type="primary" 
            icon={<PlusOutlined />}
            onClick={() => setObjectModalVisible(true)}
            style={{ marginBottom: 16 }}
          >
            Добавить объект
          </Button>
          <Table 
            columns={objectColumns} 
            dataSource={objects} 
            rowKey="id"
            loading={objectsLoading}
          />
        </>
      )}

      {activeSection === 'sections' && (
        <>
          <Button 
            type="primary" 
            icon={<PlusOutlined />}
            onClick={() => setSectionModalVisible(true)}
            style={{ marginBottom: 16 }}
          >
            Добавить раздел
          </Button>
          <Table 
            columns={sectionColumns} 
            dataSource={sections} 
            rowKey="id"
            loading={sectionsLoading}
          />
        </>
      )}

      {activeSection === 'buckets' && (
        <>
          <Button 
            type="primary" 
            icon={<PlusOutlined />}
            onClick={() => setBucketModalVisible(true)}
            style={{ marginBottom: 16 }}
          >
            Добавить бакет
          </Button>
          <Table 
            columns={bucketColumns} 
            dataSource={buckets} 
            rowKey="id"
            loading={bucketsLoading}
          />
        </>
      )}

      {activeSection === 'kb' && (
        <>
          <Button 
            type="primary" 
            icon={<PlusOutlined />}
            onClick={() => setKbModalVisible(true)}
            style={{ marginBottom: 16 }}
          >
            Добавить базу знаний
          </Button>
          <Table 
            columns={kbColumns} 
            dataSource={knowledgeBases} 
            rowKey="id"
            loading={kbLoading}
            scroll={{ x: 1200 }}
          />
        </>
      )}

      {/* Object Modal */}
      <Modal
        title={editingItem ? 'Редактировать объект' : 'Добавить объект'}
        open={objectModalVisible}
        onCancel={closeModals}
        onOk={() => form.submit()}
      >
        <Form form={form} onFinish={handleObjectSubmit} layout="vertical">
          <Form.Item name="name" label="Название" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
        </Form>
      </Modal>

      {/* Section Modal */}
      <Modal
        title={editingItem ? 'Редактировать раздел' : 'Добавить раздел'}
        open={sectionModalVisible}
        onCancel={closeModals}
        onOk={() => form.submit()}
      >
        <Form form={form} onFinish={handleSectionSubmit} layout="vertical">
          <Form.Item name="name" label="Название" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
        </Form>
      </Modal>

      {/* Bucket Modal */}
      <Modal
        title={editingItem ? 'Редактировать бакет' : 'Добавить бакет'}
        open={bucketModalVisible}
        onCancel={closeModals}
        onOk={() => form.submit()}
      >
        <Form form={form} onFinish={handleBucketSubmit} layout="vertical">
          <Form.Item name="name" label="Имя бакета" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          <Form.Item name="rag_object_id" label="Объект" rules={[{ required: true }]}>
            <Select options={objects.map((o: any) => ({ label: o.name, value: o.id }))} />
          </Form.Item>
          <Form.Item name="tenant_id" label="ID Тенанта" rules={[{ required: true }]}>
            <Input placeholder="UUID тенанта" />
          </Form.Item>
        </Form>
      </Modal>

      {/* Knowledge Base Modal */}
      <Modal
        title={editingItem ? 'Редактировать базу знаний' : 'Добавить базу знаний'}
        open={kbModalVisible}
        onCancel={closeModals}
        onOk={() => form.submit()}
        width={600}
      >
        <Form form={form} onFinish={handleKbSubmit} layout="vertical">
          <Form.Item name="name" label="Название" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          <Form.Item name="cloud_kb_root_id" label="Cloud KB Root ID" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          <Form.Item name="cloud_kb_version_id" label="Cloud KB Version ID" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          {editingItem && (
            <Form.Item name="version_number" label="Номер версии" rules={[{ required: true }]}>
              <InputNumber min={1} style={{ width: '100%' }} />
            </Form.Item>
          )}
          <Form.Item name="s3_bucket_id" label="S3 Бакет" rules={[{ required: true }]}>
            <Select options={buckets.map((b: any) => ({ label: `${b.name} (${b.rag_objects?.name})`, value: b.id }))} />
          </Form.Item>
          <Form.Item name="logical_section_id" label="Логический раздел" rules={[{ required: true }]}>
            <Select options={sections.map((s: any) => ({ label: s.name, value: s.id }))} />
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
};

