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
    fetchConversations,
    setErrorHandler,
    fetchAvailableModels,
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

  // Sync URL conversationId with store on mount and when conversationId changes
  useEffect(() => {
    if (conversationId) {
      // URL has conversationId - sync it with store
      if (conversationId !== activeConversation) {
        setActiveConversation(conversationId);
      }
    } else {
      // URL doesn't have conversationId - check if we should restore from localStorage
      const savedConversation = localStorage.getItem('activeConversation');
      if (savedConversation) {
        try {
          const parsed = JSON.parse(savedConversation);
          if (parsed) {
            // Restore saved conversation
            navigate(`/chat/${parsed}`, { replace: true });
            return;
          }
        } catch (e) {
          localStorage.removeItem('activeConversation');
        }
      }
      // No saved conversation - clear store if needed
      if (activeConversation) {
        setActiveConversation(null);
      }
    }
  }, [conversationId]); // Only depend on conversationId to avoid loops

  // Sync store to URL when activeConversation changes (e.g., from sidebar "New Chat" button)
  useEffect(() => {
    if (activeConversation === null && conversationId) {
      // Store cleared but URL still has conversationId - navigate to /chat
      navigate('/chat', { replace: true });
    } else if (activeConversation && activeConversation !== conversationId) {
      // Store has conversationId but URL doesn't match - sync URL
      navigate(`/chat/${activeConversation}`, { replace: true });
    }
  }, [activeConversation, conversationId, navigate]);

  // Load messages when conversationId is set (handles refresh when activeConversation is already correct)
  useEffect(() => {
    if (conversationId) {
      const { activeConversation: currentActive, fetchMessages } = useChatStore.getState();
      // Load messages if conversationId matches activeConversation or is newly set
      if (!currentActive || conversationId === currentActive) {
        fetchMessages(conversationId);
      }
    }
  }, [conversationId]);

  // Load user data on mount
  useEffect(() => {
    if (user?.id) {
      fetchConversations(user.id);
      fetchAvailableModels();
    }
  }, [user?.id, fetchConversations, fetchAvailableModels]);

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
