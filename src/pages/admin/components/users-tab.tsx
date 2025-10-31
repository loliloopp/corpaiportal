import React, { useState, useMemo } from 'react';
import { Typography, Table, Select, InputNumber, Button, App, Form, Switch } from 'antd';
import { EditOutlined, CheckOutlined, CloseOutlined } from '@ant-design/icons';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getAllUsers, updateUserProfile, UserProfile } from '@/entities/users/api/users-api';
import { getModelsWithAccess, setModelPermission, ModelWithAccess, getAllUsersModelAccess } from '@/entities/models/api/models-api';

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

const breakTextByWords = (text: string): string => {
  const words = text.match(/[a-zа-яё]+(?:\s*[\d.]+)?/gi) || [];
  return words.map(w => w.trim()).join('\n');
};

export const UsersTab: React.FC = () => {
  const { message } = App.useApp();
  const [form] = Form.useForm();
  const queryClient = useQueryClient();
  const [editingKey, setEditingKey] = useState('');
  const [emailFilter, setEmailFilter] = useState<string[]>([]);
  const [limitFilter, setLimitFilter] = useState<number[]>([]);
  const [pageSize, setPageSize] = useState(50);

  const { data: users, isLoading: isLoadingUsers } = useQuery({ queryKey: ['users'], queryFn: getAllUsers });

  const { data: allModels, isLoading: isLoadingModels } = useQuery<ModelWithAccess[]>({
    queryKey: ['allModels'],
    queryFn: () => getModelsWithAccess('00000000-0000-0000-0000-000000000000'),
  });

  const userModelAccessMap = useMemo(() => {
    const map: Record<string, Record<string, ModelWithAccess>> = {};
    if (users) {
      users.forEach(user => {
        map[user.id] = {};
      });
    }
    return map;
  }, [users]);

  const { data: allUserModels, isLoading: isLoadingAllUserModels } = useQuery<
    Array<{ userId: string; models: ModelWithAccess[] }>
  >({
    queryKey: ['allUserModels', users?.map(u => u.id).join(',')],
    queryFn: async () => {
      if (!users || users.length === 0) return [];
      // Use optimized batch query instead of Promise.all
      const userIds = users.map(u => u.id);
      const accessMap = await getAllUsersModelAccess(userIds);
      
      return userIds.map(userId => ({
        userId,
        models: accessMap.get(userId) || [],
      }));
    },
    enabled: !!users && users.length > 0,
  });

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
    onSuccess: () => {
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
      // Filter only allowed fields that exist in the database
      const allowedFields: (keyof UserProfile)[] = ['role', 'daily_request_limit', 'display_name', 'email'];
      const filteredUpdates: Partial<UserProfile> = {};
      
      for (const field of allowedFields) {
        if (row[field] !== undefined && row[field] !== null) {
          filteredUpdates[field] = row[field];
        }
      }
      
      // Ensure role is lowercase if provided
      if (filteredUpdates.role) {
        filteredUpdates.role = filteredUpdates.role.toLowerCase() as 'user' | 'admin';
      }
      
      updateUserMutation.mutate({ userId: key as string, updates: filteredUpdates });
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
      defaultSortOrder: 'ascend' as const,
      sorter: (a: UserProfile, b: UserProfile) => {
        const nameA = (a.display_name || a.email || '').toLowerCase();
        const nameB = (b.display_name || b.email || '').toLowerCase();
        return nameA.localeCompare(nameB);
      },
      filters: useMemo(() => {
        if (!users) return [];
        const uniqueEmails = Array.from(new Set(users.map(u => u.email || '').filter(Boolean)));
        return uniqueEmails.map(email => ({
          text: email,
          value: email,
        }));
      }, [users]),
      filteredValue: emailFilter,
      onFilter: (value: string, record: UserProfile) => {
        return record.email === value;
      },
      render: (_: unknown, record: UserProfile) => (
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
      render: (_: unknown, record: UserProfile) => {
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
      sorter: (a: UserProfile, b: UserProfile) => (a.daily_request_limit || 0) - (b.daily_request_limit || 0),
      filters: useMemo(() => {
        if (!users) return [];
        const uniqueLimits = Array.from(new Set(users.map(u => u.daily_request_limit || 0)));
        return uniqueLimits.sort((a, b) => a - b).map(limit => ({
          text: String(limit),
          value: limit,
        }));
      }, [users]),
      filteredValue: limitFilter,
      onFilter: (value: number, record: UserProfile) => (record.daily_request_limit || 0) === value,
      render: (limit: number) => limit,
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
      render: (_: unknown, record: UserProfile) => {
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
    return columns.map((col) => {
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
    <Form form={form} component={false}>
      <div style={{ padding: '0 0 24px 0' }}>
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
          sticky
          rowClassName={(_, index) => index % 2 === 0 ? 'ant-table-row-light' : 'ant-table-row-gray'}
          style={{
            borderCollapse: 'collapse',
          }}
          pagination={{
            pageSize: pageSize,
            pageSizeOptions: ['10', '20', '50', '100'],
            showSizeChanger: true,
            showTotal: (total, range) => `${range[0]}-${range[1]} из ${total}`,
          }}
          onChange={(pagination, filters) => {
            setEmailFilter(filters.email ? filters.email.map(String) : []);
            setLimitFilter(filters.daily_request_limit ? filters.daily_request_limit.map(Number) : []);
            if (pagination.pageSize) {
              setPageSize(pagination.pageSize);
            }
          }}
        />
      </div>
    </Form>
  );
};

