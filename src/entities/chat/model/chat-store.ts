import { create } from 'zustand';
import { nanoid } from 'nanoid';
import { persist, createJSONStorage } from 'zustand/middleware';
import { supabase } from '@/shared/lib/supabase';
import { queryClient } from '@/app/providers';
import { Message } from './types';
import {
  createConversation,
  deleteConversation,
  getConversations,
  getMessages,
  sendAIRequestStreaming,
  updateConversationTitle,
} from '../api/chat-api';
import { useAuthStore } from '@/features/auth';
import { APIError } from '@/shared/lib/error-handler';
import { debounce } from '@/shared/utils/debounce';
import { usePromptsStore } from '@/entities/prompts';

// Note: CachedResponse is not used anymore but kept for potential future use.
export type CachedResponse = {
  response: any; // Kept generic as the source is removed
  timestamp: number;
  params: {
    model: string;
    messagesHash: string;
  };
};

interface Model {
  id: string;
  name: string;
}

interface ChatState {
  conversations: Conversation[];
  messages: Message[];
  activeConversation: string | null;
  selectedModel: Model | null;
  availableModels: Model[];
  openRouterModels: Model[];
  loading: boolean;
  onSendMessageStart: (() => void) | null;
  onError: ((error: { title: string; content: string }) => void) | null;
  lastResponse: ChatResponse | null; // Last AI response in memory
  messagesCache: Map<string, Message[]>; // Cache for messages by conversationId
  fetchConversations: (userId: string) => Promise<void>;
  fetchMessages: (conversationId: string) => Promise<void>;
  fetchAvailableModels: () => Promise<void>;
  fetchOpenRouterModels: () => Promise<void>;
  setActiveConversation: (conversationId: string | null) => void;
  setSelectedModel: (model: string) => void;
  setErrorHandler: (handler: ((error: { title: string; content: string }) => void) | null) => void;
  sendMessage: (content: string) => void;
  setError: (title: string, content: string) => void;
}

