import { create } from 'zustand';
import { Modal } from 'antd'; // Import Modal
import { nanoid } from 'nanoid';
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

      // The new unified API call
      const aiResponseData = await sendAIRequest(selectedModel, conversationHistory as any);

      // AI response is now whatever the proxy forwarded. We need to parse it.
      const aiMessageContent = aiResponseData.choices[0].message.content;


      // Step 4 is now handled by the proxy, no need to log usage here.

      const aiMessage = {
        conversation_id: conversationId,
        user_id: user.id,
        role: 'assistant' as const,
        content: aiMessageContent,
        model: selectedModel,
      };

      const savedAiMessage = await saveMessage(aiMessage);
      set((state) => ({
        messages: [...state.messages, savedAiMessage],
      }));

    } catch (error: any) {
      console.error('Error in sendMessage:', error);

      // Error message now comes directly from the proxy
      Modal.error({
          title: 'Ошибка запроса',
          content: error.message || 'Не удалось выполнить запрос. Попробуйте позже.',
      });

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
