import React from 'react';
import { Card, Switch, Space, Typography } from 'antd';
import { useThemeContext } from '@/app/providers/theme-provider';

const { Title, Text } = Typography;

const SettingsPage = () => {
  const { theme, setTheme } = useThemeContext();

  return (
    <div style={{ padding: '32px 48px', maxWidth: 600 }}>
      <Title level={2} style={{ marginBottom: 32 }}>Настройки</Title>
      
      <Card style={{ marginBottom: 16 }}>
        <Space direction="vertical" size="large" style={{ width: '100%' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <div>
              <Text strong style={{ fontSize: 16 }}>Тема приложения</Text>
              <div style={{ marginTop: 4 }}>
                <Text type="secondary" style={{ fontSize: 14 }}>
                  {theme === 'light' ? 'Светлая тема' : 'Темная тема'}
                </Text>
              </div>
            </div>
            <Switch 
              checked={theme === 'dark'} 
              onChange={(checked) => setTheme(checked ? 'dark' : 'light')}
            />
          </div>
        </Space>
      </Card>
    </div>
  );
};

export default SettingsPage;
