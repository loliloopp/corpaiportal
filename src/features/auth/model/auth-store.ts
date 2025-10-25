import { create } from 'zustand';
import { supabase } from '@/shared/lib/supabase';
import type { Session, User } from '@supabase/supabase-js';

interface AuthState {
  session: Session | null;
  user: User | null;
  profile: { role: string; } | null;
  loading: boolean;
  isProfileLoading: boolean; // New state for profile loading
  setSession: (session: Session | null) => Promise<void>;
  signOut: () => Promise<void>;
  signUp: (credentials: { email: any; password: any; lastName: any; }) => Promise<any>;
  setLoading: (loading: boolean) => void;
}

export const useAuthStore = create<AuthState>((set) => ({
  session: null,
  user: null,
  profile: null,
  loading: true,
  isProfileLoading: true, // Default to true
  setSession: async (session) => {
    set({ isProfileLoading: true }); // Start loading profile
    let profile = null;
    if (session?.user) {
      const { data, error } = await supabase
        .from('user_profiles')
        .select('role')
        .eq('id', session.user.id)
        .single();
      
      if (error) {
        console.error('Error fetching user profile:', error);
      } else {
        profile = data;
      }
    }
    set({ session, user: session?.user ?? null, profile, isProfileLoading: false }); // End loading profile
  },
  signOut: async () => {
    await supabase.auth.signOut();
    set({ session: null, user: null, profile: null, isProfileLoading: false });
  },
  signUp: async ({ email, password, lastName }) => {
    const { error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: {
          display_name: lastName,
        },
      },
    });
    return error;
  },
  setLoading: (loading) => set({ loading }),
}));
