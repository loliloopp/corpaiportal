import React, { useState, useMemo } from 'react';
import { Typography, Table, Select, InputNumber, Button, message, Form, Switch, Spin, Tabs, Row, Col, Statistic, Card } from 'antd';
import { EditOutlined, CheckOutlined, CloseOutlined } from '@ant-design/icons';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { getAllUsers, updateUserProfile, UserProfile } from '@/entities/users/api/users-api';
import { getModelsWithAccess, setModelPermission, ModelWithAccess } from '@/entities/models/api/models-api';
import ModelRoutingTable from '@/widgets/model-routing-table';
import { useThemeContext } from '@/app/providers/theme-provider';
import { LineChart, Line, BarChart, Bar, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer, PieChart, Pie, Cell } from 'recharts';
import { getGeneralStats, getModelUsageStats, getUserStats, getAllUsersForStats, getUserMessageHistory, getUserModelUsageStats } from '@/entities/statistics/api/statistics-api';

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

// Users Tab Component
const UsersTab: React.FC = () => {
  const [form] = Form.useForm();
  const queryClient = useQueryClient();
  const [editingKey, setEditingKey] = useState('');
  const [emailFilter, setEmailFilter] = useState<string[]>([]);
  const [limitFilter, setLimitFilter] = useState<number[]>([]);
  const [pageSize, setPageSize] = useState(50);

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
      onFilter: (value: any, record: UserProfile) => {
        return record.email === value;
      },
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
      onFilter: (value: any, record: UserProfile) => (record.daily_request_limit || 0) === value,
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
          onChange={(pagination, filters, sorter) => {
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

// Models Tab Component
const ModelsTab: React.FC = () => {
  return <div style={{ padding: '0 0 24px 0' }}><ModelRoutingTable /></div>;
};

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042'];

// General Statistics Tab
const GeneralStatsTab: React.FC = () => {
  const [period, setPeriod] = useState<'day' | 'week' | 'month'>('day');
  const { data: stats, isLoading: isLoadingStats } = useQuery({
    queryKey: ['generalStats', period],
    queryFn: () => getGeneralStats(period),
  });
  const { data: modelStats, isLoading: isLoadingModelStats } = useQuery({
    queryKey: ['modelUsageStats', period],
    queryFn: () => getModelUsageStats(period),
  });

  const tableData = modelStats?.map(m => ({
    key: m.model,
    model: m.model,
    requests: m.total_requests,
    tokens: m.total_tokens,
  })) || [];

  const totalRequests = tableData.reduce((acc, cur) => acc + Number(cur.requests), 0);
  const totalTokens = tableData.reduce((acc, cur) => acc + Number(cur.tokens), 0);

  const columns = [
    { title: 'Модель', dataIndex: 'model', key: 'model' },
    { title: 'Запросы', dataIndex: 'requests', key: 'requests' },
    { title: 'Токены', dataIndex: 'tokens', key: 'tokens' },
  ];

  return (
    <Spin spinning={isLoadingStats || isLoadingModelStats}>
      <div style={{
        position: 'sticky',
        top: 0,
        background: '#ffffff',
        zIndex: 9,
        paddingBottom: 12,
      }}>
        <Select defaultValue="day" onChange={setPeriod} style={{ marginBottom: 0 }}>
          <Select.Option value="day">За день</Select.Option>
          <Select.Option value="week">За неделю</Select.Option>
          <Select.Option value="month">За месяц</Select.Option>
        </Select>
      </div>
      <Table 
        dataSource={tableData}
        columns={columns}
        pagination={false}
        bordered
        size="small"
        style={{ marginBottom: 20 }}
        summary={() => (
          <Table.Summary.Row>
            <Table.Summary.Cell index={0}><strong>Всего</strong></Table.Summary.Cell>
            <Table.Summary.Cell index={1}><strong>{totalRequests}</strong></Table.Summary.Cell>
            <Table.Summary.Cell index={2}><strong>{totalTokens}</strong></Table.Summary.Cell>
          </Table.Summary.Row>
        )}
      />
      <Title level={4} style={{ marginTop: 20 }}>Динамика использования</Title>
      <ResponsiveContainer width="100%" height={300}>
        <LineChart data={stats}>
          <XAxis dataKey="date_trunc" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Line type="linear" dataKey="total_requests" stroke="#8884d8" name="Запросы" />
          <Line type="linear" dataKey="total_tokens" stroke="#82ca9d" name="Токены" />
        </LineChart>
      </ResponsiveContainer>
      <Title level={4}>Использование по моделям</Title>
      <ResponsiveContainer width="100%" height={300}>
        <PieChart>
          <Pie data={modelStats} dataKey="total_requests" nameKey="model" cx="50%" cy="50%" outerRadius={100} fill="#8884d8" label>
            {modelStats?.map((entry, index) => <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />)}
          </Pie>
          <Tooltip />
          <Legend />
        </PieChart>
      </ResponsiveContainer>
    </Spin>
  );
};

// User Statistics Tab
const StatsUserTab: React.FC<{ activeTab?: string }> = ({ activeTab }) => {
  const [selectedUser, setSelectedUserState] = useState<string | null>(() => {
    return localStorage.getItem('statsSelectedUser') || null;
  });
  const [period, setPeriod] = useState<'day' | 'week' | 'month'>('day');
  const [pagination, setPagination] = useState({ current: 1, pageSize: 10 });
  const [showZeroRequests, setShowZeroRequestsState] = useState<boolean>(() => {
    const stored = localStorage.getItem('statsShowZeroRequests');
    return stored !== null ? JSON.parse(stored) : true;
  });

  const setShowZeroRequests = (show: boolean) => {
    setShowZeroRequestsState(show);
    localStorage.setItem('statsShowZeroRequests', JSON.stringify(show));
  };

  const setSelectedUser = (userId: string | null) => {
    setSelectedUserState(userId);
    if (userId) {
      localStorage.setItem('statsSelectedUser', userId);
    } else {
      localStorage.removeItem('statsSelectedUser');
    }
  };

  const handleClearUser = () => {
    setSelectedUser(null);
    setPeriod('day');
    setPagination({ current: 1, pageSize: 10 });
  };

  const { data: users, isLoading: isLoadingUsers } = useQuery({
    queryKey: ['allUsersForStats'],
    queryFn: getAllUsersForStats,
  });
  
  // Query for all users statistics
  const { data: allUsersStats, isLoading: isLoadingAllUsersStats } = useQuery({
    queryKey: ['allUsersStats', period],
    queryFn: async () => {
      if (!users) return [];
      const stats = await Promise.all(
        users.map(async (user) => {
          const modelStats = await getUserModelUsageStats(user.id, period);
          const totalRequests = modelStats?.reduce((sum, m) => sum + (m.total_requests || 0), 0) || 0;
          const totalTokens = modelStats?.reduce((sum, m) => sum + (m.total_tokens || 0), 0) || 0;
          const models = modelStats?.map(m => m.model).join(', ') || '';
          return {
            key: user.id,
            userId: user.id,
            email: user.email,
            displayName: user.display_name || 'N/A',
            models: models,
            requests: totalRequests,
            tokens: totalTokens,
          };
        })
      );
      return stats;
    },
    enabled: !!users && users.length > 0,
  });

  const { data: stats, isLoading: isLoadingStats } = useQuery({
    queryKey: ['userStats', selectedUser, period],
    queryFn: () => selectedUser ? getUserStats(selectedUser, period) : [],
    enabled: !!selectedUser,
  });
  const { data: modelStats, isLoading: isLoadingModelStats } = useQuery({
    queryKey: ['userModelStats', selectedUser, period],
    queryFn: () => selectedUser ? getUserModelUsageStats(selectedUser, period) : [],
    enabled: !!selectedUser,
  });
  const { data: historyData, isLoading: isLoadingHistory } = useQuery({
    queryKey: ['userMessageHistory', selectedUser, period, pagination.current, pagination.pageSize],
    queryFn: () => selectedUser ? getUserMessageHistory(selectedUser, period, pagination.pageSize, pagination.current) : { data: [], total: 0 },
    enabled: !!selectedUser,
  });

  const tableData = modelStats?.map((m: any) => ({
    key: m.model,
    model: m.model,
    requests: m.total_requests,
    tokens: m.total_tokens,
  })) || [];

  const totalRequests = tableData.reduce((acc, cur) => acc + Number(cur.requests), 0);
  const totalTokens = tableData.reduce((acc, cur) => acc + Number(cur.tokens), 0);
  
  const columns = [
    { title: 'Модель', dataIndex: 'model', key: 'model' },
    { title: 'Запросы', dataIndex: 'requests', key: 'requests' },
    { title: 'Токены', dataIndex: 'tokens', key: 'tokens' },
  ];
  
  const historyColumns = [
    { title: 'Дата', dataIndex: 'created_at', key: 'created_at' },
    { title: 'Запрос', dataIndex: 'content', key: 'content' },
    { title: 'Модель', dataIndex: 'model', key: 'model' },
    { title: 'Токены', dataIndex: 'total_tokens', key: 'total_tokens' },
  ];

  const allUsersColumns = [
    { 
      title: 'Пользователь', 
      dataIndex: 'email', 
      key: 'email',
      render: (email: string, record: any) => (
        <a onClick={() => setSelectedUser(record.userId)} style={{ cursor: 'pointer', color: '#1890ff' }}>
          {record.displayName} ({email})
        </a>
      )
    },
    { title: 'Используемые модели', dataIndex: 'models', key: 'models' },
    { title: 'Запросы', dataIndex: 'requests', key: 'requests' },
    { title: 'Токены', dataIndex: 'tokens', key: 'tokens' },
  ];

  const handleTableChange = (newPagination: any) => {
    setPagination({
      current: newPagination.current,
      pageSize: newPagination.pageSize,
    });
  };

  // Filter all users stats based on checkbox
  const filteredAllUsersStats = allUsersStats?.filter(user => {
    if (showZeroRequests) return true;
    return user.requests > 0;
  }) || [];

  return (
    <div>
      <div style={{
        position: 'sticky',
        top: 0,
        background: '#ffffff',
        zIndex: 9,
        paddingBottom: 12,
        display: 'flex',
        gap: 10,
        alignItems: 'center',
      }}>
        <Select
          showSearch
          placeholder="Выберите пользователя"
          onChange={setSelectedUser}
          loading={isLoadingUsers}
          style={{ width: 300, marginBottom: 0 }}
          filterOption={(input, option) => (option?.label ?? '').toLowerCase().includes(input.toLowerCase())}
          options={users?.map(u => ({ value: u.id, label: `${u.display_name || 'N/A'} - ${u.email}` }))}
          onClear={handleClearUser}
          allowClear
          value={selectedUser}
        />
        <Select defaultValue="day" onChange={setPeriod} style={{ width: 150, marginBottom: 0 }}>
          <Select.Option value="day">За день</Select.Option>
          <Select.Option value="week">За неделю</Select.Option>
          <Select.Option value="month">За месяц</Select.Option>
        </Select>
        {!selectedUser && (
          <Form.Item style={{ marginBottom: 0 }}>
            <input 
              type="checkbox" 
              checked={showZeroRequests} 
              onChange={(e) => setShowZeroRequests(e.target.checked)}
              style={{ marginRight: 8, cursor: 'pointer' }}
            />
            <label style={{ cursor: 'pointer', marginBottom: 0 }}>0 запросов</label>
          </Form.Item>
        )}
      </div>
      
      {!selectedUser ? (
        <Spin spinning={isLoadingAllUsersStats}>
          <div style={{ marginTop: 20 }}>
            <Table
              dataSource={filteredAllUsersStats}
              columns={allUsersColumns}
              pagination={false}
              bordered
              size="small"
            />
          </div>
        </Spin>
      ) : (
        <Spin spinning={isLoadingStats || isLoadingModelStats || isLoadingHistory}>
          <Table 
            dataSource={tableData}
            columns={columns}
            pagination={false}
            bordered
            size="small"
            style={{ marginBottom: 20 }}
            summary={() => (
              <Table.Summary.Row>
                <Table.Summary.Cell index={0}><strong>Всего</strong></Table.Summary.Cell>
                <Table.Summary.Cell index={1}><strong>{totalRequests}</strong></Table.Summary.Cell>
                <Table.Summary.Cell index={2}><strong>{totalTokens}</strong></Table.Summary.Cell>
              </Table.Summary.Row>
            )}
          />
          <Title level={4}>Динамика использования</Title>
          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={stats}>
              <XAxis dataKey="date_trunc" />
              <YAxis />
              <Tooltip />
              <Legend />
              <Line type="linear" dataKey="total_requests" stroke="#8884d8" name="Запросы" />
              <Line type="linear" dataKey="total_tokens" stroke="#82ca9d" name="Токены" />
            </LineChart>
          </ResponsiveContainer>
          <Title level={4} style={{ marginTop: 20 }}>История запросов</Title>
          <Table 
            dataSource={historyData?.data || []}
            columns={historyColumns}
            rowKey="created_at"
            pagination={{
              ...pagination,
              total: historyData?.total || 0,
              pageSizeOptions: ['5', '10', '20', '50', '100'],
              showSizeChanger: true,
            }}
            onChange={handleTableChange}
          />
        </Spin>
      )}
    </div>
  );
};

const AdminPage: React.FC = () => {
  const [activeTab, setActiveTab] = useState(() => {
    return localStorage.getItem('adminActiveTab') || 'users';
  });
  const { theme } = useThemeContext();
  const isDark = theme === 'dark';

  const handleTabChange = (key: string) => {
    setActiveTab(key);
    localStorage.setItem('adminActiveTab', key);
  };

  const items = [
    { key: 'users', label: 'Пользователи' },
    { key: 'models', label: 'Модели' },
    { key: 'general-stats', label: 'Общая статистика' },
    { key: 'user-stats', label: 'Статистика по пользователям' },
  ];

  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100%' }}>
      <div style={{ 
        background: isDark ? '#363535' : '#ffffff', 
        padding: '24px 24px 0 24px',
        flexShrink: 0 
      }}>
        <Tabs activeKey={activeTab} onChange={handleTabChange} items={items} />
      </div>
      <div style={{ flex: 1, overflowY: 'auto', padding: '0 24px' }}>
        {activeTab === 'users' && <UsersTab />}
        {activeTab === 'models' && <ModelsTab />}
        {activeTab === 'general-stats' && <GeneralStatsTab />}
        {activeTab === 'user-stats' && <StatsUserTab activeTab={activeTab} />}
      </div>

      <style>{`
        .ant-table-row-light {
          background-color: #ffffff;
        }
        .ant-table-row-gray {
          background-color: #f5f5f5;
        }
        .ant-table {
          margin: 0 !important;
        }
        .ant-table .ant-table-cell {
          border-right: none;
          border-bottom: 1px solid #e5e5e5;
          padding: 4px 8px !important;
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
        .ant-table-filter-trigger {
          margin-left: 4px;
          margin-right: -4px;
        }
      `}</style>
    </div>
  );
};

export default AdminPage;
