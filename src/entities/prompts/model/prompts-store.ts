import { create } from 'zustand';
import { Prompt } from '../api/prompts-api';

interface PromptsStore {
  selectedPrompt: Prompt | null;
  isPromptEnabled: boolean; // true = using a prompt, false = no preprocessing
  setSelectedPrompt: (prompt: Prompt | null) => void;
  togglePromptEnabled: () => void;
}

const PROMPT_STORAGE_KEY = 'selectedPrompt';
const ENABLED_STORAGE_KEY = 'isPromptEnabled';

export const usePromptsStore = create<PromptsStore>((set) => ({
  selectedPrompt: (() => {
    try {
      const stored = localStorage.getItem(PROMPT_STORAGE_KEY);
      if (stored) {
        return JSON.parse(stored);
      }
    } catch (error) {
      console.error('Failed to load selected prompt from localStorage:', error);
    }
    return null;
  })(),
  isPromptEnabled: (() => {
    try {
      const stored = localStorage.getItem(ENABLED_STORAGE_KEY);
      return stored ? JSON.parse(stored) : true; // Default to true (enabled)
    } catch (error) {
      console.error('Failed to load prompt enabled state from localStorage:', error);
      return true;
    }
  })(),
  setSelectedPrompt: (prompt) => {
    set({ selectedPrompt: prompt, isPromptEnabled: prompt !== null });
    // Save to localStorage
    try {
      if (prompt) {
        localStorage.setItem(PROMPT_STORAGE_KEY, JSON.stringify(prompt));
        localStorage.setItem(ENABLED_STORAGE_KEY, 'true');
      } else {
        localStorage.removeItem(PROMPT_STORAGE_KEY);
        localStorage.setItem(ENABLED_STORAGE_KEY, 'false');
      }
    } catch (error) {
      console.error('Failed to save prompt state to localStorage:', error);
    }
  },
  togglePromptEnabled: () => {
    set((state) => {
      const newEnabled = !state.isPromptEnabled;
      // Save to localStorage
      try {
        localStorage.setItem(ENABLED_STORAGE_KEY, JSON.stringify(newEnabled));
        if (!newEnabled) {
          localStorage.removeItem(PROMPT_STORAGE_KEY);
        }
      } catch (error) {
        console.error('Failed to save prompt enabled state:', error);
      }
      return { isPromptEnabled: newEnabled, selectedPrompt: newEnabled ? state.selectedPrompt : null };
    });
  },
}));
