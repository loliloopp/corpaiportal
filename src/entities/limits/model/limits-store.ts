import { create } from 'zustand';

interface LimitsState {
  checkLimits: () => { canMakeRequest: boolean; reason: string | null };
}

export const useLimitsStore = create<LimitsState>(() => ({
  checkLimits: () => {
    // This store is now mostly legacy. 
    // The core logic has been moved to RPC functions and the chat store.
    // We can keep this for now to avoid breaking other parts of the app,
    // but it should be phased out.
    return { canMakeRequest: true, reason: null };
  }
}));