export const useChatStore = create<ChatState>()(
  persist(
    (set, get) => ({
      conversations: [],
      messages: [],
      activeConversation: null,
      selectedModel: null,
      availableModels: [],
      openRouterModels: [],
      loading: false,
      onSendMessageStart: null,
      onError: null,
      lastResponse: null,
      messagesCache: new Map<string, Message[]>(),
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
        // Check cache first - show cached messages immediately
        const cached = get().messagesCache.get(conversationId);
        if (cached && cached.length > 0) {
          set({ messages: cached });
        }

        set({ loading: true });
        try {
          const data = await getMessages(conversationId);
          const messages = data || [];
          // Update cache and messages
          const cache = new Map(get().messagesCache);
          cache.set(conversationId, messages);
          set({ messages, messagesCache: cache, loading: false });
        } catch (error) {
          console.error('Error fetching messages:', error);
          set({ loading: false });
          // Keep cached messages if available, don't clear them on error
          if (!cached || cached.length === 0) {
            set({ messages: [] });
          }
        }
      },
      setActiveConversation: (conversationId: string | null) => {
        // Only clear messages if conversation is actually changing
        const currentConversation = get().activeConversation;
        if (currentConversation !== conversationId) {
          set({ activeConversation: conversationId, messages: [] });
          try {
              localStorage.setItem('activeConversation', JSON.stringify(conversationId));
          } catch(e) {
              console.error("Failed to save active conversation to localStorage", e);
          }
          if (conversationId) {
            get().fetchMessages(conversationId);
          } else {
            // Clear cache when switching to new chat
            set({ messagesCache: new Map() });
          }
        }
      },
      setSelectedModel: (modelId: string) => {
        const { availableModels } = get();
        const modelToSet = availableModels.find(m => m.id === modelId);
        if (modelToSet) {
          set({ selectedModel: modelToSet, lastResponse: null });
          try {
            localStorage.setItem('selectedModel', JSON.stringify(modelToSet));
          } catch (e) {
            console.error("Failed to save selected model to localStorage", e);
          }
        }
      },
      fetchAvailableModels: async () => {
        try {
          const { data: { session }, error: sessionError } = await supabase.auth.getSession();
          
          if (sessionError || !session?.access_token) {
            console.error('Failed to get session for fetching models:', sessionError);
            return;
          }

          const response = await fetch('/api/v1/user-accessible-models', {
            headers: {
              'Authorization': `Bearer ${session.access_token}`,
              'Content-Type': 'application/json',
            },
          });

          if (!response.ok) {
            throw new Error(`Failed to fetch models: ${response.statusText}`);
          }

          const models = await response.json();
          console.log('Fetched user-accessible models:', models);
          
          if (models.length === 0) {
            console.warn('No accessible models found. This might indicate DB/permission issue.');
          }
          
          set({ availableModels: models });
          if (!get().selectedModel && models.length > 0) {
            set({ selectedModel: models[0] });
          }
        } catch (error) {
          console.error('Error fetching available models:', error);
        }
      },
      sendMessage: async (content: string) => {
        get().onSendMessageStart?.(); 

        const { activeConversation, selectedModel, messages, lastResponse } = get();
        const { user } = useAuthStore.getState();
        const { selectedPrompt } = usePromptsStore.getState();

        if (!user) return;

        const activeConversationId = get().activeConversation;
        const temperature = get().temperature;
        const top_p = get().top_p;

        set({ loading: true, error: null });

        const optimisticUserMessage: Message = {
          id: `user_${nanoid()}`,
          role: 'user',
          content: content,
          createdAt: new Date().toISOString(),
        };

        const messagesToSend = [...get().messages, optimisticUserMessage];
        const optimisticAssistantId = `asst_${nanoid()}`;

        try {
          if (!selectedModel) {
            throw new Error('Модель не выбрана. Выберите модель перед отправкой сообщения.');
          }

          const { data: { session } } = await supabase.auth.getSession();
          if (!session) throw new Error('User not authenticated');

          set(state => ({
            messages: [...state.messages, optimisticUserMessage],
          }));

          await sendAIRequestStreaming(
            messagesToSend,
            selectedModel.id,
            temperature,
            top_p,
            activeConversationId,
            session.access_token,
            (streamData) => {
              if (streamData.type === 'chunk') {
                set((state) => {
                  const existingMessage = state.messages.find(m => m.id === optimisticAssistantId);
                  if (existingMessage) {
                    return {
                      messages: state.messages.map(m =>
                        m.id === optimisticAssistantId
                          ? { ...m, content: existingMessage.content + (streamData.content || '') }
                          : m
                      ),
                    };
                  } else {
                    return {
                      messages: [
                        ...state.messages,
                        {
                          id: optimisticAssistantId,
                          role: 'assistant',
                          content: streamData.content || '',
                          createdAt: new Date().toISOString(),
                          model: selectedModel?.id || 'grok-4-fast', // Use optional chaining
                        },
                      ],
                    };
                  }
                });
              } else if (streamData.type === 'done') {
                set({ loading: false });
                queryClient.invalidateQueries({ queryKey: ['usageStats', user?.id] });
                // Potentially refetch messages to get final assistant message from DB
              } else if (streamData.type === 'error') {
                 const apiError = new APIError(streamData.error || 'Unknown stream error', 500, 'STREAM_ERROR', streamData.details);
                 get().setError(apiError.title, apiError.message);
                 set({ loading: false });
              }
            }
          );

        } catch (error) {
          // On error, remove both optimistic messages
          set((state) => ({ 
            messages: state.messages.filter(m => m.id !== optimisticUserMessage.id) 
          }));

          if (error instanceof APIError) {
            get().setError(error.title, error.message);
          } else if (error instanceof Error) {
            get().setError('Ошибка', error.message);
          } else {
            get().setError('Неизвестная ошибка', 'Произошла непредвиденная ошибка');
          }
          set({ loading: false });
        }
      },

      setError: (title: string, content: string) => {
        const errorHandler = get().onError;
        if (errorHandler) {
          errorHandler({ title, content });
        } else {
          console.error(title, content);
        }
      },
    }),
    {
      name: 'chat-storage',
      storage: createJSONStorage(() => localStorage),
      partialize: (state) => ({
        activeConversation: state.activeConversation,
        selectedModel: state.selectedModel,
        temperature: state.temperature,
        top_p: state.top_p,
      }),
      onRehydrate: (persistedState, error) => {
        if (error) {
          console.error('Rehydration failed:', error);
          return Promise.resolve(null);
        }
        if (persistedState) {
          const selectedModel = persistedState.selectedModel;
          if (selectedModel) {
            // Attempt to parse the JSON string back into an object
            try {
              const parsedModel = JSON.parse(selectedModel);
              // Check if the parsed object is an array and has at least one item
              if (Array.isArray(parsedModel) && parsedModel.length > 0) {
                // Assuming the first item is the model to set
                set({ selectedModel: parsedModel[0] });
              } else if (typeof parsedModel === 'object' && parsedModel !== null) {
                // If it's a single object, set it directly
                set({ selectedModel: parsedModel });
              }
            } catch (e) {
              console.error('Failed to parse selectedModel from persisted state:', e);
            }
          }
        }
        return Promise.resolve(null);
      },
    }
  )
);

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
