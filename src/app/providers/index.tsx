import React, { useEffect, useState } from 'react';
import { BrowserRouter } from 'react-router-dom';
import { App as AntApp } from 'antd';
import { ThemeProvider } from './theme-provider';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { useAuthStore } from '@/features/auth';
import { supabase } from '@/shared/lib/supabase';
import { Spin } from 'antd';
import { UserChangeHandler } from './user-change-handler';

export const queryClient = new QueryClient();

export const AppProvider = ({ children }: { children: React.ReactNode }) => {
  const setSession = useAuthStore((state) => state.setSession);
  const setLoading = useAuthStore((state) => state.setLoading);
  const [initialLoadComplete, setInitialLoadComplete] = useState(false);

  useEffect(() => {
    supabase.auth.getSession().then(async ({ data: { session } }) => {
      await setSession(session);
      setLoading(false);
      setInitialLoadComplete(true);
    });

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

  if (!initialLoadComplete) {
    return <Spin fullscreen />;
  }

  return (
    <React.StrictMode>
      <BrowserRouter>
        <UserChangeHandler>
          <QueryClientProvider client={queryClient}>
            <ThemeProvider>
              <AntApp>
                {children}
              </AntApp>
            </ThemeProvider>
          </QueryClientProvider>
        </UserChangeHandler>
      </BrowserRouter>
    </React.StrictMode>
  );
};
