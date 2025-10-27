# Model Access Control Implementation Summary

## Overview
Implemented a comprehensive role-based model access control system for the corporate AI portal. Users can be granted or denied access to specific AI models, with default access for selected models.

## Changes Made

### 1. Database Schema

#### Models Table (`models`)
- `id` (uuid): Primary key
- `model_id` (text): Unique model identifier (e.g., 'gpt-5', 'grok-4-fast')
- `display_name` (text): User-friendly model name
- `provider` (text): AI provider (openai, grok, deepseek, gemini)
- `temperature` (real): Default temperature setting for requests
- `is_default_access` (boolean): Whether all users have default access

#### User Model Access Table (`user_model_access`)
- `user_id` (uuid): Foreign key to `user_profiles`
- `model_id` (uuid): Foreign key to `models`
- Primary key: (user_id, model_id)

#### Initial Model Configuration
- **Default Access (for all users):**
  - GPT-5 Mini (openai, `gpt-5-mini`)
  - Grok 4 Fast (grok, `grok-4-fast`)

- **Admin-Approval Required:**
  - GPT-5 (openai, `gpt-5`)
  - Google Gemini 2.5 Pro (gemini, `gemini-2.5-pro`)
  - Google Gemini 2.5 Flash (gemini, `gemini-2.5-flash`)
  - DeepSeek Chat (deepseek, `deepseek-chat`)

### 2. RPC Functions

#### `get_available_models_for_user(p_user_id uuid)`
Returns all models with a boolean flag indicating user access.
- Returns: Array of models with `has_access` field
- Access granted if: `is_default_access = true` OR user exists in `user_model_access`

#### `check_model_access(p_user_id uuid, p_model_id text)`
Checks if a user has access to a specific model by its text ID.
- Returns: boolean
- Used by proxy to validate requests before forwarding to AI providers

#### `set_user_model_permission(p_user_id uuid, p_model_id uuid, p_has_access boolean)`
Grants or revokes model access for a user.
- If `p_has_access = true`: Inserts record into `user_model_access`
- If `p_has_access = false`: Deletes record from `user_model_access`
- Uses ON CONFLICT to handle duplicate inserts safely

### 3. Proxy Server Integration

**File:** `proxy/src/index.ts`

Added model access validation in the `/api/v1/chat` endpoint before forwarding to AI providers.

### 4. Frontend Implementation

#### API Layer (`src/entities/models/api/models-api.ts`)
- `getModelsWithAccess(userId)`: Fetches all models with access information
- `setModelPermission(userId, modelId, hasAccess)`: Updates user access

#### Admin Page (`src/pages/admin/index.tsx`)
**Fixed React Hooks Violation:**
- Moved all `useQuery` calls to component level (no hooks inside render functions)
- Fetches all user model accesses once using `Promise.all()`
- Creates a lookup map for O(1) access in render functions
- Displays model access as toggle switches (disabled for default access models)

#### Chat Integration
- Chat store fetches available models on user change
- Model selector filters to show only available models
- Models grouped by provider for better UX

### 5. Files Modified/Created

#### New Files
- `src/entities/models/api/models-api.ts`
- `supabase/migrations/20251027093816_create_model_access_tables.sql`
- `supabase/migrations/20251027093835_create_model_access_functions.sql`

#### Modified Files
- `src/pages/admin/index.tsx`
- `src/entities/chat/model/chat-store.ts`
- `src/pages/chat/index.tsx`
- `src/features/model-selector/index.tsx`
- `src/features/chat-input/index.tsx`
- `proxy/src/index.ts`

## Testing Checklist

- [x] Create migration for models and user_model_access tables
- [x] Create RPC functions for access control
- [x] Integrate model access check in proxy
- [x] Update admin page with model toggle switches
- [x] Update chat to fetch available models
- [x] Update model selector to filter available models
- [x] Fix React Hooks violation in admin page
- [x] Build project successfully

## Access Control Flow

1. User logs in → Chat page loads
2. Chat page → Calls `fetchAvailableModels(user.id)`
3. Frontend → Calls `getModelsWithAccess()` RPC
4. Database → Returns all models with `has_access` flags
5. Chat store → Updates `availableModels` state
6. Model selector → Renders only available models
7. User sends message → Proxy receives request
8. Proxy → Calls `check_model_access()` RPC
9. Proxy → Rejects if no access, forwards if allowed
10. Proxy → Logs usage to `usage_logs`

## Security Notes

- Model access decisions are made server-side (proxy)
- Default access models cannot be revoked (switches disabled)
- RPC functions have appropriate GRANT permissions
- JWT validation required before any model access check
