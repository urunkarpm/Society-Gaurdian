import { Response } from 'express';
import { AuthenticatedRequest } from '../types';
import { TenantDbService } from '../services/tenantDbService';
export declare class InventoryController {
    private tenantDbService;
    constructor(tenantDbService: TenantDbService);
    /**
     * GET /inventory
     * List inventory items for society
     */
    getInventoryItems: (req: AuthenticatedRequest, res: Response) => Promise<void>;
    /**
     * POST /inventory/transaction
     * Record inventory transaction (addition/consumption with evidence)
     */
    addInventoryTransaction: (req: AuthenticatedRequest, res: Response) => Promise<void>;
}
//# sourceMappingURL=inventoryController.d.ts.map