import React, { useEffect } from 'react';
import { ChatWindow } from '@/widgets/chat-window';
import { useChatStore } from '@/entities/chat/model/chat-store';
import { useParams } from 'react-router-dom';
import { useAuthStore } from '@/features/auth';

const ChatPage = () => {
  const { 
    messages, 
    sendMessage, 
    loading, 
    activeConversation, 
    setActiveConversation,
    fetchAvailableModels,
  } = useChatStore();
  const { conversationId } = useParams<{ conversationId: string }>();
  const { user } = useAuthStore();

  useEffect(() => {
    if (conversationId && conversationId !== activeConversation) {
        setActiveConversation(conversationId);
    }
  }, [conversationId, activeConversation, setActiveConversation]);

  useEffect(() => {
    if (user?.id) {
      fetchAvailableModels(user.id);
    }
  }, [user, fetchAvailableModels]);

  return <ChatWindow messages={messages} onSendMessage={sendMessage} loading={loading} />;
};

export default ChatPage;
