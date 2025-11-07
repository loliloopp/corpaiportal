import { Request, Response, NextFunction } from 'express';
import { SupabaseClient } from '@supabase/supabase-js';

export function createAuthMiddleware(supabase: SupabaseClient) {
    return async function authenticateUser(req: Request, res: Response, next: NextFunction) {
        try {
            const authHeader = req.headers.authorization;
            const jwt = authHeader?.replace('Bearer ', '') || req.body?.jwt;

            if (!jwt) {
                console.warn(`[Auth] Missing JWT token for ${req.method} ${req.path}`);
                return res.status(401).json({ error: 'Missing authentication token.' });
            }

            const { data: { user }, error: userError } = await supabase.auth.getUser(jwt);
            if (userError || !user) {
                console.warn(`[Auth] Invalid JWT token: ${userError?.message}`);
                return res.status(401).json({ error: 'Invalid authentication token.' });
            }

            console.log(`[Auth] User authenticated: ${user.id} for ${req.method} ${req.path}`);

            const { data: profile, error: profileError } = await supabase
                .from('user_profiles')
                .select('role')
                .eq('id', user.id)
                .single();

            if (profileError || !profile) {
                console.error(`[Auth] Profile not found for user ${user.id}: ${profileError?.message}`);
                return res.status(403).json({ error: 'User profile not found.' });
            }

            req.user = user;
            req.profile = profile;
            next();
        } catch (error: any) {
            console.error('[Auth] Authentication error:', error);
            return res.status(500).json({ error: 'Authentication failed.' });
        }
    };
}

export function requireAdmin(req: Request, res: Response, next: NextFunction) {
    if (!req.profile || req.profile.role !== 'admin') {
        return res.status(403).json({ error: 'Admin access required.' });
    }
    next();
}
