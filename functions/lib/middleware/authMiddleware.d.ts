import { Response, NextFunction } from 'express';
import * as admin from 'firebase-admin';
import { AuthenticatedRequest } from '../types';
export declare const authMiddleware: (adminAuth?: admin.auth.Auth) => (req: AuthenticatedRequest, res: Response, next: NextFunction) => Promise<void>;
//# sourceMappingURL=authMiddleware.d.ts.map