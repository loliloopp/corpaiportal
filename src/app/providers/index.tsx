import React, { useEffect, useState } from 'react';
import { BrowserRouter } from 'react-router-dom';
import { App as AntApp } from 'antd';
import { ThemeProvider } from './theme-provider';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { useAuthStore } from '@/features/auth';
import { supabase } from '@/shared/lib/supabase';
import { Spin } from 'antd';

export const queryClient = new QueryClient();

export const AppProvider = ({ children }: { children: React.ReactNode }) => {
  const setSession = useAuthStore((state) => state.setSession);
  const setLoading = useAuthStore((state) => state.setLoading);
  const [initialLoadComplete, setInitialLoadComplete] = useState(false);

  useEffect(() => {
    // Initial session check - WAIT for setSession to complete
    supabase.auth.getSession().then(async ({ data: { session } }) => {
      await setSession(session); // Wait for profile to load
      setLoading(false);
      setInitialLoadComplete(true);
    });

    // Set up listener for future auth changes
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session);
      setLoading(false);
    });

    return () => {
      subscription.unsubscribe();
    };
  }, [setSession, setLoading]);

  // Don't render router until initial session is loaded and profile is fetched
  if (!initialLoadComplete) {
    return <Spin fullscreen />;
  }

  return (
    <React.StrictMode>
      <BrowserRouter>
        <QueryClientProvider client={queryClient}>
          <ThemeProvider>
            <AntApp>
                {children}
            </AntApp>
          </ThemeProvider>
        </QueryClientProvider>
      </BrowserRouter>
    </React.StrictMode>
  );
};
