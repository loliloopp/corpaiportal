import { create } from 'zustand';
import { nanoid } from 'nanoid';
import { queryClient } from '@/app/providers'; // Import queryClient
import { Message } from './types';
import { getConversations, getMessages, createConversation, saveMessage } from '../api/chat-api';
import { useAuthStore } from '@/features/auth';
import { sendAIRequest } from '@/shared/api/proxy-api';
import { logUsage } from '@/entities/limits';
import { Model, MODELS } from '@/shared/config/models.config';
import { getModelsWithAccess, ModelWithAccess, getConfiguredModels, getDatabaseModels, getUserAccessibleModels } from '@/entities/models/api/models-api';
import { openRouterApi, OpenRouterModel } from '@/entities/models/api/openrouter-api';

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
  availableModels: Model[]; // Store available models
  openRouterModels: Model[]; // Store OpenRouter models separately
  loading: boolean;
  onSendMessageStart: (() => void) | null; // Callback
  onError: ((error: { title: string; content: string }) => void) | null; // Error callback
  fetchConversations: (userId: string) => Promise<void>;
  fetchMessages: (conversationId: string) => Promise<void>;
  fetchAvailableModels: (userId: string) => Promise<void>; // New function
  fetchOpenRouterModels: () => Promise<void>; // Load OpenRouter models
  setActiveConversation: (conversationId: string | null) => void;
  setSelectedModel: (model: string) => void;
  setErrorHandler: (handler: ((error: { title: string; content: string }) => void) | null) => void;
  sendMessage: (content: string) => void;
}

export const useChatStore = create<ChatState>((set, get) => {
  const initialActiveConversation = localStorage.getItem('activeConversation');
  const initialSelectedModel = localStorage.getItem('selectedModel');

  return {
    conversations: [],
    messages: [],
    activeConversation: initialActiveConversation ? JSON.parse(initialActiveConversation) : null,
    selectedModel: initialSelectedModel || 'grok-4-fast',
    availableModels: [], // Initial state
    openRouterModels: [], // Initial state for OpenRouter models
    loading: false,
    onSendMessageStart: null, // Initial value
    onError: null, // Initial value
    setErrorHandler: (handler) => set({ onError: handler }),
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
    fetchAvailableModels: async (userId: string) => {
      try {
        // Get models that the user has access to
        const userModels = await getUserAccessibleModels(userId);
          
        set({ availableModels: userModels.map(m => ({
          id: m.id,
          name: m.name,
          provider: m.provider as any,
        })) });

        // If the currently selected model is not in the available list, switch to the first available one
        const currentModelStillAvailable = userModels.some(m => m.id === get().selectedModel);
        if (!currentModelStillAvailable && userModels.length > 0) {
            set({ selectedModel: userModels[0].id });
        }

      } catch (error) {
        console.error('Error fetching available models:', error);
        set({ availableModels: [] }); // Set to empty on error
      }
    },
    fetchOpenRouterModels: async () => {
      try {
        const models = await openRouterApi.getModels();
        
        // Transform OpenRouter models to our Model format
        const transformedModels: Model[] = models.map((m: OpenRouterModel) => ({
          id: m.id,
          name: m.name,
          provider: 'openrouter' as const,
          description: m.description,
          context_length: m.context_length,
          pricing: m.pricing ? {
            prompt: parseFloat(m.pricing.prompt),
            completion: parseFloat(m.pricing.completion),
          } : undefined,
        }));

        set({ openRouterModels: transformedModels });

      } catch (error) {
        console.error('Error fetching OpenRouter models:', error);
        set({ openRouterModels: [] });
      }
    },
    setActiveConversation: (conversationId: string | null) => {
      set({ activeConversation: conversationId, messages: [] });
      localStorage.setItem('activeConversation', JSON.stringify(conversationId));
      if (conversationId) {
        get().fetchMessages(conversationId);
      }
    },
    setSelectedModel: (model: string) => {
      set({ selectedModel: model });
      localStorage.setItem('selectedModel', model);
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
        if (!activeConversation && aiResponseData.id) {
            get().setActiveConversation(aiResponseData.id);
            get().fetchConversations(user.id);
        }

        // We need to refetch messages to get the real IDs and content from DB
        // This replaces the optimistic messages
        await get().fetchMessages(get().activeConversation!);

      } catch (error: any) {
        console.error('Error in sendMessage:', error);
        
        // On error, remove the optimistic message
        set((state) => ({ messages: state.messages.filter(m => m.id !== optimisticUserMessage.id) }));

        // Custom message for rate limit errors
        const isRateLimit = error.status === 429 || error.code === 'DAILY_LIMIT_EXCEEDED';
        const title = isRateLimit ? 'Лимит запросов превышен' : 'Ошибка запроса';
        const content = error.message || 'Не удалось выполнить запрос. Попробуйте позже.';

        // Use callback if available, otherwise fallback to console
        const errorHandler = get().onError;
        if (errorHandler) {
          errorHandler({ title, content });
        } else {
          console.error(title, content);
        }
        
      } finally {
          set({ loading: false });
          // Invalidate usage stats query to refetch the correct usage from the server
          queryClient.invalidateQueries({ queryKey: ['usageStats', user?.id] });
      }
    },
  };
});

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
