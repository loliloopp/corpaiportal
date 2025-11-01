import pino from 'pino';
import { User } from '@supabase/supabase-js';

declare global {
  namespace Express {
    export interface Request {
      log: pino.Logger;
      user?: User;
      profile?: {
        id: string;
        role: string;
        [key: string]: any;
      };
    }
  }
}
