import express from 'express';
import cors from 'cors';
import * as admin from 'firebase-admin';
import { MasterService } from './services/masterService';
import { TenantDbService } from './services/tenantDbService';
import { authMiddleware } from './middleware/authMiddleware';
import { tenantMiddleware, requireRoles } from './middleware/tenantMiddleware';
import { AuthController } from './controllers/authController';
import { TenantController } from './controllers/tenantController';
import { VisitorController } from './controllers/visitorController';
import { ResidentController } from './controllers/residentController';
import { MaintenanceController } from './controllers/maintenanceController';
import { InventoryController } from './controllers/inventoryController';

export function createApp(
  masterServiceOverride?: MasterService,
  tenantDbServiceOverride?: TenantDbService,
  adminAuthOverride?: admin.auth.Auth
): express.Express {
  const app = express();

  app.use(cors({ origin: true }));
  app.use(express.json());

  const masterService = masterServiceOverride || new MasterService();
  const tenantDbService = tenantDbServiceOverride || new TenantDbService();

  const authController = new AuthController(masterService);
  const tenantController = new TenantController();
  const visitorController = new VisitorController(tenantDbService);
  const residentController = new ResidentController(tenantDbService);
  const maintenanceController = new MaintenanceController(tenantDbService);
  const inventoryController = new InventoryController(tenantDbService);

  // Healthcheck endpoint
  app.get('/health', (req, res) => {
    res.json({ status: 'ok', service: 'Society Guardian Tenant Router API', timestamp: new Date().toISOString() });
  });

  // Protected Master Auth Middleware
  const auth = authMiddleware(adminAuthOverride);
  app.use(auth);

  // Auth & Master User Endpoints
  app.get('/auth/me', authController.getProfile);
  app.get('/auth/memberships', authController.getMemberships);

  // Tenant Router Middleware for operational tenant routes
  const tenantRouter = tenantMiddleware(masterService);
  app.use(tenantRouter);

  // Tenant Config & Platform Features
  app.get('/tenant/config', tenantController.getTenantConfig);
  app.get('/tenant/features', tenantController.getFeatureFlags);

  // Visitor Management Routes
  app.get('/visitors', visitorController.getVisitors);
  app.post('/visitors', visitorController.createVisitor);
  app.put('/visitors/:visitorId/status', visitorController.updateVisitorStatus);

  // Resident & Flat Routes
  app.get('/residents', residentController.getResidents);
  app.get('/flats', residentController.getFlats);
  app.post('/verifications', residentController.submitVerification);
  app.put(
    '/verifications/:id/review',
    requireRoles('ADMIN', 'COMMITTEE_MEMBER', 'OWNER'),
    residentController.reviewVerification
  );

  // Maintenance & Payment Routes
  app.get('/maintenance', maintenanceController.getMaintenanceBills);
  app.post('/maintenance/pay', maintenanceController.recordPayment);

  // Inventory Management Routes
  app.get('/inventory', inventoryController.getInventoryItems);
  app.post(
    '/inventory/transaction',
    requireRoles('ADMIN', 'COMMITTEE_MEMBER', 'OWNER'),
    inventoryController.addInventoryTransaction
  );

  return app;
}
