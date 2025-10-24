import { create } from 'zustand';
import { UserProfile } from './types';
import { getUsage, getUserProfile } from '../api/limits-api';

interface UsageStats {
    requests: number;
    tokens: number;
}

interface LimitsState {
  profile: UserProfile | null;
  dailyUsage: UsageStats;
  monthlyUsage: UsageStats;
  loading: boolean;
  fetchUserProfile: (userId: string) => Promise<void>;
  fetchUsage: (userId: string) => Promise<void>;
  checkLimits: () => { canMakeRequest: boolean; reason: string | null };
}

export const useLimitsStore = create<LimitsState>((set, get) => ({
  profile: null,
  dailyUsage: { requests: 0, tokens: 0 },
  monthlyUsage: { requests: 0, tokens: 0 },
  loading: true,
  fetchUserProfile: async (userId: string) => {
    set({ loading: true });
    try {
      const profile = await getUserProfile(userId);
      set({ profile: profile ?? null });
    } catch (error) {
      console.error('Failed to fetch user profile', error);
    } finally {
      set({ loading: false });
    }
  },
  fetchUsage: async (userId: string) => {
    try {
      const { dailyUsage, monthlyUsage } = await getUsage(userId);
      set({ dailyUsage, monthlyUsage });
    } catch (error) {
      console.error('Failed to fetch usage stats', error);
    }
  },
  checkLimits: () => {
    const { profile, dailyUsage, monthlyUsage } = get();
    if (!profile) {
      // Allow request if profile is not loaded yet, server will check again.
      return { canMakeRequest: true, reason: null };
    }

    if (profile.daily_request_limit_enabled && dailyUsage.requests >= profile.daily_request_limit) {
      return { canMakeRequest: false, reason: 'Превышен дневной лимит запросов.' };
    }
    if (profile.monthly_request_limit_enabled && monthlyUsage.requests >= profile.monthly_request_limit) {
      return { canMakeRequest: false, reason: 'Превышен месячный лимит запросов.' };
    }
    if (profile.daily_token_limit_enabled && dailyUsage.tokens >= profile.daily_token_limit) {
      return { canMakeRequest: false, reason: 'Превышен дневной лимит токенов.' };
    }
    if (profile.monthly_token_limit_enabled && monthlyUsage.tokens >= profile.monthly_token_limit) {
      return { canMakeRequest: false, reason: 'Превышен месячный лимит токенов.' };
    }

    return { canMakeRequest: true, reason: null };
  }
}));
