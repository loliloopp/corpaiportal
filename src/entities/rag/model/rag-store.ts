import { create } from 'zustand';
import { persist, createJSONStorage } from 'zustand/middleware';
import { 
  RagObject, 
  RagLogicalSection, 
  fetchRagObjects, 
  fetchLogicalSectionsForObject 
} from '../api/rag-api';

interface RagState {
  // UI state
  isRagMode: boolean;
  selectedRagObject: RagObject | null;
  selectedLogicalSection: RagLogicalSection | null;

  // Available options
  availableRagObjects: RagObject[];
  availableLogicalSections: RagLogicalSection[];

  // Loading states
  isLoadingObjects: boolean;
  isLoadingSections: boolean;

  // Actions
  setIsRagMode: (enabled: boolean) => void;
  setSelectedRagObject: (object: RagObject | null) => void;
  setSelectedLogicalSection: (section: RagLogicalSection | null) => void;
  fetchAvailableRagObjects: () => Promise<void>;
  fetchAvailableLogicalSections: (objectId: string) => Promise<void>;
  resetRagSelection: () => void;
}

export const useRagStore = create<RagState>()(
  persist(
    (set, get) => ({
      // Initial state
      isRagMode: false,
      selectedRagObject: null,
      selectedLogicalSection: null,
      availableRagObjects: [],
      availableLogicalSections: [],
      isLoadingObjects: false,
      isLoadingSections: false,

      // Toggle RAG mode
      setIsRagMode: (enabled: boolean) => {
        set({ isRagMode: enabled });
        
        // If enabling RAG mode and no objects loaded, fetch them
        if (enabled && get().availableRagObjects.length === 0) {
          get().fetchAvailableRagObjects();
        }
        
        // If disabling, reset selection
        if (!enabled) {
          set({ 
            selectedRagObject: null, 
            selectedLogicalSection: null 
          });
        }
      },

      // Set selected RAG object
      setSelectedRagObject: (object: RagObject | null) => {
        set({ 
          selectedRagObject: object,
          selectedLogicalSection: null, // Reset section when object changes
          availableLogicalSections: [] // Clear sections list
        });

        // Fetch logical sections for the new object
        if (object) {
          get().fetchAvailableLogicalSections(object.id);
        }
      },

      // Set selected logical section
      setSelectedLogicalSection: (section: RagLogicalSection | null) => {
        set({ selectedLogicalSection: section });
      },

      // Fetch available RAG objects
      fetchAvailableRagObjects: async () => {
        set({ isLoadingObjects: true });
        try {
          const objects = await fetchRagObjects();
          set({ 
            availableRagObjects: objects,
            isLoadingObjects: false 
          });

          // If there's only one object and no object is selected, auto-select it
          if (objects.length === 1 && !get().selectedRagObject) {
            get().setSelectedRagObject(objects[0]);
          }
        } catch (error) {
          console.error('Failed to fetch RAG objects:', error);
          set({ 
            isLoadingObjects: false,
            availableRagObjects: []
          });
        }
      },

      // Fetch logical sections for a specific object
      fetchAvailableLogicalSections: async (objectId: string) => {
        set({ isLoadingSections: true });
        try {
          const sections = await fetchLogicalSectionsForObject(objectId);
          set({ 
            availableLogicalSections: sections,
            isLoadingSections: false 
          });

          // If there's only one section and no section is selected, auto-select it
          if (sections.length === 1 && !get().selectedLogicalSection) {
            get().setSelectedLogicalSection(sections[0]);
          }
        } catch (error) {
          console.error('Failed to fetch logical sections:', error);
          set({ 
            isLoadingSections: false,
            availableLogicalSections: []
          });
        }
      },

      // Reset RAG selection
      resetRagSelection: () => {
        set({
          selectedRagObject: null,
          selectedLogicalSection: null,
          availableLogicalSections: []
        });
      }
    }),
    {
      name: 'rag-storage',
      storage: createJSONStorage(() => localStorage),
      partialize: (state) => ({
        isRagMode: state.isRagMode,
        selectedRagObject: state.selectedRagObject,
        selectedLogicalSection: state.selectedLogicalSection
      })
    }
  )
);

