import React, { useEffect } from 'react';
import { Layout, Menu, Spin, Button, Switch, Select, Divider } from 'antd';
import { MessageOutlined, PlusOutlined, RobotOutlined } from '@ant-design/icons';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { useChatStore } from '@/entities/chat/model/chat-store';
import { useAuthStore } from '@/features/auth';
import { useRagStore } from '@/entities/rag';
import { useThemeContext } from '@/app/providers/theme-provider';
import type { MenuProps } from 'antd';
import styles from './sidebar.module.css';

const { Sider } = Layout;

export const Sidebar = () => {
  const [collapsed, setCollapsed] = React.useState(false);
  const { user } = useAuthStore();
  const { conversations, fetchConversations, loading, setActiveConversation } = useChatStore();
  const { 
    isRagMode, 
    setIsRagMode,
    selectedRagObject,
    selectedLogicalSection,
    availableRagObjects,
    availableLogicalSections,
    isLoadingObjects,
    isLoadingSections,
    setSelectedRagObject,
    setSelectedLogicalSection
  } = useRagStore();
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
    console.log('[Sidebar] New chat button clicked');
    const currentPath = window.location.pathname;
    
    if (currentPath === '/chat') {
      // Already on /chat - need to force clear messages
      // Clear messages first with a small delay to ensure re-render
      setTimeout(() => {
        setActiveConversation(null);
        console.log('[Sidebar] Active conversation set to null');
      }, 0);
    } else {
      // On a specific conversation - just navigate to /chat
      setActiveConversation(null);
      console.log('[Sidebar] Active conversation set to null');
      navigate('/chat');
    }
    console.log('[Sidebar] Navigated to /chat');
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

          {/* RAG Mode Toggle */}
          {!collapsed && (
            <>
              <div style={{ 
                display: 'flex', 
                alignItems: 'center', 
                justifyContent: 'space-between',
                marginBottom: 12,
                padding: '8px 0'
              }}>
                <span style={{ 
                  fontSize: 14, 
                  color: isDark ? '#e8e8e8' : '#171717',
                  display: 'flex',
                  alignItems: 'center',
                  gap: 6
                }}>
                  <RobotOutlined />
                  Режим RAG
                </span>
                <Switch 
                  checked={isRagMode} 
                  onChange={setIsRagMode}
                  size="small"
                />
              </div>

              {/* RAG Object Selector */}
              {isRagMode && (
                <>
                  <Select
                    placeholder="Выберите объект"
                    value={selectedRagObject?.id}
                    onChange={(value) => {
                      const obj = availableRagObjects.find(o => o.id === value);
                      setSelectedRagObject(obj || null);
                    }}
                    loading={isLoadingObjects}
                    style={{ width: '100%', marginBottom: 12 }}
                    options={availableRagObjects.map(obj => ({
                      label: obj.name,
                      value: obj.id
                    }))}
                  />

                  {/* Logical Section Selector */}
                  {selectedRagObject && (
                    <Select
                      placeholder="Выберите раздел"
                      value={selectedLogicalSection?.id}
                      onChange={(value) => {
                        const section = availableLogicalSections.find(s => s.id === value);
                        setSelectedLogicalSection(section || null);
                      }}
                      loading={isLoadingSections}
                      disabled={!selectedRagObject}
                      style={{ width: '100%', marginBottom: 12 }}
                      options={availableLogicalSections.map(section => ({
                        label: section.name,
                        value: section.id
                      }))}
                    />
                  )}

                  <Divider style={{ margin: '12px 0' }} />
                </>
              )}
            </>
          )}
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
