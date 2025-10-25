import React, { useEffect } from 'react';
import { Layout, Avatar, Dropdown, Space, Typography } from 'antd';
import { UserOutlined, LogoutOutlined, SettingOutlined, BulbOutlined, DashboardOutlined } from '@ant-design/icons';
import { useAuthStore } from '@/features/auth';
import { useThemeContext } from '@/app/providers/theme-provider';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { supabase } from '@/shared/lib/supabase';
import { useNavigate } from 'react-router-dom';
import { useChatStore } from '@/entities/chat/model/chat-store';

const { Header: AntHeader } = Layout;
const { Text } = Typography;

const UsageStats = () => {
    const { user } = useAuthStore();
    const queryClient = useQueryClient();

    useEffect(() => {
        const unsubscribe = useChatStore.subscribe(
            (state) => state.onSendMessageStart,
            () => {
                queryClient.setQueryData(['usageStats', user?.id], (oldData: any) => {
                    if (!oldData) return oldData;
                    return { ...oldData, usage: oldData.usage + 1 };
                });
            }
        );
        return unsubscribe;
    }, [queryClient, user?.id]);

    const { data, isLoading, isError } = useQuery({
        queryKey: ['usageStats', user?.id],
        queryFn: async () => {
            if (!user) return null;
            const { data, error } = await supabase.rpc('get_user_usage_stats', { p_user_id: user.id });
            if (error) throw new Error(error.message);
            return data;
        },
        enabled: !!user,
        refetchInterval: 30000,
    });

    useEffect(() => {
        useChatStore.setState({ 
            onSendMessageStart: () => {
                queryClient.setQueryData(['usageStats', user?.id], (oldData: any) => {
                    if (!oldData) return oldData;
                    return { ...oldData, usage: oldData.usage + 1 };
                });
            }
        });
    }, [queryClient, user?.id]);

    if (isLoading) {
        return <Text style={{ color: '#888' }}>Загрузка лимитов...</Text>;
    }

    if (isError) {
        return <Text style={{ color: 'red' }}>Ошибка лимитов</Text>;
    }

    const remaining = data.limit - data.usage;

    return (
        <Text style={{ color: '#888' }}>
            Осталось запросов: {remaining < 0 ? 0 : remaining} / {data.limit}
        </Text>
    );
};

export const Header = () => {
  const { user, signOut, profile } = useAuthStore();
  const { theme, setTheme } = useThemeContext();
  const isDark = theme === 'dark';
  const navigate = useNavigate();

  const handleThemeChange = () => {
    setTheme(isDark ? 'light' : 'dark');
  };

  const menuItems = [
    ...(profile?.role === 'admin'
      ? [
          {
            key: 'admin',
            icon: <SettingOutlined />,
            label: 'Управление',
            onClick: () => navigate('/admin'),
          },
          {
            key: 'dashboard',
            icon: <DashboardOutlined />,
            label: 'Статистика',
            onClick: () => navigate('/dashboard'),
          },
        ]
      : []),
    {
      key: 'theme',
      icon: <BulbOutlined />,
      label: `Тема: ${isDark ? 'Темная' : 'Светлая'}`,
      onClick: handleThemeChange,
    },
    {
      key: 'logout',
      icon: <LogoutOutlined />,
      label: 'Выйти',
      onClick: signOut,
    },
  ];

  return (
    <AntHeader style={{ 
      padding: '0 24px', 
      display: 'flex', 
      justifyContent: 'flex-end', 
      alignItems: 'center',
      background: isDark ? '#363535' : '#ffffff',
      borderBottom: 'none',
      height: 64
    }}>
      <Space size="large">
        <UsageStats />
        {user && (
          <Dropdown menu={{ items: menuItems }} trigger={['click']}>
            <a onClick={(e) => e.preventDefault()}>
              <Space>
                <Avatar 
                  icon={<UserOutlined />} 
                  style={{ 
                  background: isDark ? '#4a4a4a' : '#f5f5f5', 
                  color: isDark ? '#e8e8e8' : '#171717' 
                }} 
              />
              <span style={{ color: isDark ? '#e8e8e8' : '#171717', fontSize: 14 }}>{user.email}</span>
            </Space>
          </a>
        </Dropdown>
      )}
    </Space>
    </AntHeader>
  );
};
