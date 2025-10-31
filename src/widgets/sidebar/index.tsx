import React, { useEffect } from 'react';
import { Layout, Menu, Spin, Button } from 'antd';
import { MessageOutlined, PlusOutlined } from '@ant-design/icons';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { useChatStore } from '@/entities/chat/model/chat-store';
import { useAuthStore } from '@/features/auth';
import { useThemeContext } from '@/app/providers/theme-provider';
import type { MenuProps } from 'antd';
import styles from './sidebar.module.css';

const { Sider } = Layout;

export const Sidebar = () => {
  const [collapsed, setCollapsed] = React.useState(false);
  const { user } = useAuthStore();
  const { conversations, fetchConversations, loading, setActiveConversation } = useChatStore();
  const { theme } = useThemeContext();
  const location = useLocation();
  const navigate = useNavigate();
  const isDark = theme === 'dark';

  const [openKeys, setOpenKeys] = React.useState<string[]>(() => {
    const savedOpenKeys = localStorage.getItem('sidebarOpenKeys');
    return savedOpenKeys ? JSON.parse(savedOpenKeys) : ['history'];
  });

  useEffect(() => {
    if (user) {
      fetchConversations(user.id);
    }
  }, [user, fetchConversations]);

  const handleNewChat = () => {
    setActiveConversation(null);
    navigate('/chat', { replace: true });
  };

  const historyItems: MenuProps['items'] = loading
    ? [{ key: 'loading', label: 'Загрузка...', disabled: true, icon: <Spin size="small" /> }]
    : conversations.length === 0
    ? [{ key: 'empty', label: 'Нет диалогов', disabled: true }]
    : conversations.map((conv) => ({
        key: conv.id,
        label: conv.title,
        onClick: () => {
          setActiveConversation(conv.id);
          navigate(`/chat/${conv.id}`);
        },
      }));

  const mainMenuItems: MenuProps['items'] = [];

  return (
    <Sider 
      collapsible 
      collapsed={collapsed}
      onCollapse={(value) => setCollapsed(value)}
      className={styles.sidebar}
      style={{ 
        background: isDark ? '#363535' : '#ffffff',
        borderRight: 0,
        height: '100vh',
        overflow: 'hidden',
        padding: 0,
      }}
    >
      {/* Fixed header section */}
      <div className={styles.siderTop}>
        <div style={{ 
          padding: '20px 16px', 
          display: 'flex', 
          alignItems: 'center', 
          justifyContent: 'center',
          fontSize: 18,
          fontWeight: 500,
          color: isDark ? '#e8e8e8' : '#171717'
        }}>
          AI HUB
        </div>
        <div style={{ padding: '8px 12px' }}>
          <Button 
            type="default"
            icon={<PlusOutlined />} 
            onClick={handleNewChat}
            block
            style={{ 
              marginBottom: 16,
              height: 36,
              border: isDark ? '1px solid #555555' : '1px solid #e5e5e5',
              borderRadius: 6,
              background: isDark ? '#4a4a4a' : '#ffffff',
              color: isDark ? '#e8e8e8' : '#171717'
            }}
          >
            {!collapsed && 'Новый чат'}
          </Button>
        </div>
      </div>

      {/* Scrollable history section */}
      <div className={styles.siderHistory}>
        <Menu 
          theme="light" 
          mode="inline"
          openKeys={openKeys}
          onOpenChange={(keys) => {
            setOpenKeys(keys);
            localStorage.setItem('sidebarOpenKeys', JSON.stringify(keys));
          }}
          items={[{
            key: 'history',
            label: 'История',
            icon: <MessageOutlined />,
            children: historyItems,
          }]}
        />
      </div>
    </Sider>
  );
};
