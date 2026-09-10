import { Response } from 'express';
import { AuthenticatedRequest } from '../types';
import { TenantDbService } from '../services/tenantDbService';
export declare class VisitorController {
    private tenantDbService;
    constructor(tenantDbService: TenantDbService);
    /**
     * GET /visitors
     * Fetch visitor logs for tenant society
     */
    getVisitors: (req: AuthenticatedRequest, res: Response) => Promise<void>;
    /**
     * POST /visitors
     * Create new visitor registration
     */
    createVisitor: (req: AuthenticatedRequest, res: Response) => Promise<void>;
    /**
     * PUT /visitors/:visitorId/status
     * Update visitor status (entered / exited)
     */
    updateVisitorStatus: (req: AuthenticatedRequest, res: Response) => Promise<void>;
}
//# sourceMappingURL=visitorController.d.ts.map