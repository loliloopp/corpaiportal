import React, { useState } from 'react';
import { Typography, Table, Select, Spin } from 'antd';
import { useQuery } from '@tanstack/react-query';
import { LineChart, Line, PieChart, Pie, Cell, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { getGeneralStats, getModelUsageStats } from '@/entities/statistics/api/statistics-api';
import { useThemeContext } from '@/app/providers/theme-provider';

const { Title } = Typography;

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042'];

export const GeneralStatsTab: React.FC = () => {
  const [period, setPeriod] = useState<'day' | 'week' | 'month'>('day');
  const { data: stats, isLoading: isLoadingStats } = useQuery({
    queryKey: ['generalStats', period],
    queryFn: () => getGeneralStats(period),
  });
  const { data: modelStats, isLoading: isLoadingModelStats } = useQuery({
    queryKey: ['modelUsageStats', period],
    queryFn: () => getModelUsageStats(period),
  });
  const { theme } = useThemeContext();
  const isDark = theme === 'dark';

  const tableData = modelStats?.map(m => ({
    key: m.model,
    model: m.model,
    requests: m.total_requests,
    tokens: m.total_tokens,
    cost: m.total_cost,
  })) || [];

  const totalRequests = tableData.reduce((acc, cur) => acc + Number(cur.requests), 0);
  const totalTokens = tableData.reduce((acc, cur) => acc + Number(cur.tokens), 0);
  const totalCost = tableData.reduce((acc, cur) => acc + Number(cur.cost || 0), 0);

  const columns = [
    { title: 'Модель', dataIndex: 'model', key: 'model' },
    { title: 'Запросы', dataIndex: 'requests', key: 'requests' },
    { title: 'Токены', dataIndex: 'tokens', key: 'tokens' },
    { 
      title: 'Стоимость (USD)', 
      dataIndex: 'cost', 
      key: 'cost',
      render: (cost: number) => cost ? `$${cost.toFixed(4)}` : '—',
    },
  ];

  return (
    <Spin spinning={isLoadingStats || isLoadingModelStats}>
      <div style={{
        position: 'sticky',
        top: 0,
        background: isDark ? '#363535' : '#ffffff',
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
            <Table.Summary.Cell index={3}><strong>${totalCost.toFixed(4)}</strong></Table.Summary.Cell>
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
          <Line type="linear" dataKey="total_cost" stroke="#ffc658" name="Стоимость (USD)" />
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

