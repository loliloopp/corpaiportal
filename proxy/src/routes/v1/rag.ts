import { Router, Request, Response } from 'express';
import { SupabaseClient } from '@supabase/supabase-js';
import axios from 'axios';
import { z } from 'zod';
import ChatService from '../../services/chatService';
import CloudRuTokenService from '../../services/CloudRuTokenService';

// Validation schema for RAG request
const ragRequestSchema = z.object({
  object_id: z.string().uuid('Invalid object ID'),
  logical_section_id: z.string().uuid('Invalid logical section ID'),
  query: z.string().min(1, 'Query cannot be empty'),
  model: z.string().min(1, 'Model ID is required'),
  messages: z.array(z.object({
    role: z.enum(['system', 'user', 'assistant']),
    content: z.string()
  })).min(1, 'At least one message is required')
});

type RagRequestPayload = z.infer<typeof ragRequestSchema>;

export default (supabase: SupabaseClient, chatService: ChatService) => {
  const router = Router();

  // Helper function to make RAG request with retry on 401
  async function makeRagRequest(
    ragUrl: string, 
    query: string, 
    cloud_kb_version_id: string,
    tokenService: CloudRuTokenService,
    retry: boolean = true
  ) {
    const accessToken = await tokenService.getAccessToken();

    try {
      const response = await axios.post(
        ragUrl,
        {
          query: query,
          retrieve_limit: 5,
          rag_version: cloud_kb_version_id
        },
        {
          headers: {
            'Authorization': `Bearer ${accessToken}`,
            'Content-Type': 'application/json'
          },
          timeout: 30000 // 30 seconds timeout
        }
      );
      return response;
    } catch (error: any) {
      // Handle 401 errors by clearing cache and retrying once
      if (error.response?.status === 401 && retry) {
        console.warn('[RAG] Received 401, clearing token cache and retrying');
        tokenService.clearCache();
        return makeRagRequest(ragUrl, query, cloud_kb_version_id, tokenService, false);
      }
      throw error;
    }
  }

  router.post('/chat/rag', async (req: Request, res: Response) => {
    try {
      // Check authentication
      if (!req.user) {
        console.error('[RAG] Authentication required but req.user is missing');
        return res.status(401).json({ error: 'Authentication required.' });
      }

      // Validate request body
      const result = ragRequestSchema.safeParse(req.body);
      if (!result.success) {
        console.warn('[RAG] Invalid request body:', result.error.flatten());
        return res.status(400).json({ 
          error: 'Invalid request body', 
          details: result.error.flatten() 
        });
      }

      const { object_id, logical_section_id, query, model, messages } = result.data;

      console.log('[RAG] Request received', { userId: req.user.id, object_id, logical_section_id, model });

      // Step 1: Find the latest version of knowledge base for given object and logical section
      const { data: kbData, error: kbError } = await supabase
        .from('knowledge_bases')
        .select(`
          id,
          name,
          cloud_kb_root_id,
          cloud_kb_version_id,
          version_number,
          s3_bucket_id,
          s3_buckets!inner(rag_object_id)
        `)
        .eq('logical_section_id', logical_section_id)
        .eq('s3_buckets.rag_object_id', object_id)
        .order('version_number', { ascending: false })
        .limit(1)
        .single();

      if (kbError || !kbData) {
        console.error('Knowledge base not found', kbError);
        return res.status(404).json({ 
          error: 'Knowledge base not found for the selected object and logical section' 
        });
      }

      const { cloud_kb_root_id, cloud_kb_version_id } = kbData;

      console.log('Using knowledge base version', { 
        kb_id: kbData.id, 
        cloud_kb_root_id, 
        cloud_kb_version_id 
      });

      // Step 2: Retrieve context from Cloud.ru RAG API
      const tokenService = CloudRuTokenService.getInstance();
      const ragUrl = `https://${cloud_kb_root_id}.managed-rag.inference.cloud.ru/api/v1/retrieve`;
      
      console.log('[RAG] Requesting context from Cloud.ru', { 
        ragUrl,
        versionId: cloud_kb_version_id
      });

      const ragResponse = await makeRagRequest(ragUrl, query, cloud_kb_version_id, tokenService);

      console.log('[RAG] Context retrieved from Cloud.ru', { 
        resultsRetrieved: ragResponse.data?.results?.length || 0,
        fullResponse: JSON.stringify(ragResponse.data, null, 2)
      });

      // Step 3: Extract context from response
      const documents = ragResponse.data?.results || [];
      
      if (documents.length === 0) {
        console.warn('No documents retrieved from RAG');
      }

      // Format context from retrieved documents
      const contextText = documents
        .map((doc: any, index: number) => {
          const content = doc.content || doc.text || '';
          const score = doc.score !== undefined ? ` (релевантность: ${doc.score.toFixed(2)})` : '';
          return `Документ ${index + 1}${score}:\n${content}`;
        })
        .join('\n\n---\n\n');

      // Step 4: Create enhanced system message with RAG context
      const ragSystemMessage = {
        role: 'system' as const,
        content: `Ты — AI-ассистент, который помогает пользователям найти информацию на основе внутренней базы знаний.

Используй следующий контекст из базы знаний для ответа на вопрос пользователя:

${contextText || 'Контекст не найден.'}

Инструкции:
1. Отвечай только на основе предоставленного контекста.
2. Если в контексте нет информации для ответа, сообщи об этом.
3. Указывай ссылки на источники, если они есть в документах.
4. Будь точным и конкретным.

Вопрос пользователя: ${query}`
      };

      // Step 5: Prepare messages array with RAG context
      const enhancedMessages = [ragSystemMessage, ...messages];

      console.log('Sending enhanced request to LLM', { messageCount: enhancedMessages.length });

      // Step 6: Stream response from selected LLM using existing chat service
      // Set headers for SSE
      res.setHeader('Content-Type', 'text/event-stream');
      res.setHeader('Cache-Control', 'no-cache');
      res.setHeader('Connection', 'keep-alive');

      // Create chat request payload for the existing service
      const chatPayload = {
        model,
        messages: enhancedMessages,
        conversationId: null, // RAG chats don't save to conversations for now
        temperature: undefined,
        top_p: undefined
      };

      console.log('[RAG] Calling handleStreamChatRequest');
      try {
        await chatService.handleStreamChatRequest(chatPayload, req.user.id, res);
        console.log('[RAG] handleStreamChatRequest completed successfully');
      } catch (innerError: any) {
        console.error('[RAG] Error in handleStreamChatRequest:', innerError.message);
        throw innerError;
      }

    } catch (error: any) {
      console.error('[RAG] Error in RAG chat endpoint', error.message);
      
      if (error.response) {
        // Error from Cloud.ru RAG API
        console.error('[RAG] Cloud.ru API error', { 
          status: error.response.status,
          statusText: error.response.statusText,
          data: error.response.data,
          message: 'Check: 1) Are KEY_ID and KEY_SECRET correct? 2) Does the key have access to this KB? 3) Is the KB version correct?'
        });
        
        if (!res.headersSent) {
          return res.status(error.response.status).json({ 
            error: 'Failed to retrieve context from RAG service',
            details: error.response.data
          });
        }
      }

      if (!res.headersSent) {
        res.status(500).json({ 
          error: 'Internal server error in RAG endpoint',
          details: error.message 
        });
      } else if (!res.writableEnded) {
        res.write(`data: ${JSON.stringify({ 
          type: 'error', 
          error: error.message || 'Internal server error' 
        })}\n\n`);
        res.end();
      }
    }
  });

  return router;
};

