import React, { useEffect } from 'react';
import { ChatWindow } from '@/widgets/chat-window';
import { useChatStore } from '@/entities/chat/model/chat-store';
import { useParams } from 'react-router-dom';

const ChatPage = () => {
  const { messages, sendMessage, loading, fetchMessages, activeConversation, setActiveConversation } = useChatStore();
  const { conversationId } = useParams<{ conversationId: string }>();

  useEffect(() => {
    if (conversationId && conversationId !== activeConversation) {
        setActiveConversation(conversationId);
    }
  }, [conversationId, activeConversation, setActiveConversation]);

  return <ChatWindow messages={messages} onSendMessage={sendMessage} loading={loading} />;
};

export default ChatPage;
