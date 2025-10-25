import React, { useState } from 'react';
import { Tabs, Select, Typography, Row, Col, Statistic, Card, Spin, Table } from 'antd';
import { useQuery } from '@tanstack/react-query';
import { LineChart, Line, BarChart, Bar, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer, PieChart, Pie, Cell } from 'recharts';
import { getGeneralStats, getModelUsageStats, getUserStats, getAllUsersForStats, getUserMessageHistory, getUserModelUsageStats } from '@/entities/statistics/api/statistics-api';
import { useThemeContext } from '@/app/providers/theme-provider';

const { Title } = Typography;
const { TabPane } = Tabs;

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042'];

const GeneralStatsTab = () => {
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
            <Select defaultValue="day" onChange={setPeriod} style={{ marginBottom: 20 }}>
                <Select.Option value="day">За день</Select.Option>
                <Select.Option value="week">За неделю</Select.Option>
                <Select.Option value="month">За месяц</Select.Option>
            </Select>
            <Table 
                dataSource={tableData}
                columns={columns}
                pagination={false}
                bordered
                size="small" // Make table more compact
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

const UserStatsTab = () => {
    const [selectedUser, setSelectedUser] = useState<string | null>(null);
    const [period, setPeriod] = useState<'day' | 'week' | 'month'>('day');
    const [pagination, setPagination] = useState({ current: 1, pageSize: 10 });

    const { data: users, isLoading: isLoadingUsers } = useQuery({
        queryKey: ['allUsersForStats'],
        queryFn: getAllUsersForStats,
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

    const handleTableChange = (newPagination: any) => {
        setPagination({
            current: newPagination.current,
            pageSize: newPagination.pageSize,
        });
    };

    return (
        <div>
            <Select
                showSearch
                placeholder="Выберите пользователя"
                onChange={setSelectedUser}
                loading={isLoadingUsers}
                style={{ width: 300, marginBottom: 20 }}
                filterOption={(input, option) => (option?.label ?? '').toLowerCase().includes(input.toLowerCase())}
                options={users?.map(u => ({ value: u.id, label: `${u.display_name || 'N/A'} - ${u.email}` }))}
            />
            {selectedUser && (
                 <Spin spinning={isLoadingStats || isLoadingModelStats || isLoadingHistory}>
                    <Select defaultValue="day" onChange={setPeriod} style={{ marginBottom: 20, marginLeft: 10 }}>
                        <Select.Option value="day">За день</Select.Option>
                        <Select.Option value="week">За неделю</Select.Option>
                        <Select.Option value="month">За месяц</Select.Option>
                    </Select>
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
}

const DashboardPage: React.FC = () => {
    const [activeTab, setActiveTab] = useState('1');
    const { theme } = useThemeContext();
    const isDark = theme === 'dark';

    const items = [
        { key: '1', label: 'Общая статистика' },
        { key: '2', label: 'Пользователи' },
    ];

    return (
        <div style={{ display: 'flex', flexDirection: 'column', height: '100%' }}>
            <div style={{ 
                background: isDark ? '#363535' : '#ffffff', 
                padding: '24px 24px 0 24px',
                flexShrink: 0 
            }}>
                <Title level={2} style={{ margin: 0 }}>Статистика</Title>
                <Tabs activeKey={activeTab} onChange={setActiveTab} items={items} />
            </div>
            <div style={{ flex: 1, overflowY: 'auto', padding: '0 24px' }}>
                <div style={{ paddingTop: 24 }}>
                    {activeTab === '1' && <GeneralStatsTab />}
                    {activeTab === '2' && <UserStatsTab />}
                </div>
            </div>
        </div>
    );
};

export default DashboardPage;
