import { create } from 'zustand';
import { Message } from './types';
import { getConversations, getMessages, createConversation, saveMessage } from '../api/chat-api';
import { useAuthStore } from '@/features/auth';
import { sendDeepSeekRequest, AIProviderResponse } from '@/shared/api/deepseek-api';
import { sendOpenAIRequest } from '@/shared/api/openai-api';
import { sendGeminiRequest } from '@/shared/api/gemini-api';
import { logUsage, useLimitsStore } from '@/entities/limits';
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
    const { activeConversation, selectedModel, messages } = get();
    const { user } = useAuthStore.getState();
    const { checkLimits, fetchUsage } = useLimitsStore.getState();

    if (!user) return;

    const { canMakeRequest, reason } = checkLimits();
    if (!canMakeRequest) {
      // TODO: Replace with a proper notification component
      alert(reason);
      return;
    }

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
      model: selectedModel,
    };

    const savedUserMessage = await saveMessage(userMessage);
    set((state) => ({ messages: [...state.messages, savedUserMessage] }));
    set({ loading: true });

    try {
      const conversationHistory = [...messages, savedUserMessage].map((msg) => ({
        role: msg.role,
        content: msg.content,
      }));

      const model = MODELS.find(m => m.id === selectedModel);
      if (!model) throw new Error('Selected model not found');

      let aiResponse: AIProviderResponse;

      switch(model.provider) {
        case 'openai':
          aiResponse = await sendOpenAIRequest(selectedModel, conversationHistory as any);
          break;
        case 'gemini':
          aiResponse = await sendGeminiRequest(selectedModel, conversationHistory as any);
          break;
        case 'deepseek':
        default:
          aiResponse = await sendDeepSeekRequest(selectedModel, conversationHistory as any);
          break;
      }

      await logUsage({
        user_id: user.id,
        conversation_id: conversationId,
        model: selectedModel,
        prompt_tokens: aiResponse.usage.prompt_tokens,
        completion_tokens: aiResponse.usage.completion_tokens,
        total_tokens: aiResponse.usage.total_tokens,
        status: 'success',
      });

      // Refresh usage stats
      await fetchUsage(user.id);

      const aiMessage = {
        conversation_id: conversationId!,
        user_id: user.id,
        role: 'assistant' as const,
        content: aiResponse.content,
        model: selectedModel,
      };

      const savedAiMessage = await saveMessage(aiMessage);
      set((state) => ({
        messages: [...state.messages, savedAiMessage],
        loading: false,
      }));
    } catch (error) {
      console.error('Error getting AI response:', error);
      await logUsage({
        user_id: user.id,
        conversation_id: conversationId,
        model: selectedModel,
        prompt_tokens: 0,
        completion_tokens: 0,
        total_tokens: 0,
        status: 'error',
      });
      await fetchUsage(user.id);
      set({ loading: false });
    }
  },
}));
