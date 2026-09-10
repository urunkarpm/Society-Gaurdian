import { Response, NextFunction } from 'express';
import * as admin from 'firebase-admin';
import { AuthenticatedRequest } from '../types';

export const authMiddleware = (adminAuth?: admin.auth.Auth) => {
  const auth = adminAuth || admin.auth();

  return async (req: AuthenticatedRequest, res: Response, next: NextFunction): Promise<void> => {
    try {
      const authHeader = req.headers.authorization;
      if (!authHeader || !authHeader.startsWith('Bearer ')) {
        res.status(401).json({ error: 'Unauthorized: Missing or invalid Authorization header' });
        return;
      }

      const idToken = authHeader.split('Bearer ')[1];
      if (!idToken) {
        res.status(401).json({ error: 'Unauthorized: Bearer token empty' });
        return;
      }

      const decodedToken = await auth.verifyIdToken(idToken);

      req.user = {
        uid: decodedToken.uid,
        email: decodedToken.email,
        name: decodedToken.name || (decodedToken as Record<string, unknown>).name as string | undefined,
        photoUrl: decodedToken.picture,
      };

      next();
    } catch (error) {
      console.error('Master Auth verification failed:', error);
      res.status(401).json({ error: 'Unauthorized: Invalid Auth Token' });
    }
  };
};
