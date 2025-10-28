import React, { useState, useMemo } from 'react';
import { Typography, Table, Select, InputNumber, Button, message, Form, Switch, Spin } from 'antd';
import { EditOutlined, CheckOutlined, CloseOutlined } from '@ant-design/icons';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getAllUsers, updateUserProfile, UserProfile } from '@/entities/users/api/users-api';
import { getModelsWithAccess, setModelPermission, ModelWithAccess } from '@/entities/models/api/models-api';
import ModelRoutingTable from '@/widgets/model-routing-table';

const { Title } = Typography;
const { Option } = Select;

interface EditableCellProps extends React.HTMLAttributes<HTMLElement> {
  editing: boolean;
  dataIndex: keyof UserProfile;
  title: any;
  inputType: 'number' | 'select';
  record: UserProfile;
  index: number;
}

const EditableCell: React.FC<React.PropsWithChildren<EditableCellProps>> = ({
  editing,
  dataIndex,
  title,
  inputType,
  children,
  ...restProps
}) => {
  let inputNode: React.ReactNode = null;
  if (dataIndex === 'role') {
    inputNode = (
      <Select style={{ width: 120 }}>
        <Option value="admin">Admin</Option>
        <Option value="user">User</Option>
      </Select>
    );
  } else if (dataIndex === 'daily_request_limit') {
    inputNode = <InputNumber min={0} />;
  } else {
    // This will handle the dynamic model columns
    inputNode = <Switch />;
  }

  return (
    <td {...restProps}>
      {editing ? (
        <Form.Item
          name={dataIndex}
          style={{ margin: 0 }}
          rules={[{ required: true, message: `Please Input ${title}!` }]}
        >
          {inputNode}
        </Form.Item>
      ) : (
        children
      )}
    </td>
  );
};

