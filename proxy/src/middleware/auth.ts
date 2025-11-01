import { Request, Response, NextFunction } from 'express';
import { SupabaseClient } from '@supabase/supabase-js';

export const createAuthMiddleware = (supabase: SupabaseClient) => {
  return async (req: Request, res: Response, next: NextFunction) => {
    const token = req.headers.authorization?.split(' ')[1];

    if (!token) {
      req.log.warn('Authentication failed: No token provided.');
      return res.status(401).json({ error: 'Authentication token is missing' });
    }

    try {
      const { data: { user }, error } = await supabase.auth.getUser(token);

      if (error || !user) {
        req.log.warn({ error }, 'Authentication failed: Invalid token.');
        return res.status(401).json({ error: 'Invalid authentication token' });
      }

      const { data: profile, error: profileError } = await supabase
        .from('user_profiles')
        .select('*')
        .eq('id', user.id)
        .single();

      if (profileError || !profile) {
        req.log.error({ userId: user.id, error: profileError }, 'Failed to fetch user profile.');
        return res.status(500).json({ error: 'Failed to fetch user profile' });
      }

      req.user = user;
      req.profile = profile;
      req.log.info({ userId: user.id }, 'Authentication successful.');
      next();
    } catch (error) {
      req.log.error({ error }, 'An unexpected error occurred during authentication.');
      return res.status(500).json({ error: 'Internal server error' });
    }
  };
};

export const requireAdmin = (req: Request, res: Response, next: NextFunction) => {
  if (!req.profile || req.profile.role !== 'admin') {
    req.log.warn({ userId: req.user?.id }, 'Admin access denied.');
    return res.status(403).json({ error: 'Admin access required' });
  }
  next();
};
