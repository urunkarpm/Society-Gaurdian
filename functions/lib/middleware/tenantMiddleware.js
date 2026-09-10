"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.requireRoles = exports.tenantMiddleware = void 0;
const tenantMiddleware = (masterService) => {
    return async (req, res, next) => {
        try {
            if (!req.user) {
                res.status(401).json({ error: 'Unauthorized: Master User not authenticated' });
                return;
            }
            const societyId = (req.headers['x-society-id'] ||
                req.query.societyId ||
                (req.body && req.body.societyId));
            if (!societyId) {
                res.status(400).json({ error: 'Bad Request: Missing x-society-id header or societyId parameter' });
                return;
            }
            // Look up tenant registry entry in Master Firestore
            const tenantRegistry = await masterService.getTenantRegistry(societyId);
            if (!tenantRegistry) {
                res.status(404).json({ error: `Tenant society not found: ${societyId}` });
                return;
            }
            if (tenantRegistry.status !== 'ACTIVE') {
                res.status(403).json({ error: `Society tenant status is ${tenantRegistry.status}` });
                return;
            }
            // Check user membership for this society
            const membership = await masterService.getUserMembershipForSociety(req.user.uid, societyId);
            if (!membership) {
                res.status(403).json({ error: `User ${req.user.uid} is not a member of society ${societyId}` });
                return;
            }
            if (membership.status !== 'ACTIVE') {
                res.status(403).json({ error: `Membership status is ${membership.status}` });
                return;
            }
            // Attach tenant context to request
            req.tenant = {
                societyId: societyId,
                tenantConfig: tenantRegistry,
                membership: membership,
            };
            next();
        }
        catch (error) {
            console.error('Tenant Router Middleware error:', error);
            res.status(500).json({ error: 'Internal Server Error in Tenant Router' });
        }
    };
};
exports.tenantMiddleware = tenantMiddleware;
/**
 * Middleware helper for Role-Based Access Control (RBAC)
 */
const requireRoles = (...allowedRoles) => {
    return (req, res, next) => {
        if (!req.tenant || !req.tenant.membership) {
            res.status(403).json({ error: 'Forbidden: Missing tenant membership context' });
            return;
        }
        const userRole = req.tenant.membership.role;
        if (!allowedRoles.includes(userRole)) {
            res.status(403).json({
                error: `Forbidden: Role '${userRole}' is not allowed for this endpoint. Required: [${allowedRoles.join(', ')}]`,
            });
            return;
        }
        next();
    };
};
exports.requireRoles = requireRoles;
//# sourceMappingURL=tenantMiddleware.js.map