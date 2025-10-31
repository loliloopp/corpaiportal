import React, { useEffect } from 'react';
import { App, Modal } from 'antd';
import { ChatWindow } from '@/widgets/chat-window';
import { useChatStore } from '@/entities/chat/model/chat-store';
import { useParams } from 'react-router-dom';
import { useAuthStore } from '@/features/auth';
import { useNavigate } from 'react-router-dom';

const ChatPage = () => {
  const { modal } = App.useApp();
  const { 
    messages, 
    sendMessage: storeSendMessage, 
    loading, 
    activeConversation, 
    setActiveConversation,
    fetchAvailableModels,
    fetchOpenRouterModels,
    fetchConversations,
    setErrorHandler,
  } = useChatStore();
  const { conversationId } = useParams<{ conversationId: string }>();
  const { user } = useAuthStore();
  const navigate = useNavigate();

  // Set error handler using Ant Design App context
  useEffect(() => {
    setErrorHandler((error) => {
      modal.error({
        title: error.title,
        content: error.content,
        okText: 'Понятно',
      });
    });
    return () => setErrorHandler(null);
  }, [modal, setErrorHandler]);

  // Sync URL with store
  useEffect(() => {
    if (conversationId) {
      if (conversationId !== activeConversation) {
        setActiveConversation(conversationId);
      }
    } else {
      if (activeConversation) {
        setActiveConversation(null);
      }
    }
  }, [conversationId]);

  // Load user data on mount
  useEffect(() => {
    if (user?.id) {
      fetchAvailableModels(user.id);
      fetchConversations(user.id);
      fetchOpenRouterModels();
    }
  }, [user?.id]);

  // Wrapper around sendMessage that handles navigation for new conversations
  const handleSendMessage = async (message: string) => {
    const wasCreating = !activeConversation;
    
    await storeSendMessage(message);
    
    // If we were creating a new conversation, navigate to it
    if (wasCreating) {
      setTimeout(() => {
        const { activeConversation: newConversation } = useChatStore.getState();
        if (newConversation && newConversation !== conversationId) {
          navigate(`/chat/${newConversation}`, { replace: true });
        }
      }, 100);
    }
  };

  return <ChatWindow messages={messages} onSendMessage={handleSendMessage} loading={loading} />;
};

export default ChatPage;
