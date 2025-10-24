import { Avatar, Space } from 'antd';
import { UserOutlined, RobotOutlined } from '@ant-design/icons';
import { Message } from '../model/types';
import Markdown from 'react-markdown';
import { useThemeContext } from '@/app/providers/theme-provider';
import './chat-message.css';

interface ChatMessageProps {
  message: Message;
}

export const ChatMessage: React.FC<ChatMessageProps> = ({ message }) => {
  const { role, content } = message;
  const isUser = role === 'user';
  const { theme } = useThemeContext();
  const isDark = theme === 'dark';

  const avatarStyle = {
    background: isDark ? '#4a4a4a' : '#f5f5f5',
    color: isDark ? '#e8e8e8' : '#171717',
    flexShrink: 0,
  };

  return (
    <div className={`message-wrapper ${isUser ? 'user' : 'assistant'}`}>
      {isUser ? (
        <div style={{ display: 'flex', justifyContent: 'flex-end', width: '100%', gap: 12 }}>
          <div className="message-bubble user-bubble">
            <div className="message-content">
              <Markdown>{content}</Markdown>
            </div>
          </div>
          <Avatar icon={<UserOutlined />} style={avatarStyle} />
        </div>
      ) : (
        <Space align="start">
          <Avatar icon={<RobotOutlined />} style={avatarStyle} />
          <div className="message-content">
            <Markdown>{content}</Markdown>
          </div>
        </Space>
      )}
    </div>
  );
};
