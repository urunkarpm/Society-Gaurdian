import { Response } from 'express';
import { AuthenticatedRequest } from '../types';
import { TenantDbService } from '../services/tenantDbService';
export declare class ResidentController {
    private tenantDbService;
    constructor(tenantDbService: TenantDbService);
    /**
     * GET /residents
     * Fetch residents list for tenant society
     */
    getResidents: (req: AuthenticatedRequest, res: Response) => Promise<void>;
    /**
     * GET /flats
     * Fetch flats list for tenant society
     */
    getFlats: (req: AuthenticatedRequest, res: Response) => Promise<void>;
    /**
     * POST /verifications
     * Submit residence verification request
     */
    submitVerification: (req: AuthenticatedRequest, res: Response) => Promise<void>;
    /**
     * PUT /verifications/:id/review
     * Review (approve/reject) residence verification (Admin only)
     */
    reviewVerification: (req: AuthenticatedRequest, res: Response) => Promise<void>;
}
//# sourceMappingURL=residentController.d.ts.map