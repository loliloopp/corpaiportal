import { create } from 'zustand';
import { Message } from './types';
import { getConversations, getMessages, createConversation, saveMessage } from '../api/chat-api';
import { useAuthStore } from '@/features/auth';
import { sendDeepSeekRequest } from '@/shared/api/deepseek-api';

type Conversation = {
    id: string;
    title: string;
    created_at: string;
}

interface ChatState {
  conversations: Conversation[];
  messages: Message[];
  activeConversation: string | null;
  selectedModel: string;
  loading: boolean;
  fetchConversations: (userId: string) => Promise<void>;
  fetchMessages: (conversationId: string) => Promise<void>;
  setActiveConversation: (conversationId: string | null) => void;
  setSelectedModel: (model: string) => void;
  sendMessage: (content: string) => void;
}

export const useChatStore = create<ChatState>((set, get) => ({
  conversations: [],
  messages: [],
  activeConversation: null,
  selectedModel: 'deepseek-chat',
  loading: false,
  fetchConversations: async (userId: string) => {
    set({ loading: true });
    try {
      const data = await getConversations(userId);
      set({ conversations: data || [], loading: false });
    } catch (error) {
      set({ loading: false });
    }
  },
  fetchMessages: async (conversationId: string) => {
    set({ loading: true });
    try {
      const data = await getMessages(conversationId);
      set({ messages: data || [], loading: false });
    } catch (error) {
      set({ loading: false });
    }
  },
  setActiveConversation: (conversationId: string | null) => {
      set({ activeConversation: conversationId, messages: [] });
      if (conversationId) {
          get().fetchMessages(conversationId);
      }
  },
  setSelectedModel: (model: string) => {
    set({ selectedModel: model });
  },
  sendMessage: async (content: string) => {
    const { activeConversation, selectedModel } = get();
    const { user } = useAuthStore.getState();

    if (!user) return;

    let conversationId = activeConversation;

    // Create a new conversation if it's a new chat
    if (!conversationId) {
      const newConversation = await createConversation(user.id, content.substring(0, 50));
      if (newConversation) {
        conversationId = newConversation.id;
        set({ activeConversation: conversationId });
        get().fetchConversations(user.id);
      } else {
        return;
      }
    }

    const userMessage = {
      conversation_id: conversationId,
      user_id: user.id,
      role: 'user' as const,
      content: content,
    };

    const savedUserMessage = await saveMessage(userMessage);
    set((state) => ({ messages: [...state.messages, savedUserMessage] }));
    set({ loading: true });

    try {
      // Prepare conversation history for DeepSeek
      const currentMessages = get().messages;
      const conversationHistory = currentMessages.map((msg) => ({
        role: msg.role === 'user' ? 'user' : 'assistant',
        content: msg.content,
      }));

      // Add the new user message
      conversationHistory.push({
        role: 'user',
        content: content,
      });

      // Call DeepSeek API
      const aiResponseContent = await sendDeepSeekRequest(selectedModel, conversationHistory);

      const aiMessage = {
        conversation_id: conversationId!,
        user_id: user.id,
        role: 'assistant' as const,
        content: aiResponseContent,
      };

      const savedAiMessage = await saveMessage(aiMessage);
      set((state) => ({
        messages: [...state.messages, savedAiMessage],
        loading: false,
      }));
    } catch (error) {
      console.error('Error getting AI response:', error);
      set({ loading: false });
    }
  },
}));
