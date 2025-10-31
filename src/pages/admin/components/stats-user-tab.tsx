import React, { useState } from 'react';
import { Typography, Table, Select, Spin, Form } from 'antd';
import { useQuery } from '@tanstack/react-query';
import { LineChart, Line, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { getAllUsersForStats, getUserStats, getUserModelUsageStats, getUserMessageHistory } from '@/entities/statistics/api/statistics-api';
import { useThemeContext } from '@/app/providers/theme-provider';

const { Title } = Typography;

interface UserStats {
  key: string;
  userId: string;
  email: string;
  displayName: string;
  models: string;
  requests: number;
  tokens: number;
}

export const StatsUserTab: React.FC = () => {
  const [selectedUser, setSelectedUserState] = useState<string | null>(() => {
    return localStorage.getItem('statsSelectedUser') || null;
  });
  const [period, setPeriod] = useState<'day' | 'week' | 'month'>('day');
  const [pagination, setPagination] = useState({ current: 1, pageSize: 10 });
  const [showZeroRequests, setShowZeroRequestsState] = useState<boolean>(() => {
    const stored = localStorage.getItem('statsShowZeroRequests');
    return stored !== null ? JSON.parse(stored) : true;
  });

  const { theme } = useThemeContext();
  const isDark = theme === 'dark';

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
  
  const { data: allUsersStats, isLoading: isLoadingAllUsersStats } = useQuery<UserStats[]>({
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
            email: user.email || '',
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

  const tableData = modelStats?.map((m) => ({
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
      render: (email: string, record: UserStats) => (
        <a onClick={() => setSelectedUser(record.userId)} style={{ cursor: 'pointer', color: '#1890ff' }}>
          {record.displayName} ({email})
        </a>
      )
    },
    { title: 'Используемые модели', dataIndex: 'models', key: 'models' },
    { title: 'Запросы', dataIndex: 'requests', key: 'requests' },
    { title: 'Токены', dataIndex: 'tokens', key: 'tokens' },
  ];

  const handleTableChange = (newPagination: { current?: number; pageSize?: number }) => {
    setPagination({
      current: newPagination.current || 1,
      pageSize: newPagination.pageSize || 10,
    });
  };

  const filteredAllUsersStats = allUsersStats?.filter(user => {
    if (showZeroRequests) return true;
    return user.requests > 0;
  }) || [];

  return (
    <div>
      <div style={{
        position: 'sticky',
        top: 0,
        background: isDark ? '#363535' : '#ffffff',
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

