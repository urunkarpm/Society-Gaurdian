import { Response } from 'express';
import { AuthenticatedRequest } from '../types';
import { TenantDbService } from '../services/tenantDbService';
export declare class MaintenanceController {
    private tenantDbService;
    constructor(tenantDbService: TenantDbService);
    /**
     * GET /maintenance
     * Fetch maintenance bills/invoices for flat/society
     */
    getMaintenanceBills: (req: AuthenticatedRequest, res: Response) => Promise<void>;
    /**
     * POST /maintenance/pay
     * Record maintenance bill payment
     */
    recordPayment: (req: AuthenticatedRequest, res: Response) => Promise<void>;
}
//# sourceMappingURL=maintenanceController.d.ts.map