const AdminPage: React.FC = () => {
  const [form] = Form.useForm();
  const queryClient = useQueryClient();
  const [editingKey, setEditingKey] = useState('');

  // Function to break text into words only (letters + digits with dots), skip pure digit separators
  const breakTextByWords = (text: string): string => {
    const words = text.match(/[a-zа-яё]+(?:\s*[\d.]+)?/gi) || [];
    return words.map(w => w.trim()).join('\n');
  };

  const { data: users, isLoading: isLoadingUsers } = useQuery({ queryKey: ['users'], queryFn: getAllUsers });

  // Fetch all models available in the system once, we'll use this to generate columns
  const { data: allModels, isLoading: isLoadingModels } = useQuery<ModelWithAccess[]>({
    queryKey: ['allModels'],
    queryFn: () => getModelsWithAccess('00000000-0000-0000-0000-000000000000'),
  });

  // Fetch model access for all users - this is done at the component level to follow React Hooks rules
  const userModelAccessMap = useMemo(() => {
    const map: Record<string, Record<string, ModelWithAccess>> = {};
    if (users) {
      users.forEach(user => {
        map[user.id] = {};
      });
    }
    return map;
  }, [users]);

  // Fetch all user model accesses
  const { data: allUserModels, isLoading: isLoadingAllUserModels } = useQuery<
    Array<{ userId: string; models: ModelWithAccess[] }>
  >({
    queryKey: ['allUserModels', users?.map(u => u.id).join(',')],
    queryFn: async () => {
      if (!users) return [];
      return Promise.all(
        users.map(async (user) => ({
          userId: user.id,
          models: await getModelsWithAccess(user.id),
        }))
      );
    },
    enabled: !!users && users.length > 0,
  });

  // Create a lookup map for quick access
  const userModelMap = useMemo(() => {
    const map: Record<string, Record<string, ModelWithAccess>> = {};
    if (allUserModels) {
      allUserModels.forEach(({ userId, models }) => {
        map[userId] = {};
        models.forEach(model => {
          map[userId][model.id] = model;
        });
      });
    }
    return map;
  }, [allUserModels]);

  const updateUserMutation = useMutation({
    mutationFn: (variables: { userId: string; updates: Partial<UserProfile> }) =>
      updateUserProfile(variables.userId, variables.updates),
    onSuccess: () => {
      message.success('Профиль пользователя обновлен');
      queryClient.invalidateQueries({ queryKey: ['users'] });
      setEditingKey('');
    },
    onError: (error) => {
      message.error(`Ошибка при обновлении профиля: ${error.message}`);
    },
  });

  const setModelPermissionMutation = useMutation({
    mutationFn: (variables: { userId: string; modelId: string; hasAccess: boolean }) =>
      setModelPermission(variables.userId, variables.modelId, variables.hasAccess),
    onSuccess: (_, variables) => {
      message.success('Доступ к модели обновлен');
      queryClient.invalidateQueries({ queryKey: ['allUserModels', users?.map(u => u.id).join(',')] });
    },
    onError: (error) => {
      message.error(`Ошибка при обновлении доступа: ${error.message}`);
    },
  });

  const isEditing = (record: UserProfile) => record.id === editingKey;

  const edit = (record: Partial<UserProfile> & { id: React.Key }) => {
    form.setFieldsValue({ ...record });
    setEditingKey(record.id);
  };

  const cancel = () => {
    setEditingKey('');
  };

  const save = async (key: React.Key) => {
    try {
      const row = (await form.validateFields()) as Partial<UserProfile>;
      updateUserMutation.mutate({ userId: key as string, updates: row });
    } catch (errInfo) {
      console.log('Validate Failed:', errInfo);
    }
  };

  const baseColumns = [
    { 
      title: 'Пользователи', 
      dataIndex: 'email', 
      key: 'email', 
      width: '25%',
      render: (_: any, record: UserProfile) => (
        <div>
          <div style={{ fontWeight: 500 }}>{record.display_name || 'N/A'}</div>
          <div style={{ fontSize: '0.85em', color: '#999' }}>{record.email}</div>
        </div>
      ),
    },
    {
      title: '',
      dataIndex: 'action',
      key: 'action',
      width: 40,
      align: 'center' as const,
      render: (_: any, record: UserProfile) => {
        const editable = isEditing(record);
        return editable ? (
          <span>
            <Button
              type="text"
              size="small"
              icon={<CheckOutlined />}
              onClick={() => save(record.id)}
              style={{ padding: 4 }}
            />
            <Button
              type="text"
              size="small"
              icon={<CloseOutlined />}
              onClick={cancel}
              style={{ padding: 4 }}
            />
          </span>
        ) : (
          <Button
            type="text"
            size="small"
            icon={<EditOutlined />}
            onClick={() => edit(record)}
            disabled={editingKey !== ''}
            style={{ padding: 4 }}
          />
        );
      },
    },
    {
      title: 'Роль',
      dataIndex: 'role',
      key: 'role',
      editable: true,
      inputType: 'select',
      flex: 0.6,
      align: 'center' as const,
    },
    {
      title: 'Дневной\nлимит',
      dataIndex: 'daily_request_limit',
      key: 'daily_request_limit',
      editable: true,
      inputType: 'number',
      flex: 0.7,
      align: 'center' as const,
    },
  ];

  const modelColumns = useMemo(() => {
    if (!allModels) return [];
    return allModels.map((model) => ({
      title: breakTextByWords(model.display_name),
      dataIndex: model.id,
      key: model.id,
      flex: 1,
      align: 'center' as const,
      render: (_: any, record: UserProfile) => {
        const userModels = userModelMap[record.id] || {};
        const modelAccess = userModels[model.id];
        const hasAccess = modelAccess?.has_access ?? false;
        const isDefault = model.is_default_access;

        return (
          <Switch
            checked={hasAccess}
            disabled={isDefault}
            loading={isLoadingAllUserModels}
            onChange={(checked) => {
              setModelPermissionMutation.mutate({
                userId: record.id,
                modelId: model.id,
                hasAccess: checked,
              });
            }}
          />
        );
      },
    }));
  }, [allModels, userModelMap, isLoadingAllUserModels, setModelPermissionMutation]);

  const mergedColumns = useMemo(() => {
    const columns = [...baseColumns, ...modelColumns];
    return columns.map((col: any) => {
      if (!col.editable) {
        return col;
      }
      return {
        ...col,
        onCell: (record: UserProfile) => ({
          record,
          inputType: col.inputType,
          dataIndex: col.dataIndex,
          title: col.title,
          editing: isEditing(record),
        }),
      };
    });
  }, [baseColumns, modelColumns, isEditing]);

  return (
    <div>
      <Title level={2}>Управление пользователями</Title>
      <Form form={form} component={false}>
        <Table
          components={{
            body: {
              cell: EditableCell,
            },
          }}
          dataSource={users}
          columns={mergedColumns}
          rowKey="id"
          loading={isLoadingUsers || isLoadingModels || isLoadingAllUserModels}
          bordered={false}
          scroll={{ x: 'auto' }}
          rowClassName={(_, index) => index % 2 === 0 ? 'ant-table-row-light' : 'ant-table-row-gray'}
          style={{
            borderCollapse: 'collapse',
          }}
        />
      </Form>

      {/* Model Routing Management Section */}
      <ModelRoutingTable />

      <style>{`
        .ant-table-row-light {
          background-color: #ffffff;
        }
        .ant-table-row-gray {
          background-color: #f5f5f5;
        }
        .ant-table .ant-table-cell {
          border-right: none;
          border-bottom: 1px solid #e5e5e5;
          padding: 4px 8px !important;
        }
        .ant-table thead .ant-table-cell {
          border-bottom: 1px solid #e5e5e5;
          text-align: center;
          white-space: normal;
          word-break: break-word;
          padding: 6px 4px !important;
          font-size: 0.85em;
        }
        .ant-table-row-light .ant-table-cell-fix-left {
          background-color: #ffffff;
        }
        .ant-table-row-gray .ant-table-cell-fix-left {
          background-color: #f5f5f5;
        }
        table {
          table-layout: fixed !important;
        }
        .ant-table table {
          width: 100% !important;
        }
        .ant-table-tbody > tr > td {
          font-size: 0.9em;
        }
      `}</style>
    </div>
  );
};

export default AdminPage;
