import React, { useState } from 'react';
import { Tabs } from 'antd';
import { useThemeContext } from '@/app/providers/theme-provider';
import { UsersTab } from './components/users-tab';
import { GeneralStatsTab } from './components/general-stats-tab';
import { StatsUserTab } from './components/stats-user-tab';
import { PromptsTab } from './components/prompts-tab';
import ModelRoutingTable from '@/widgets/model-routing-table';

const ModelsTab: React.FC = () => {
  return <div style={{ padding: '0 0 24px 0' }}><ModelRoutingTable /></div>;
};

const AdminPage: React.FC = () => {
  const [activeTab, setActiveTab] = useState(() => {
    return localStorage.getItem('adminActiveTab') || 'users';
  });
  const { theme } = useThemeContext();
  const isDark = theme === 'dark';

  const handleTabChange = (key: string) => {
    setActiveTab(key);
    localStorage.setItem('adminActiveTab', key);
  };

  const items = [
    { key: 'users', label: 'Пользователи' },
    { key: 'models', label: 'Модели' },
    { key: 'prompts', label: 'Промты' },
    { key: 'general-stats', label: 'Общая статистика' },
    { key: 'user-stats', label: 'Статистика по пользователям' },
  ];

  return (
    <div style={{ display: 'flex', flexDirection: 'column', height: '100%' }}>
      <div style={{ 
        background: isDark ? '#363535' : '#ffffff', 
        padding: '24px 24px 0 24px',
        flexShrink: 0 
      }}>
        <Tabs activeKey={activeTab} onChange={handleTabChange} items={items} />
      </div>
      <div style={{ flex: 1, overflowY: 'auto', padding: '0 24px' }}>
        {activeTab === 'users' && <UsersTab />}
        {activeTab === 'models' && <ModelsTab />}
        {activeTab === 'prompts' && <PromptsTab />}
        {activeTab === 'general-stats' && <GeneralStatsTab />}
        {activeTab === 'user-stats' && <StatsUserTab />}
      </div>

      <style>{`
        .ant-table-row-light {
          background-color: ${isDark ? '#2d2d2d' : '#ffffff'};
        }
        .ant-table-row-gray {
          background-color: ${isDark ? '#404040' : '#f5f5f5'};
        }
        .ant-table {
          margin: 0 !important;
        }
        .ant-table .ant-table-cell {
          border-right: none;
          border-bottom: 1px solid ${isDark ? '#434343' : '#e5e5e5'};
          padding: 4px 8px !important;
        }
        .ant-table-row-light .ant-table-cell-fix-left {
          background-color: ${isDark ? '#2d2d2d' : '#ffffff'};
        }
        .ant-table-row-gray .ant-table-cell-fix-left {
          background-color: ${isDark ? '#404040' : '#f5f5f5'};
        }
        table {
          table-layout: fixed !important;
        }
        .ant-table table {
          width: 100% !important;
        }
        .ant-table-tbody > tr > td {
          font-size: 0.9em;
        }
        .ant-table-filter-trigger {
          margin-left: 4px;
          margin-right: -4px;
        }
      `}</style>
    </div>
  );
};

export default AdminPage;
