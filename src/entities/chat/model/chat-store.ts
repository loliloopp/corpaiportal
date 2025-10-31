import { create } from 'zustand';
import { nanoid } from 'nanoid';
import { queryClient } from '@/app/providers';
import { Message } from './types';
import { getConversations, getMessages, createConversation, saveMessage } from '../api/chat-api';
import { useAuthStore } from '@/features/auth';
import { sendAIRequest, ChatMessage, ChatResponse } from '@/shared/api/proxy-api';
import { APIError } from '@/shared/lib/error-handler';
import { logUsage } from '@/entities/limits';
import { Model, MODELS } from '@/shared/config/models.config';
import { getModelsWithAccess, ModelWithAccess, getUserAccessibleModels, AccessibleModel } from '@/entities/models/api/models-api';
import { openRouterApi, OpenRouterModel } from '@/entities/models/api/openrouter-api';

type Conversation = {
    id: string;
    title: string;
    created_at: string;
}

interface CachedResponse {
    response: ChatResponse;
    timestamp: number;
    params: {
        model: string;
        messagesHash: string;
    };
}

interface ChatState {
  conversations: Conversation[];
  messages: Message[];
  activeConversation: string | null;
  selectedModel: string;
  availableModels: Model[];
  openRouterModels: Model[];
  loading: boolean;
  onSendMessageStart: (() => void) | null;
  onError: ((error: { title: string; content: string }) => void) | null;
  lastResponse: ChatResponse | null; // Last AI response in memory
  messagesCache: Map<string, Message[]>; // Cache for messages by conversationId
  fetchConversations: (userId: string) => Promise<void>;
  fetchMessages: (conversationId: string) => Promise<void>;
  fetchAvailableModels: (userId: string) => Promise<void>;
  fetchOpenRouterModels: () => Promise<void>;
  setActiveConversation: (conversationId: string | null) => void;
  setSelectedModel: (model: string) => void;
  setErrorHandler: (handler: ((error: { title: string; content: string }) => void) | null) => void;
  sendMessage: (content: string) => void;
}

