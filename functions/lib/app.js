"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.createApp = createApp;
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const masterService_1 = require("./services/masterService");
const tenantDbService_1 = require("./services/tenantDbService");
const authMiddleware_1 = require("./middleware/authMiddleware");
const tenantMiddleware_1 = require("./middleware/tenantMiddleware");
const authController_1 = require("./controllers/authController");
const tenantController_1 = require("./controllers/tenantController");
const visitorController_1 = require("./controllers/visitorController");
const residentController_1 = require("./controllers/residentController");
const maintenanceController_1 = require("./controllers/maintenanceController");
const inventoryController_1 = require("./controllers/inventoryController");
function createApp(masterServiceOverride, tenantDbServiceOverride, adminAuthOverride) {
    const app = (0, express_1.default)();
    app.use((0, cors_1.default)({ origin: true }));
    app.use(express_1.default.json());
    const masterService = masterServiceOverride || new masterService_1.MasterService();
    const tenantDbService = tenantDbServiceOverride || new tenantDbService_1.TenantDbService();
    const authController = new authController_1.AuthController(masterService);
    const tenantController = new tenantController_1.TenantController();
    const visitorController = new visitorController_1.VisitorController(tenantDbService);
    const residentController = new residentController_1.ResidentController(tenantDbService);
    const maintenanceController = new maintenanceController_1.MaintenanceController(tenantDbService);
    const inventoryController = new inventoryController_1.InventoryController(tenantDbService);
    // Healthcheck endpoint
    app.get('/health', (req, res) => {
        res.json({ status: 'ok', service: 'Society Guardian Tenant Router API', timestamp: new Date().toISOString() });
    });
    // Protected Master Auth Middleware
    const auth = (0, authMiddleware_1.authMiddleware)(adminAuthOverride);
    app.use(auth);
    // Auth & Master User Endpoints
    app.get('/auth/me', authController.getProfile);
    app.get('/auth/memberships', authController.getMemberships);
    // Tenant Router Middleware for operational tenant routes
    const tenantRouter = (0, tenantMiddleware_1.tenantMiddleware)(masterService);
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
    app.put('/verifications/:id/review', (0, tenantMiddleware_1.requireRoles)('ADMIN', 'COMMITTEE_MEMBER', 'OWNER'), residentController.reviewVerification);
    // Maintenance & Payment Routes
    app.get('/maintenance', maintenanceController.getMaintenanceBills);
    app.post('/maintenance/pay', maintenanceController.recordPayment);
    // Inventory Management Routes
    app.get('/inventory', inventoryController.getInventoryItems);
    app.post('/inventory/transaction', (0, tenantMiddleware_1.requireRoles)('ADMIN', 'COMMITTEE_MEMBER', 'OWNER'), inventoryController.addInventoryTransaction);
    return app;
}
//# sourceMappingURL=app.js.map