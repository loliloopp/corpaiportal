import { create } from 'zustand';
import { Modal } from 'antd'; // Import Modal
import { nanoid } from 'nanoid';
import { Message } from './types';
import { getConversations, getMessages, createConversation, saveMessage } from '../api/chat-api';
import { useAuthStore } from '@/features/auth';
import { sendDeepSeekRequest, AIProviderResponse } from '@/shared/api/deepseek-api';
import { sendOpenAIRequest } from '@/shared/api/openai-api';
import { sendGeminiRequest } from '@/shared/api/gemini-api';
import { sendGrokRequest } from '@/shared/api/grok-api';
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
    get().onSendMessageStart?.(); // Trigger the callback for optimistic UI

    const { activeConversation, selectedModel, messages } = get();
    const { user } = useAuthStore.getState();

    if (!user) return;

    set({ loading: true });
    let conversationId = activeConversation;
    let savedUserMessage: Message | null = null;

    // Add user message to UI optimistically
    const optimisticUserMessage: Message = {
      id: nanoid(), // Temporary optimistic ID
      conversation_id: conversationId || 'optimistic-conv-id',
      user_id: user.id,
      role: 'user' as const,
      content: content,
      model: selectedModel,
      created_at: new Date().toISOString(),
    };
    set((state) => ({ messages: [...state.messages, optimisticUserMessage] }));

    try {
      // Step 1: Ensure we have a conversation ID. Create one if it's a new chat.
      if (!conversationId) {
        const newConversation = await createConversation(user.id, content.substring(0, 50));
        conversationId = newConversation.id;
        set({ activeConversation: conversationId });
        get().fetchConversations(user.id);
      }

      // Step 2: Save the user message to DB to get a real ID.
      const userMessageToSave: Omit<Message, 'id' | 'created_at'> & { id?: string } = {
          ...optimisticUserMessage,
          conversation_id: conversationId,
          id: undefined, // Let the DB generate the UUID
      };
      savedUserMessage = await saveMessage(userMessageToSave);
      
      // Replace optimistic message with the real one from DB
      set((state) => ({
          messages: state.messages.map(m => m.id === optimisticUserMessage.id ? savedUserMessage! : m)
      }));

      // Step 3: Prepare history and make AI call
      const conversationHistory = get().messages.map((msg) => ({
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
        case 'grok':
          aiResponse = await sendGrokRequest(selectedModel, conversationHistory as any);
          break;
        case 'deepseek':
        default:
          aiResponse = await sendDeepSeekRequest(selectedModel, conversationHistory as any);
          break;
      }

      // Step 4: Log success and save AI response
      await logUsage({
        user_id: user.id,
        message_id: savedUserMessage.id,
        model: selectedModel,
        prompt_tokens: aiResponse.usage.prompt_tokens,
        completion_tokens: aiResponse.usage.completion_tokens,
        total_tokens: aiResponse.usage.total_tokens,
        status: 'success',
      });

      const aiMessage = {
        conversation_id: conversationId,
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
      console.error('Error in sendMessage:', error);

      // Log the error. If user message was saved, we have its ID.
      await logUsage({
        user_id: user.id,
        message_id: savedUserMessage?.id, // Can be undefined if save failed, which is ok for logs.
        model: selectedModel,
        prompt_tokens: 0,
        completion_tokens: 0,
        total_tokens: 0,
        status: 'error',
        error_details: error.message,
      });

      // Show specific modal for rate limit errors
      if (error.message.includes('429') || error.message.includes('Дневной лимит')) {
        Modal.error({
          title: 'Лимит исчерпан или ошибка доступа',
          content: 'Вы достигли дневного лимита запросов, либо у вашего ключа недостаточно средств или прав для использования этой модели.',
        });
      }

      // If the user's message was never saved (initial error), remove the optimistic one.
      // Otherwise, leave the saved message in place. This fixes the duplicate key error.
      if (!savedUserMessage) {
        set((state) => ({ messages: state.messages.filter(m => m.id !== optimisticUserMessage.id) }));
      }
      
    } finally {
        set({ loading: false });
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
