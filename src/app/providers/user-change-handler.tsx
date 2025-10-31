import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuthStore } from '@/features/auth';
import { useChatStore } from '@/entities/chat/model/chat-store';

/**
 * Component that monitors user changes and clears chat state.
 * Must be rendered within a Router context to use useNavigate.
 */
export const UserChangeHandler = ({ children }: { children: React.ReactNode }) => {
  const user = useAuthStore((state) => state.user);
  const setActiveConversation = useChatStore((state) => state.setActiveConversation);
  const [lastUserId, setLastUserId] = useState<string | null>(null);
  const navigate = useNavigate();

  useEffect(() => {
    const currentUserId = user?.id ?? null;

    // Check if it's not the initial load and the user ID has actually changed.
    if (lastUserId !== null && currentUserId !== lastUserId) {
      // User has changed, clear chat state and navigate to the home chat page.
      setActiveConversation(null);
      localStorage.removeItem('activeConversation');
      navigate('/chat', { replace: true });
    }

    // Update lastUserId for the next render.
    if (currentUserId !== lastUserId) {
      setLastUserId(currentUserId);
    }
  }, [user, lastUserId, setActiveConversation, navigate]);

  return <>{children}</>;
};
