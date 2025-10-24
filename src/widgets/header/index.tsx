import React from 'react';
import { Layout, Avatar, Dropdown, Space } from 'antd';
import { UserOutlined, LogoutOutlined } from '@ant-design/icons';
import { useAuthStore } from '@/features/auth';
import { useThemeContext } from '@/app/providers/theme-provider';

const { Header: AntHeader } = Layout;

export const Header = () => {
  const { user, signOut } = useAuthStore();
  const { theme } = useThemeContext();
  const isDark = theme === 'dark';

  const menuItems = [
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
    </AntHeader>
  );
};
