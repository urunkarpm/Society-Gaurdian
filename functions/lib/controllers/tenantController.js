"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.TenantController = void 0;
class TenantController {
    constructor() {
        /**
         * GET /tenant/config
         * Returns metadata, configuration, platform version, feature flags, migration status for current tenant
         */
        this.getTenantConfig = async (req, res) => {
            try {
                if (!req.tenant) {
                    res.status(400).json({ error: 'Tenant context required' });
                    return;
                }
                res.json({
                    societyId: req.tenant.societyId,
                    name: req.tenant.tenantConfig.name,
                    tenantConfig: req.tenant.tenantConfig.tenantConfig,
                    featureFlags: req.tenant.tenantConfig.featureFlags,
                    platformVersion: req.tenant.tenantConfig.platformVersion,
                    migrationStatus: req.tenant.tenantConfig.migrationStatus,
                    status: req.tenant.tenantConfig.status,
                    userRole: req.tenant.membership.role,
                });
            }
            catch (error) {
                console.error('Error fetching tenant config:', error);
                res.status(500).json({ error: 'Failed to fetch tenant config' });
            }
        };
        /**
         * GET /tenant/features
         * Returns active feature flags for current tenant
         */
        this.getFeatureFlags = async (req, res) => {
            try {
                if (!req.tenant) {
                    res.status(400).json({ error: 'Tenant context required' });
                    return;
                }
                res.json({
                    societyId: req.tenant.societyId,
                    featureFlags: req.tenant.tenantConfig.featureFlags,
                });
            }
            catch (error) {
                console.error('Error fetching feature flags:', error);
                res.status(500).json({ error: 'Failed to fetch feature flags' });
            }
        };
    }
}
exports.TenantController = TenantController;
//# sourceMappingURL=tenantController.js.map