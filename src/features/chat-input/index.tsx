import React, { useState } from 'react';
import { Input, Button, Form } from 'antd';
import { SendOutlined } from '@ant-design/icons';
import { useChatStore } from '@/entities/chat/model/chat-store';
import { useThemeContext } from '@/app/providers/theme-provider';

interface ChatInputFormProps {
  onSendMessage: (message: string) => void;
  loading: boolean;
}

export const ChatInputForm: React.FC<ChatInputFormProps> = ({ onSendMessage, loading }) => {
  const [form] = Form.useForm();
  const { theme } = useThemeContext();
  const isDark = theme === 'dark';

  const handleFinish = (values: { message: string }) => {
    if (values.message.trim()) {
      onSendMessage(values.message.trim());
      form.resetFields();
    }
  };

  return (
    <Form form={form} onFinish={handleFinish} style={{ display: 'flex', gap: 8, alignItems: 'flex-end' }}>
      <Form.Item name="message" style={{ flex: 1, marginRight: 0, marginBottom: 0 }}>
        <Input.TextArea
          autoSize={{ minRows: 1, maxRows: 5 }}
          placeholder="Введите ваше сообщение..."
          onPressEnter={(e) => {
            if (!e.shiftKey) {
              e.preventDefault();
              form.submit();
            }
          }}
        />
      </Form.Item>
      <Form.Item style={{ marginBottom: 0 }}>
        <Button 
          type="default" 
          htmlType="submit" 
          icon={<SendOutlined />} 
          loading={loading}
          style={{
            border: isDark ? '1px solid #555555' : '1px solid #e5e5e5',
            background: isDark ? '#4a4a4a' : '#ffffff',
            color: isDark ? '#e8e8e8' : '#171717'
          }}
        />
      </Form.Item>
    </Form>
  );
};
