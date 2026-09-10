import { Response, NextFunction } from 'express';
import { AuthenticatedRequest } from '../types';
import { MasterService } from '../services/masterService';
export declare const tenantMiddleware: (masterService: MasterService) => (req: AuthenticatedRequest, res: Response, next: NextFunction) => Promise<void>;
/**
 * Middleware helper for Role-Based Access Control (RBAC)
 */
export declare const requireRoles: (...allowedRoles: Array<string>) => (req: AuthenticatedRequest, res: Response, next: NextFunction) => void;
//# sourceMappingURL=tenantMiddleware.d.ts.map