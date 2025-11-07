import React, { useState } from 'react';
import { Table, Button, Modal, Form, Input, Select, Space, Typography, App, Popconfirm, InputNumber, Row, Col } from 'antd';
import { PlusOutlined, EditOutlined, DeleteOutlined, TeamOutlined } from '@ant-design/icons';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '@/shared/lib/supabase';
import { RagObjectsModal } from './rag-objects-modal';

const { Title, Text } = Typography;

// Fetch functions
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
  const [activeSection, setActiveSection] = useState<'sections' | 'buckets' | 'kb'>(() => {
    const saved = localStorage.getItem('ragManagementActiveTab');
    return (saved as 'sections' | 'buckets' | 'kb') || 'sections';
  });
  const [selectedObjectId, setSelectedObjectId] = useState<string | null>(null);

  // Save active section to localStorage when it changes
  const handleSectionChange = (section: 'sections' | 'buckets' | 'kb') => {
    setActiveSection(section);
    localStorage.setItem('ragManagementActiveTab', section);
  };

  // Modals
  const [objectsModalVisible, setObjectsModalVisible] = useState(false);
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
    staleTime: 5 * 60 * 1000
  });

  const { data: sections = [], isLoading: sectionsLoading } = useQuery({
    queryKey: ['ragSections'],
    queryFn: fetchLogicalSections,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000
  });

  const { data: buckets = [], isLoading: bucketsLoading } = useQuery({
    queryKey: ['ragBuckets'],
    queryFn: fetchS3Buckets,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000
  });

  const { data: knowledgeBases = [], isLoading: kbLoading } = useQuery({
    queryKey: ['ragKnowledgeBases'],
    queryFn: fetchKnowledgeBases,
    refetchOnWindowFocus: false,
    staleTime: 5 * 60 * 1000
  });

  // Helper for query invalidation
  const getQueriesToInvalidate = (endpoint: string): string[] => {
    const queries = [];
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
      return response.json();
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
    setObjectsModalVisible(false);
    setSectionModalVisible(false);
    setBucketModalVisible(false);
    setKbModalVisible(false);
    setEditingItem(null);
    form.resetFields();
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
      try {
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

  // Filtered data
  const filteredBuckets = selectedObjectId
    ? buckets.filter(b => b.rag_object_id === selectedObjectId)
    : buckets;

  const filteredKbs = selectedObjectId
    ? knowledgeBases.filter(kb =>
        buckets
          .filter(b => b.rag_object_id === selectedObjectId)
          .some(b => b.id === kb.s3_bucket_id)
      )
    : knowledgeBases;

  // Table columns
  const sectionColumns = [
    { title: 'Название', dataIndex: 'name', key: 'name' },
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
    { title: 'Имя бакета', dataIndex: 'name', key: 'name' },
    { title: 'ID Тенанта', dataIndex: 'tenant_id', key: 'tenant_id' },
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
    { title: 'Название', dataIndex: 'name', key: 'name' },
    { title: 'ID базы знаний', dataIndex: 'cloud_kb_root_id', key: 'cloud_kb_root_id' },
    { title: 'ID версии', dataIndex: 'cloud_kb_version_id', key: 'cloud_kb_version_id' },
    { title: 'Версия', dataIndex: 'version_number', key: 'version_number', width: 80 },
    {
      title: 'Раздел',
      key: 'section',
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
    <div style={{ padding: 24 }}>
      {/* Header with object selector and objects button */}
      <Row gutter={16} style={{ marginBottom: 24, alignItems: 'center' }}>
        <Col>
          <Title level={3} style={{ margin: 0 }}>Управление RAG</Title>
        </Col>
        <Col>
          <Select
            placeholder="Выберите объект"
            value={selectedObjectId}
            onChange={setSelectedObjectId}
            style={{ width: 250 }}
            allowClear
            options={objects.map(obj => ({ label: obj.name, value: obj.id }))}
            loading={objectsLoading}
          />
        </Col>
        <Col>
          <Button
            icon={<TeamOutlined />}
            onClick={() => setObjectsModalVisible(true)}
          >
            Объекты
          </Button>
        </Col>
      </Row>

      {/* Tabs with Add button */}
      <Row justify="space-between" style={{ marginBottom: 16 }}>
        <Col>
          <Space>
            <Button
              type={activeSection === 'sections' ? 'primary' : 'default'}
              onClick={() => handleSectionChange('sections')}
            >
              Логические разделы
            </Button>
            <Button
              type={activeSection === 'buckets' ? 'primary' : 'default'}
              onClick={() => handleSectionChange('buckets')}
            >
              S3 бакеты
            </Button>
            <Button
              type={activeSection === 'kb' ? 'primary' : 'default'}
              onClick={() => handleSectionChange('kb')}
            >
              Базы знаний
            </Button>
          </Space>
        </Col>
        <Col>
          {activeSection === 'sections' && (
            <Button
              type="primary"
              icon={<PlusOutlined />}
              onClick={() => setSectionModalVisible(true)}
            >
              Добавить раздел
            </Button>
          )}
          {activeSection === 'buckets' && (
            <Button
              type="primary"
              icon={<PlusOutlined />}
              onClick={() => setBucketModalVisible(true)}
            >
              Добавить бакет
            </Button>
          )}
          {activeSection === 'kb' && (
            <Button
              type="primary"
              icon={<PlusOutlined />}
              onClick={() => setKbModalVisible(true)}
            >
              Добавить базу знаний
            </Button>
          )}
        </Col>
      </Row>

      {/* Sections Tab */}
      {activeSection === 'sections' && (
        <Table
          columns={sectionColumns}
          dataSource={sections}
          rowKey="id"
          loading={sectionsLoading}
        />
      )}

      {/* Buckets Tab */}
      {activeSection === 'buckets' && (
        <>
          {selectedObjectId && (
            <Text type="secondary" style={{ display: 'block', marginBottom: 12 }}>
              Фильтр по объекту: {objects.find(o => o.id === selectedObjectId)?.name}
            </Text>
          )}
          <Table
            columns={bucketColumns}
            dataSource={filteredBuckets}
            rowKey="id"
            loading={bucketsLoading}
          />
        </>
      )}

      {/* Knowledge Bases Tab */}
      {activeSection === 'kb' && (
        <>
          {selectedObjectId && (
            <Text type="secondary" style={{ display: 'block', marginBottom: 12 }}>
              Фильтр по объекту: {objects.find(o => o.id === selectedObjectId)?.name}
            </Text>
          )}
          <Table
            columns={kbColumns}
            dataSource={filteredKbs}
            rowKey="id"
            loading={kbLoading}
          />
        </>
      )}

      {/* Objects Modal */}
      <RagObjectsModal visible={objectsModalVisible} onClose={() => setObjectsModalVisible(false)} />

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
            <Select options={objects.map(o => ({ label: o.name, value: o.id }))} />
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
          <Form.Item name="cloud_kb_root_id" label="ID базы знаний" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          <Form.Item name="cloud_kb_version_id" label="ID версии" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          {editingItem && (
            <Form.Item name="version_number" label="Номер версии" rules={[{ required: true }]}>
              <InputNumber min={1} style={{ width: '100%' }} />
            </Form.Item>
          )}
          <Form.Item name="s3_bucket_id" label="S3 Бакет" rules={[{ required: true }]}>
            <Select options={buckets.map(b => ({ label: `${b.name} (${b.rag_objects?.name})`, value: b.id }))} />
          </Form.Item>
          <Form.Item name="logical_section_id" label="Логический раздел" rules={[{ required: true }]}>
            <Select options={sections.map(s => ({ label: s.name, value: s.id }))} />
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
};

