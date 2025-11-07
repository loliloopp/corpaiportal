import { supabase } from '@/shared/lib/supabase';

export interface RagObject {
  id: string;
  name: string;
  created_at: string;
}

export interface RagLogicalSection {
  id: string;
  name: string;
  created_at: string;
}

export interface S3Bucket {
  id: string;
  name: string;
  rag_object_id: string;
  created_at: string;
}

export interface KnowledgeBase {
  id: string;
  name: string;
  cloud_kb_root_id: string;
  cloud_kb_version_id: string;
  version_number: number;
  s3_bucket_id: string;
  logical_section_id: string;
  created_at: string;
}

/**
 * Fetch all RAG objects
 */
export const fetchRagObjects = async (): Promise<RagObject[]> => {
  const { data: { session }, error: sessionError } = await supabase.auth.getSession();
  
  if (sessionError || !session?.access_token) {
    throw new Error('Not authenticated');
  }

  const response = await fetch('/api/v1/admin/rag/objects', {
    headers: {
      'Authorization': `Bearer ${session.access_token}`,
      'Content-Type': 'application/json'
    }
  });

  if (!response.ok) {
    throw new Error('Failed to fetch RAG objects');
  }

  return response.json();
};

/**
 * Fetch all logical sections
 */
export const fetchLogicalSections = async (): Promise<RagLogicalSection[]> => {
  const { data: { session }, error: sessionError } = await supabase.auth.getSession();
  
  if (sessionError || !session?.access_token) {
    throw new Error('Not authenticated');
  }

  const response = await fetch('/api/v1/admin/rag/logical-sections', {
    headers: {
      'Authorization': `Bearer ${session.access_token}`,
      'Content-Type': 'application/json'
    }
  });

  if (!response.ok) {
    throw new Error('Failed to fetch logical sections');
  }

  return response.json();
};

/**
 * Fetch logical sections available for a specific object
 * (by finding knowledge bases linked to that object)
 */
export const fetchLogicalSectionsForObject = async (objectId: string): Promise<RagLogicalSection[]> => {
  const { data: { session }, error: sessionError } = await supabase.auth.getSession();
  
  if (sessionError || !session?.access_token) {
    throw new Error('Not authenticated');
  }

  // Get all knowledge bases for this object's buckets
  const response = await fetch('/api/v1/admin/rag/knowledge-bases', {
    headers: {
      'Authorization': `Bearer ${session.access_token}`,
      'Content-Type': 'application/json'
    }
  });

  if (!response.ok) {
    throw new Error('Failed to fetch knowledge bases');
  }

  const allKnowledgeBases: any[] = await response.json();
  
  // Filter knowledge bases that belong to buckets of this object
  const relevantKBs = allKnowledgeBases.filter(
    (kb: any) => kb.s3_buckets?.rag_object_id === objectId
  );

  // Extract unique logical sections
  const uniqueSections = new Map<string, RagLogicalSection>();
  relevantKBs.forEach((kb: any) => {
    if (kb.rag_logical_sections) {
      uniqueSections.set(kb.rag_logical_sections.id, kb.rag_logical_sections);
    }
  });

  return Array.from(uniqueSections.values());
};

/**
 * Send a RAG query to the backend
 */
export const sendRagQuery = async (
  objectId: string,
  logicalSectionId: string,
  query: string,
  model: string,
  messages: Array<{ role: string; content: string }>,
  onChunk: (content: string) => void,
  onComplete: (conversationId: string) => void,
  onError: (error: string) => void
) => {
  const { data: { session }, error: sessionError } = await supabase.auth.getSession();
  
  if (sessionError || !session?.access_token) {
    onError('Not authenticated');
    return;
  }

  const response = await fetch('/api/v1/chat/rag', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${session.access_token}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      object_id: objectId,
      logical_section_id: logicalSectionId,
      query,
      model,
      messages
    })
  });

  if (!response.ok) {
    const errorData = await response.json();
    onError(errorData.error || 'Failed to send RAG query');
    return;
  }

  // Handle SSE stream
  const reader = response.body?.getReader();
  const decoder = new TextDecoder();

  if (!reader) {
    onError('Failed to read response stream');
    return;
  }

  try {
    while (true) {
      const { done, value } = await reader.read();
      if (done) break;

      const chunk = decoder.decode(value, { stream: true });
      const lines = chunk.split('\n');

      for (const line of lines) {
        if (line.startsWith('data: ')) {
          const jsonStr = line.slice(6);
          try {
            const data = JSON.parse(jsonStr);
            if (data.type === 'content' && data.content) {
              onChunk(data.content);
            } else if (data.type === 'error') {
              onError(data.error || 'Unknown error');
            } else if (data.type === 'complete' && data.id) {
              // Stream complete with conversation ID
              onComplete(data.id);
              return; // Exit after complete
            }
          } catch (e) {
            // Skip invalid JSON (normal for partial chunks)
          }
        }
      }
    }

    // Should not reach here if stream completed properly
    onError('Stream ended without complete message');
  } catch (error: any) {
    onError(error.message || 'Stream reading error');
  }
};

