import { Response } from 'express';
import { AuthenticatedRequest } from '../types';
export declare class TenantController {
    /**
     * GET /tenant/config
     * Returns metadata, configuration, platform version, feature flags, migration status for current tenant
     */
    getTenantConfig: (req: AuthenticatedRequest, res: Response) => Promise<void>;
    /**
     * GET /tenant/features
     * Returns active feature flags for current tenant
     */
    getFeatureFlags: (req: AuthenticatedRequest, res: Response) => Promise<void>;
}
//# sourceMappingURL=tenantController.d.ts.map