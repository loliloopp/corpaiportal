import { supabase } from "@/shared/lib/supabase";
import { Database } from "@/shared/types/supabase";

export type Prompt = Database['public']['Tables']['prompts']['Row'];

export const getAllPrompts = async (): Promise<Prompt[]> => {
    const { data, error } = await supabase
        .from('prompts')
        .select('*')
        .order('role_name', { ascending: true });
    
    if (error) throw error;
    return data || [];
};

export const getDefaultPrompt = async (): Promise<Prompt | null> => {
    const { data, error } = await supabase
        .from('prompts')
        .select('*')
        .eq('by_default', true)
        .single();
    
    if (error && error.code !== 'PGRST116') throw error; // PGRST116 = no rows returned
    return data || null;
};

export const createPrompt = async (prompt: Database['public']['Tables']['prompts']['Insert']): Promise<Prompt> => {
    // If setting this as default, unset other defaults
    if (prompt.by_default) {
        await supabase
            .from('prompts')
            .update({ by_default: false })
            .eq('by_default', true);
    }

    const { data, error } = await supabase
        .from('prompts')
        .insert(prompt)
        .select()
        .single();
    
    if (error) throw error;
    return data;
};

export const updatePrompt = async (id: string, updates: Database['public']['Tables']['prompts']['Update']): Promise<Prompt> => {
    // If setting this as default, unset other defaults
    if (updates.by_default) {
        await supabase
            .from('prompts')
            .update({ by_default: false })
            .neq('id', id)
            .eq('by_default', true);
    }

    const { data, error } = await supabase
        .from('prompts')
        .update(updates)
        .eq('id', id)
        .select()
        .single();
    
    if (error) throw error;
    return data;
};

export const deletePrompt = async (id: string): Promise<void> => {
    const { error } = await supabase
        .from('prompts')
        .delete()
        .eq('id', id);
    
    if (error) throw error;
};
