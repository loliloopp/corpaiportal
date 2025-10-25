import { create } from 'zustand';
import { Modal } from 'antd'; // Import Modal
import { nanoid } from 'nanoid';
import { queryClient } from '@/app/providers'; // Import queryClient
import { Message } from './types';
import { getConversations, getMessages, createConversation, saveMessage } from '../api/chat-api';
import { useAuthStore } from '@/features/auth';
import { sendAIRequest } from '@/shared/api/proxy-api';
import { logUsage } from '@/entities/limits';
import { MODELS } from '@/shared/config/models.config';

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
  onSendMessageStart: (() => void) | null; // Callback
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
  selectedModel: 'grok-4-fast',
  loading: false,
  onSendMessageStart: null, // Initial value
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
    get().onSendMessageStart?.(); 

    const { activeConversation, selectedModel, messages } = get();
    const { user } = useAuthStore.getState();

    if (!user) return;

    set({ loading: true });

    const optimisticUserMessage: Message = {
      id: nanoid(),
      conversation_id: activeConversation || 'optimistic-conv-id',
      user_id: user.id,
      role: 'user' as const,
      content: content,
      model: selectedModel,
      created_at: new Date().toISOString(),
    };
    set((state) => ({ messages: [...state.messages, optimisticUserMessage] }));

    try {
      const conversationHistory = [...messages, optimisticUserMessage];
      
      const aiResponseData = await sendAIRequest(selectedModel, conversationHistory as any, activeConversation);

      // If a new conversation was created, update the store and UI
      if (!activeConversation && aiResponseData.conversationId) {
          set({ activeConversation: aiResponseData.conversationId });
          get().fetchConversations(user.id);
      }

      // We need to refetch messages to get the real IDs and content from DB
      // This replaces the optimistic messages
      await get().fetchMessages(get().activeConversation!);

    } catch (error: any) {
      console.error('Error in sendMessage:', error);
      
      // On error, remove the optimistic message
      set((state) => ({ messages: state.messages.filter(m => m.id !== optimisticUserMessage.id) }));

      Modal.error({
          title: 'Ошибка запроса',
          content: error.message || 'Не удалось выполнить запрос. Попробуйте позже.',
      });
      
    } finally {
        set({ loading: false });
        // Invalidate usage stats query to refetch the correct usage from the server
        queryClient.invalidateQueries({ queryKey: ['usageStats', user?.id] });
    }
  },
}));

// Add this function to check for the correct provider name, as it was missing in the Deepseek case
function getSelectedAIModel(selectedModel: string): string {
    const model = MODELS.find(m => m.id === selectedModel);
    if (!model) return selectedModel; // fallback
    
    // Gemini has a different naming convention in some places
    if (model.provider === 'gemini' && model.id.startsWith('gemini-')) {
        return model.id;
    }
    
    return model.id;
}
