import { create } from 'zustand';
import { Modal } from 'antd'; // Import Modal
import { nanoid } from 'nanoid';
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
  selectedModel: 'deepseek-chat',
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
    get().onSendMessageStart?.(); // Trigger the callback

    const { activeConversation, selectedModel, messages } = get();
    const { user } = useAuthStore.getState();

    if (!user) return;

    let conversationId = activeConversation;
    
    // Optimistically add user message to the UI
    const userMessage: Message = {
      id: nanoid(),
      conversation_id: conversationId || 'temp',
      user_id: user.id,
      role: 'user' as const,
      content: content,
      model: selectedModel,
      created_at: new Date().toISOString(),
    };
    set((state) => ({ messages: [...state.messages, userMessage] }));
    set({ loading: true });

    try {
      const conversationHistory = [...messages, userMessage].map((msg) => ({
        role: msg.role,
        content: msg.content,
      }));

      const model = MODELS.find(m => m.id === selectedModel);
      if (!model) throw new Error('Selected model not found');

      // 1. Get AI response (this includes the limit check)
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

      // 2. If AI response is successful, create conversation and save messages
      if (!conversationId) {
        const newConversation = await createConversation(user.id, content.substring(0, 50));
        conversationId = newConversation.id;
        set({ activeConversation: conversationId });
        userMessage.conversation_id = conversationId; 
        get().fetchConversations(user.id);
      }
      
      const savedUserMessage = await saveMessage({ ...userMessage, id: undefined });
      // Replace optimistic message with the real one from DB
      set((state) => ({ messages: state.messages.map(m => m.id === userMessage.id ? savedUserMessage : m) }));

      await logUsage({
        user_id: user.id,
        message_id: savedUserMessage.id, // Use message_id instead
        model: selectedModel,
        prompt_tokens: aiResponse.usage.prompt_tokens,
        completion_tokens: aiResponse.usage.completion_tokens,
        total_tokens: aiResponse.usage.total_tokens,
        status: 'success',
      });

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
      }));

    } catch (error: any) {
      console.error('Error getting AI response:', error);
      
      // Remove optimistic message on error
      set((state) => ({ messages: state.messages.filter(m => m.id !== userMessage.id) }));

      if (error.message === 'Дневной лимит запросов исчерпан.') {
        Modal.error({
          title: 'Лимит исчерпан',
          content: 'Вы достигли дневного лимита сообщений.',
        });
      }

      // Try to get savedUserMessage if it exists before error
      const savedUserMessage = get().messages.find(m => m.id === userMessage.id);

      await logUsage({
        user_id: user.id,
        message_id: savedUserMessage?.id || 'optimistic-failure',
        model: selectedModel,
        prompt_tokens: 0,
        completion_tokens: 0,
        total_tokens: 0,
        status: 'error',
        error_details: error.message, // Log the error message
      });
    } finally {
        set({ loading: false });
    }
  },
}));
