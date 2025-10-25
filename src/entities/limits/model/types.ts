export interface LogData {
    user_id: string;
    message_id?: string; // Made optional for cases where it might not exist
    model: string;
    prompt_tokens: number;
    completion_tokens: number;
    total_tokens: number;
    status: 'success' | 'error';
    error_details?: string;
}
