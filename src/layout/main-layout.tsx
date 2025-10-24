import React from 'react';
import { Layout } from 'antd';
import { Outlet } from 'react-router-dom';
import { Header } from '@/widgets/header';
import { Sidebar } from '@/widgets/sidebar';
import { useThemeContext } from '@/app/providers/theme-provider';

const { Content } = Layout;

export const MainLayout = () => {
  const { theme } = useThemeContext();
  const isDark = theme === 'dark';

  return (
    <Layout style={{ minHeight: '100vh' }}>
      <Sidebar />
      <Layout style={{ display: 'flex', flexDirection: 'column', height: '100vh' }}>
        <Header />
        <Content style={{ 
          background: isDark ? '#363535' : '#ffffff', 
          flex: 1, 
          overflow: 'hidden', 
          height: 0 
        }}>
          <Outlet />
        </Content>
      </Layout>
    </Layout>
  );
};
