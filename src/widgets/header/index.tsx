import React, { useEffect } from 'react';
import { Layout, Avatar, Dropdown, Space, Typography, Spin, Button } from 'antd';
import { UserOutlined, LogoutOutlined, SettingOutlined, SunOutlined, MoonOutlined, DashboardOutlined } from '@ant-design/icons';
import { useAuthStore } from '@/features/auth';
import { useThemeContext } from '@/app/providers/theme-provider';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { supabase } from '@/shared/lib/supabase';
import { useNavigate, useLocation } from 'react-router-dom';
import { useChatStore } from '@/entities/chat/model/chat-store';
import { ModelSelector } from '@/features/model-selector';
import { getCurrentUserSimpleStats } from '@/entities/users/api/users-api';


const { Header: AntHeader } = Layout;
const { Text } = Typography;

const CurrentUserStats = () => {
    const { user } = useAuthStore();
    const { data, isLoading } = useQuery({
        queryKey: ['currentUserSimpleStats', user?.id],
        queryFn: () => user ? getCurrentUserSimpleStats(user.id) : null,
        enabled: !!user,
    });

    if (isLoading || !data) return <Spin size="small" />;

    return (
        <Space size="large">
            <Text style={{ fontSize: 12, color: '#888' }}>Всего запросов: {data.total}</Text>
            <Text style={{ fontSize: 12, color: '#888' }}>Запросов за неделю: {data.weekly}</Text>
        </Space>
    )
}

const UsageStats = () => {
    const { user } = useAuthStore();

    const { data, isLoading, isError } = useQuery({
        queryKey: ['usageStats', user?.id],
        queryFn: async () => {
            if (!user) return null;
            
            // Get user's daily limit from profile
            const { data: profileData, error: profileError } = await supabase
                .from('user_profiles')
                .select('daily_request_limit')
                .eq('id', user.id)
                .single();
            
            if (profileError) throw new Error(profileError.message);
            
            // Count successful requests for today (from 00:00 to now)
            const today = new Date();
            today.setHours(0, 0, 0, 0);
            const todayStart = today.toISOString();
            
            const { count, error: countError } = await supabase
                .from('usage_logs')
                .select('*', { count: 'exact', head: true })
                .eq('user_id', user.id)
                .eq('status', 'success')
                .gte('created_at', todayStart);
            
            if (countError) throw new Error(countError.message);
            
            const usage = count || 0;
            const limit = profileData?.daily_request_limit || 0;
            
            return {
                usage,
                limit
            };
        },
        enabled: !!user,
        refetchInterval: 30000,
    });

    if (isLoading) {
        return <Text style={{ color: '#888' }}>Загрузка лимитов...</Text>;
    }

    if (isError || !data) {
        return <Text style={{ color: 'red' }}>Ошибка лимитов</Text>;
    }

    const remaining = data.limit - data.usage;

    return (
        <Text style={{ color: '#888' }}>
            Осталось запросов: {remaining < 0 ? 0 : remaining} / {data.limit}
        </Text>
    );
};

const ThemeToggleMenu = () => {
  const { theme, setTheme } = useThemeContext();
  const isDark = theme === 'dark';

  return (
    <div style={{ padding: '8px 12px', display: 'flex', gap: '8px' }}>
      <Button
        type={!isDark ? 'primary' : 'default'}
        size="small"
        icon={<SunOutlined />}
        onClick={() => setTheme('light')}
        style={{ borderRadius: '4px' }}
      />
      <Button
        type={isDark ? 'primary' : 'default'}
        size="small"
        icon={<MoonOutlined />}
        onClick={() => setTheme('dark')}
        style={{ borderRadius: '4px' }}
      />
    </div>
  );
};

export const Header = () => {
  const { user, signOut, profile } = useAuthStore();
  const { theme } = useThemeContext();
  const isDark = theme === 'dark';
  const navigate = useNavigate();
  const location = useLocation();
  
  // Hooks must be called unconditionally, not inside conditional rendering
  const { selectedModel, setSelectedModel, availableModels } = useChatStore();
  const isChatPage = location.pathname.startsWith('/chat');

  const menuItems = [
    ...(profile?.role === 'admin'
      ? [
          {
            key: 'admin',
            icon: <SettingOutlined />,
            label: 'Администрирование',
            onClick: () => navigate('/admin'),
          },
        ]
      : []),
    {
      key: 'theme',
      label: <ThemeToggleMenu />,
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
      justifyContent: 'space-between',
      alignItems: 'center',
      background: isDark ? '#363535' : '#ffffff',
      borderBottom: 'none',
      height: 64
    }}>
      <Space size="large">
        {isChatPage && (
          <div style={{ minWidth: 220 }}>
            <ModelSelector 
              value={selectedModel?.id} 
              onChange={setSelectedModel} 
              availableModels={availableModels} 
            />
          </div>
        )}
        <CurrentUserStats />
      </Space>
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
