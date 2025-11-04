import { supabase } from '@/shared/lib/supabase';
import { SSE } from 'sse.js';
import { Message, StreamData } from '../model/types';
import { APIError, parseAPIError } from '@/shared/lib/error-handler';


export const getConversations = async (userId: string) => {
  const { data, error } = await supabase
    .from('conversations')
    .select('id, title, created_at')
    .eq('user_id', userId)
    .order('created_at', { ascending: false });

  if (error) {
    console.error('Error fetching conversations:', error);
    throw error;
  }

  return data;
};

export const getMessages = async (conversationId: string) => {
  // Get messages first
  const { data: messages, error: messagesError } = await supabase
    .from('messages')
    .select('*')
    .eq('conversation_id', conversationId)
    .order('created_at', { ascending: true });

  if (messagesError) {
    console.error('Error fetching messages:', messagesError);
    throw messagesError;
  }

  if (!messages || messages.length === 0) {
    return [];
  }

  // Get all message IDs for assistant messages
  const assistantMessageIds = messages
    .filter((msg: any) => msg.role === 'assistant')
    .map((msg: any) => msg.id);

  // Fetch models from usage_logs for all assistant messages in one query
  let modelMap: Record<string, string> = {};
  if (assistantMessageIds.length > 0) {
    // Get all logs - user said model column is always filled
    // Order by created_at descending to get most recent log first
    const { data: usageLogs, error: logsError } = await supabase
      .from('usage_logs')
      .select('message_id, model')
      .in('message_id', assistantMessageIds)
      .order('created_at', { ascending: false });

    if (!logsError && usageLogs && usageLogs.length > 0) {
      // Create a map: message_id -> model
      // Take the first (most recent) log for each message
      // Process in reverse order so older logs overwrite newer ones if needed
      // Actually, we want the most recent, so process normally
      assistantMessageIds.forEach((msgId: string) => {
        // Find the first (most recent) log for this message
        const log = usageLogs.find((l: any) => l.message_id === msgId && l.model);
        if (log) {
          modelMap[msgId] = log.model;
        }
      });
    } else if (logsError) {
      console.error('Error fetching usage_logs:', logsError);
    }
  }

  // Return messages with model from usage_logs
  return messages.map((msg: any) => ({
    id: msg.id,
    role: msg.role,
    content: msg.content,
    model: modelMap[msg.id] || msg.model || null,
    conversation_id: msg.conversation_id,
    user_id: msg.user_id,
    created_at: msg.created_at,
  }));
};

export const createConversation = async (userId: string, title: string) => {
    const { data, error } = await supabase
        .from('conversations')
        .insert({ user_id: userId, title: title })
        .select('id')
        .single();

    if (error) {
        console.error('Error creating conversation:', error);
        throw error;
    }

    return data;
};

export const saveMessage = async (message: {
    conversation_id: string;
    user_id: string;
    role: 'user' | 'assistant';
    content: string;
    model?: string;
}) => {
    const { data, error } = await supabase
        .from('messages')
        .insert(message)
        .select()
        .single();
    
    if (error) {
        console.error('Error saving message:', error);
        throw error;
    }

    return data;
}

export const sendAIRequestStreaming = async (
  messages: Message[],
  selectedModelId: string,
  temperature: number,
  top_p: number,
  conversationId: string | null,
  jwt: string,
  onNewData: (data: StreamData) => void
): Promise<void> => {
  const url = 'http://localhost:3001/api/v1/chat/stream';
  const requestBody = {
    messages,
    model: selectedModelId,
    temperature,
    top_p,
    conversationId,
  };

  const headers = {
    'Content-Type': 'application/json',
    Authorization: `Bearer ${jwt}`,
  };

  const source = new SSE(url, {
    headers,
    payload: JSON.stringify(requestBody),
    withCredentials: true,
  });

  const requestStartTime = Date.now();
  const requestId = conversationId || `local-${Date.now()}`;
  console.log(`[Request Start] ID: ${requestId}, Model: ${selectedModelId}`);
  console.time(`Request Duration ${requestId}`);
  let firstChunkReceived = false;

  source.addEventListener('message', (e: any) => {
    if (!firstChunkReceived) {
      firstChunkReceived = true;
      const ttfb = Date.now() - requestStartTime;
      console.log(`[Request TTFB] ID: ${requestId}, First chunk received in ${ttfb}ms.`);
      console.timeLog(`Request Duration ${requestId}`, 'First chunk received (TTFB)');
    }

    try {
      const data = JSON.parse(e.data) as StreamData;
      console.log(`[Stream Data] Type: ${data.type}, Content length: ${data.type === 'chunk' ? data.content?.length : 0}`);
      
      onNewData(data);

      if (data.type === 'done' || data.type === 'error') {
        source.close();
        console.timeEnd(`Request Duration ${requestId}`);
      }
    } catch (error) {
      console.error('Failed to parse stream data:', e.data, error);
      onNewData({ type: 'error', error: 'Failed to parse stream data' });
      source.close();
      console.timeEnd(`Request Duration ${requestId}`);
    }
  });

  source.addEventListener('error', async (e: any) => {
    console.error('SSE error:', e);
    let errorData: any = { error: 'A network error occurred' };
    if(e.data) {
        try {
            errorData = JSON.parse(e.data);
        } catch(err) {
            errorData.details = e.data;
        }
    }
    const apiError = await parseAPIError(errorData, source.xhr);
    onNewData({ type: 'error', error: apiError.message, details: apiError.details });
    source.close();
    console.timeEnd(`Request Duration ${requestId}`);
  });

  source.stream();
};
