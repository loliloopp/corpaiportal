// Centralized error handling with typed error classes

export class APIError extends Error {
    constructor(
        message: string,
        public status: number,
        public code?: string,
        public details?: unknown
    ) {
        super(message);
        this.name = 'APIError';
    }
}

export class ValidationError extends Error {
    constructor(message: string, public field?: string) {
        super(message);
        this.name = 'ValidationError';
    }
}

export class NetworkError extends Error {
    constructor(message: string, public originalError?: unknown) {
        super(message);
        this.name = 'NetworkError';
    }
}

export interface ErrorHandlerOptions {
    logToConsole?: boolean;
    showToUser?: boolean;
    userMessage?: (error: Error) => { title: string; content: string };
}

/**
 * Centralized error handler
 */
export function handleError(
    error: unknown,
    options: ErrorHandlerOptions = {}
): Error {
    const {
        logToConsole = true,
        showToUser = false,
        userMessage,
    } = options;

    let processedError: Error;

    // Convert unknown error to Error instance
    if (error instanceof Error) {
        processedError = error;
    } else if (typeof error === 'string') {
        processedError = new Error(error);
    } else {
        processedError = new Error('Unknown error occurred');
    }

    // Log to console if enabled
    if (logToConsole) {
        console.error('Error handled:', {
            name: processedError.name,
            message: processedError.message,
            stack: processedError.stack,
            error,
        });
    }

    // Show to user if enabled and message handler provided
    if (showToUser && userMessage) {
        const { title, content } = userMessage(processedError);
        // This will be handled by the calling component using App.useApp().message
        // Return the error with user-friendly message attached
        (processedError as Error & { userTitle?: string; userContent?: string }).userTitle = title;
        (processedError as Error & { userTitle?: string; userContent?: string }).userContent = content;
    }

    return processedError;
}

/**
 * Parse API error response and create appropriate error instance
 */
export function parseAPIError(
    response: Response,
    errorData?: { error?: string; code?: string; details?: unknown }
): APIError {
    const message = errorData?.error || `Request failed with status ${response.status}`;
    return new APIError(
        message,
        response.status,
        errorData?.code,
        errorData?.details
    );
}

