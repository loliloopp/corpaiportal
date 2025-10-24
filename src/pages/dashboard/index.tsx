import React, { useEffect, useState } from 'react';
import { Card, Col, Row, Statistic, Table, Typography } from 'antd';
import { useLimitsStore } from '@/entities/limits';
import { supabase } from '@/shared/lib/supabase';
import { useAuthStore } from '@/features/auth';
import { Link } from 'react-router-dom';

const { Title } = Typography;

const DashboardPage: React.FC = () => {
    const { profile, dailyUsage, monthlyUsage, fetchUsage } = useLimitsStore();
    const { user } = useAuthStore();
    const [logs, setLogs] = useState<any[]>([]);
    const [loadingLogs, setLoadingLogs] = useState(true);

    useEffect(() => {
        if (user) {
            fetchUsage(user.id);
            supabase
                .from('usage_logs')
                .select('*, conversations(title)')
                .eq('user_id', user.id)
                .order('created_at', { ascending: false })
                .limit(100)
                .then(({ data, error }) => {
                    if (error) console.error('Error fetching logs', error);
                    else setLogs(data || []);
                    setLoadingLogs(false);
                });
        }
    }, [user, fetchUsage]);

    const columns = [
        { title: 'Дата', dataIndex: 'created_at', key: 'created_at', render: (ts: string) => new Date(ts).toLocaleString(), width: 180 },
        { 
            title: 'Чат', 
            dataIndex: 'conversation_id', 
            key: 'conversation_id',
            render: (id: string, record: any) => (
                id ? <Link to={`/chat/${id}`}>{record.conversations?.title || id}</Link> : 'N/A'
            )
        },
        { title: 'Модель', dataIndex: 'model', key: 'model' },
        { title: 'Токены промпта', dataIndex: 'prompt_tokens', key: 'prompt_tokens', align: 'right' as const },
        { title: 'Токены ответа', dataIndex: 'completion_tokens', key: 'completion_tokens', align: 'right' as const },
        { title: 'Всего токенов', dataIndex: 'total_tokens', key: 'total_tokens', align: 'right' as const },
        { title: 'Статус', dataIndex: 'status', key: 'status' },
    ];
    
    if (!profile) {
        return <p>Загрузка...</p>;
    }

    return (
        <div style={{ padding: 24, height: '100%', display: 'flex', flexDirection: 'column' }}>
            <div style={{ flexShrink: 0 }}>
                <Title level={2} style={{ marginBottom: 24 }}>Панель управления</Title>
                <Row gutter={16} style={{ marginBottom: 24 }}>
                    <Col span={6}>
                        <Card>
                            <Statistic title="Дневной лимит запросов" value={dailyUsage.requests} suffix={`/ ${profile.daily_request_limit}`} />
                        </Card>
                    </Col>
                    <Col span={6}>
                        <Card>
                            <Statistic title="Месячный лимит запросов" value={monthlyUsage.requests} suffix={`/ ${profile.monthly_request_limit}`} />
                        </Card>
                    </Col>
                    <Col span={6}>
                        <Card>
                            <Statistic title="Дневной лимит токенов" value={dailyUsage.tokens} suffix={`/ ${profile.daily_token_limit}`} />
                        </Card>
                    </Col>
                    <Col span={6}>
                        <Card>
                            <Statistic title="Месячный лимит токенов" value={monthlyUsage.tokens} suffix={`/ ${profile.monthly_token_limit}`} />
                        </Card>
                    </Col>
                </Row>
                <Title level={3} style={{ marginBottom: 16 }}>История запросов</Title>
            </div>
            
            <div style={{ flex: 1, minHeight: 0 }}>
                 <Table
                    dataSource={logs}
                    columns={columns}
                    rowKey="id"
                    loading={loadingLogs}
                    pagination={{ pageSize: 10, showSizeChanger: false }}
                    scroll={{ y: 'calc(100vh - 400px)' }} // Примерная высота, может потребовать подстройки
                />
            </div>
        </div>
    );
};

export default DashboardPage;