export const useChatStore = create<ChatState>((set, get) => {
  const initialActiveConversation = localStorage.getItem('activeConversation');
  const initialSelectedModel = localStorage.getItem('selectedModel');

  // Helper function to generate hash for messages
  const generateMessagesHash = (messages: ChatMessage[]): string => {
    const messagesStr = JSON.stringify(messages.map(m => ({ role: m.role, content: m.content })));
    // Simple hash function
    let hash = 0;
    for (let i = 0; i < messagesStr.length; i++) {
      const char = messagesStr.charCodeAt(i);
      hash = ((hash << 5) - hash) + char;
      hash = hash & hash; // Convert to 32bit integer
    }
    return hash.toString();
  };

  // Helper function to load cache from localStorage
  const loadCacheFromStorage = (conversationId: string): CachedResponse[] => {
    try {
      const cached = localStorage.getItem(`chat_cache_${conversationId}`);
      if (cached) {
        const parsed = JSON.parse(cached) as CachedResponse[];
        const now = Date.now();
        const TTL = 24 * 60 * 60 * 1000; // 24 hours
        // Filter out expired entries
        return parsed.filter(entry => (now - entry.timestamp) < TTL);
      }
    } catch (e) {
      console.error('Error loading cache from storage:', e);
    }
    return [];
  };

  // Helper function to save cache to localStorage (keep last 19, as last one is in memory)
  const saveCacheToStorage = (conversationId: string, cache: CachedResponse[]) => {
    try {
      // Keep only last 19 entries (last one is in memory)
      const toSave = cache.slice(-19);
      localStorage.setItem(`chat_cache_${conversationId}`, JSON.stringify(toSave));
    } catch (e) {
      console.error('Error saving cache to storage:', e);
    }
  };

  return {
    conversations: [],
    messages: [],
    activeConversation: initialActiveConversation ? JSON.parse(initialActiveConversation) : null,
    selectedModel: initialSelectedModel || 'grok-4-fast',
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
    fetchAvailableModels: async (userId: string) => {
      try {
        // Get models that the user has access to
        const userModels: AccessibleModel[] = await getUserAccessibleModels(userId);
          
        set({ availableModels: userModels.map((m: AccessibleModel) => ({
          id: m.id,
          name: m.name,
          provider: m.provider as Model['provider'],
        })) });

        // If the currently selected model is not in the available list, switch to the first available one
        const currentModelStillAvailable = userModels.some((m: AccessibleModel) => m.id === get().selectedModel);
        if (!currentModelStillAvailable && userModels.length > 0) {
            set({ selectedModel: userModels[0].id });
        }

      } catch (error) {
        console.error('Error fetching available models:', error);
        set({ availableModels: [] });
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
      // Only clear messages if conversation is actually changing
      const currentConversation = get().activeConversation;
      if (currentConversation !== conversationId) {
        set({ activeConversation: conversationId, messages: [] });
        localStorage.setItem('activeConversation', JSON.stringify(conversationId));
        if (conversationId) {
          get().fetchMessages(conversationId);
        } else {
          // Clear cache when switching to new chat
          set({ messagesCache: new Map() });
        }
      }
    },
    setSelectedModel: (model: string) => {
      // Invalidate cache when model changes
      set({ selectedModel: model, lastResponse: null });
      localStorage.setItem('selectedModel', model);
    },
    sendMessage: async (content: string) => {
      get().onSendMessageStart?.(); 

      const { activeConversation, selectedModel, messages, lastResponse } = get();
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
        // Convert messages to ChatMessage format
        const conversationHistory: ChatMessage[] = [...messages, optimisticUserMessage].map(msg => ({
          role: msg.role,
          content: msg.content,
        }));

        // Generate hash for cache lookup
        const messagesHash = generateMessagesHash(conversationHistory);
        const cacheKey = `${selectedModel}_${messagesHash}`;

        // Check cache (first in memory, then localStorage)
        let cachedResponse: CachedResponse | undefined;
        
        // Check if last response matches
        if (lastResponse && lastResponse.id === activeConversation) {
          // This is approximate - in real scenario we'd need better matching
          // For now, we'll always fetch fresh data but cache responses
        }

        // Check localStorage cache
        if (activeConversation) {
          const storageCache = loadCacheFromStorage(activeConversation);
          cachedResponse = storageCache.find(c => c.params.messagesHash === messagesHash && c.params.model === selectedModel);
        }

        let aiResponseData: ChatResponse;
        
        if (cachedResponse && (Date.now() - cachedResponse.timestamp) < 24 * 60 * 60 * 1000) {
          // Use cached response
          aiResponseData = cachedResponse.response;
        } else {
          // Fetch from API
          aiResponseData = await sendAIRequest(selectedModel, conversationHistory, activeConversation);

          // Save to cache
          const cacheEntry: CachedResponse = {
            response: aiResponseData,
            timestamp: Date.now(),
            params: {
              model: selectedModel,
              messagesHash,
            },
          };

          // Save last response in memory
          set({ lastResponse: aiResponseData });

          // Save to localStorage cache
          if (activeConversation) {
            const storageCache = loadCacheFromStorage(activeConversation);
            storageCache.push(cacheEntry);
            // Keep only last 20 entries (1 in memory + 19 in storage)
            const trimmedCache = storageCache.slice(-19);
            saveCacheToStorage(activeConversation, trimmedCache);
          }
        }

        // If a new conversation was created, update the store and UI
        if (!activeConversation && aiResponseData.id) {
            get().setActiveConversation(aiResponseData.id);
            get().fetchConversations(user.id);
        }

        // Refetch messages to get the real IDs and content from DB
        await get().fetchMessages(get().activeConversation!);

        // Invalidate usage stats queries so header counter updates immediately
        queryClient.invalidateQueries({ queryKey: ['usageStats'] });
        queryClient.invalidateQueries({ queryKey: ['currentUserSimpleStats'] });

      } catch (error) {
        console.error('Error in sendMessage:', error);
        
        // On error, remove the optimistic message
        set((state) => ({ messages: state.messages.filter(m => m.id !== optimisticUserMessage.id) }));

        // Handle error with proper typing
        let title = 'Ошибка запроса';
        let content = 'Не удалось выполнить запрос. Попробуйте позже.';

        if (error instanceof APIError) {
          const isRateLimit = error.status === 429 || error.code === 'DAILY_LIMIT_EXCEEDED';
          title = isRateLimit ? 'Лимит запросов превышен' : 'Ошибка запроса';
          content = error.message || content;
        } else if (error instanceof Error) {
          content = error.message || content;
        }

        // Use callback if available, otherwise fallback to console
        const errorHandler = get().onError;
        if (errorHandler) {
          errorHandler({ title, content });
        } else {
          console.error(title, content);
        }
        
      } finally {
          set({ loading: false });
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
