import { Response, NextFunction } from 'express';
import { AuthenticatedRequest } from '../types';
import { MasterService } from '../services/masterService';

export const tenantMiddleware = (masterService: MasterService) => {
  return async (req: AuthenticatedRequest, res: Response, next: NextFunction): Promise<void> => {
    try {
      if (!req.user) {
        res.status(401).json({ error: 'Unauthorized: Master User not authenticated' });
        return;
      }

      const societyId = (
        (req.headers['x-society-id'] as string) ||
        (req.query.societyId as string) ||
        (req.body && req.body.societyId as string)
      );

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
    } catch (error) {
      console.error('Tenant Router Middleware error:', error);
      res.status(500).json({ error: 'Internal Server Error in Tenant Router' });
    }
  };
};

/**
 * Middleware helper for Role-Based Access Control (RBAC)
 */
export const requireRoles = (...allowedRoles: Array<string>) => {
  return (req: AuthenticatedRequest, res: Response, next: NextFunction): void => {
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
