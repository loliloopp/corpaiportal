import { supabase } from '@/shared/lib/supabase';

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
  const { data, error } = await supabase
    .from('messages')
    .select('*')
    .eq('conversation_id', conversationId)
    .order('created_at', { ascending: true });

  if (error) {
    console.error('Error fetching messages:', error);
    throw error;
  }

  return data;
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
