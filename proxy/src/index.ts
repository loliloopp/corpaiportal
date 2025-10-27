import express, { Request, Response } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { createClient } from '@supabase/supabase-js';
import axios from 'axios';

dotenv.config();

// Supabase client for server-side operations
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceRoleKey) {
    throw new Error('Supabase URL or Service Role Key is not defined in environment variables.');
}

const supabase = createClient(supabaseUrl, supabaseServiceRoleKey);

// Immediately test the service_role key on startup
(async () => {
    console.log('Testing Supabase connection with service_role key...');
    const { data, error } = await supabase.from('user_profiles').select('*').limit(1);

    if (error) {
        console.error('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        console.error('!!! SUPABASE CONNECTION FAILED !!!');
        console.error('!!! Error fetching user_profiles:', error.message);
        console.error('!!! This almost certainly means your SUPABASE_SERVICE_ROLE_KEY is incorrect in .env');
        console.error('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    } else {
        console.log('>>> Supabase connection successful. service_role key is working.');
    }
})();


const app = express();
const port = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());

const AI_PROVIDERS_CONFIG: Record<string, { provider: string, url: string, apiKey: string | undefined }> = {
    'gpt-5': { provider: 'openai', url: 'https://api.openai.com/v1/chat/completions', apiKey: process.env.OPENAI_API_KEY },
    'gpt-5-mini': { provider: 'openai', url: 'https://api.openai.com/v1/chat/completions', apiKey: process.env.OPENAI_API_KEY },
    'grok-4-fast': { provider: 'grok', url: 'https://api.x.ai/v1/chat/completions', apiKey: process.env.GROK_API_KEY },
    'deepseek-chat': { provider: 'deepseek', url: 'https://api.deepseek.com/v1/chat/completions', apiKey: process.env.DEEPSEEK_API_KEY },
    'gemini-2.5-pro': { provider: 'gemini', url: `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=${process.env.GEMINI_API_KEY}`, apiKey: process.env.GEMINI_API_KEY },
    'gemini-2.5-flash': { provider: 'gemini', url: `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=${process.env.GEMINI_API_KEY}`, apiKey: process.env.GEMINI_API_KEY },
};


// Main chat proxy endpoint
app.post('/api/v1/chat', async (req: Request, res: Response) => {
    const { model, messages, jwt, conversationId: initialConversationId } = req.body;

    if (!model || !messages || !jwt) {
        return res.status(400).json({ error: 'Missing model, messages, or jwt in request body.' });
    }

    try {
        // 1. Authenticate user
        const { data: { user }, error: userError } = await supabase.auth.getUser(jwt);
        if (userError || !user) {
            return res.status(401).json({ error: 'Invalid JWT. Authentication failed.' });
        }
        
        // 2. Check model access rights
        const { data: hasAccess, error: accessError } = await supabase.rpc('check_model_access', {
            p_user_id: user.id,
            p_model_id: model,
        });

        if (accessError) {
            console.error('Error checking model access:', accessError);
            return res.status(500).json({ error: 'Error checking model access.' });
        }

        if (!hasAccess) {
            return res.status(403).json({ error: 'У вас нет доступа к этой модели.' });
        }

        let conversationId = initialConversationId;
        const userMessageContent = messages[messages.length - 1].content;

        // 3. Create conversation if it's a new one
        if (!conversationId) {
            const { data: newConversation, error: convError } = await supabase
                .from('conversations')
                .insert({ user_id: user.id, title: userMessageContent.substring(0, 50) })
                .select()
                .single();
            if (convError) throw convError;
            conversationId = newConversation.id;
        }

        // 4. Save user message
        const { data: savedUserMessage, error: userMessageError } = await supabase
            .from('messages')
            .insert({
                conversation_id: conversationId,
                user_id: user.id,
                role: 'user',
                content: userMessageContent,
                model: model,
            })
            .select()
            .single();
        if (userMessageError) throw userMessageError;


        // 5. Check limits (now that we have a user)
        const { data: usageData, error: usageError } = await supabase.rpc('get_user_usage_stats', { p_user_id: user.id });
        if (usageError) throw new Error(usageError.message);
        if (usageData.usage >= usageData.limit) {
            return res.status(429).json({ error: 'Дневной лимит запросов исчерпан.' });
        }
        
        const providerConfig = AI_PROVIDERS_CONFIG[model];
        if (!providerConfig) {
            return res.status(400).json({ error: `Model ${model} is not configured on the proxy.` });
        }
        if (!providerConfig.apiKey) {
            return res.status(500).json({ error: `API key for ${providerConfig.provider} is not configured on the server.` });
        }

        let requestBody;
        let headers;
        
        // Adapt body and headers for Gemini
        if (providerConfig.provider === 'gemini') {
            requestBody = {
                contents: messages.map((msg: any) => ({
                    role: msg.role === 'assistant' ? 'model' : msg.role,
                    parts: [{ text: msg.content }],
                })),
            };
            headers = { 'Content-Type': 'application/json' };
        } else {
            requestBody = { model, messages };
            headers = {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${providerConfig.apiKey}`,
            };
        }

        // 6. Forward to AI provider
        const aiResponse = await axios.post(providerConfig.url, requestBody, { headers });
        const aiMessageContent = providerConfig.provider === 'gemini'
            ? aiResponse.data.candidates[0].content.parts[0].text
            : aiResponse.data.choices[0].message.content;

        // 7. Save AI message
        await supabase.from('messages').insert({
            conversation_id: conversationId,
            user_id: user.id,
            role: 'assistant',
            content: aiMessageContent,
            model: model,
        });

        // 8. Log usage
        const usage = providerConfig.provider === 'gemini' 
            ? aiResponse.data.usageMetadata 
            : aiResponse.data.usage;
        
        const logData = {
            user_id: user.id,
            model: model,
            prompt_tokens: usage.promptTokenCount || usage.prompt_tokens,
            completion_tokens: usage.candidatesTokenCount || usage.completion_tokens,
            total_tokens: usage.totalTokenCount || usage.total_tokens,
            status: 'success',
        };

        const { error: logError } = await supabase.from('usage_logs').insert([{
             ...logData,
             message_id: savedUserMessage.id, // Critical fix
        }]);

        if (logError) {
            // Log the error but don't block the user response
            console.error('Failed to log usage:', logError);
        }

        // 9. Return response
        res.status(200).json({
            ...aiResponse.data,
            // Return conversationId so frontend knows it if it was created
            conversationId: conversationId,
        });
    } catch (error: any) {
        // Also log errors from AI providers
        console.error('Error in chat proxy:', error.response ? error.response.data : error.message);
        res.status(error.response?.status || 500).json({ error: error.response?.data?.error || error.message });
    }
});


app.get('/api/health', (req: Request, res: Response) => {
    res.status(200).send('Proxy server is running');
});

app.listen(port, () => {
    console.log(`Proxy server listening at http://localhost:${port}`);
});
