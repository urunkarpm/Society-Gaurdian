import { Response } from 'express';
import { AuthenticatedRequest } from '../types';
import { MasterService } from '../services/masterService';
export declare class AuthController {
    private masterService;
    constructor(masterService: MasterService);
    /**
     * GET /auth/me
     * Returns current Master User identity profile
     */
    getProfile: (req: AuthenticatedRequest, res: Response) => Promise<void>;
    /**
     * GET /auth/memberships
     * Returns list of society memberships for the current user
     */
    getMemberships: (req: AuthenticatedRequest, res: Response) => Promise<void>;
}
//# sourceMappingURL=authController.d.ts.map