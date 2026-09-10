"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.MaintenanceController = void 0;
class MaintenanceController {
    constructor(tenantDbService) {
        /**
         * GET /maintenance
         * Fetch maintenance bills/invoices for flat/society
         */
        this.getMaintenanceBills = async (req, res) => {
            try {
                if (!req.tenant) {
                    res.status(400).json({ error: 'Tenant context required' });
                    return;
                }
                const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'invoices');
                let query = collection.orderBy('dueDate', 'desc').limit(20);
                if (req.query.flatId) {
                    query = collection.where('flatId', '==', req.query.flatId).limit(20);
                }
                const snapshot = await query.get();
                const invoices = snapshot.docs.map(doc => (Object.assign({ id: doc.id }, doc.data())));
                res.json({ societyId: req.tenant.societyId, invoices });
            }
            catch (error) {
                console.error('Error fetching maintenance bills:', error);
                res.status(500).json({ error: 'Failed to fetch maintenance bills' });
            }
        };
        /**
         * POST /maintenance/pay
         * Record maintenance bill payment
         */
        this.recordPayment = async (req, res) => {
            try {
                if (!req.tenant || !req.user) {
                    res.status(400).json({ error: 'Tenant context required' });
                    return;
                }
                const { invoiceId, amount, paymentMethod, transactionId } = req.body;
                if (!invoiceId || !amount) {
                    res.status(400).json({ error: 'invoiceId and amount are required' });
                    return;
                }
                const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'payments');
                const now = new Date().toISOString();
                const paymentRecord = {
                    invoiceId,
                    amount,
                    paymentMethod: paymentMethod || 'ONLINE',
                    transactionId: transactionId || `TXN_${Date.now()}`,
                    paidBy: req.user.uid,
                    status: 'SUCCESS',
                    paidAt: now,
                };
                const docRef = await collection.add(paymentRecord);
                res.status(201).json(Object.assign({ id: docRef.id }, paymentRecord));
            }
            catch (error) {
                console.error('Error recording payment:', error);
                res.status(500).json({ error: 'Failed to record payment' });
            }
        };
        this.tenantDbService = tenantDbService;
    }
}
exports.MaintenanceController = MaintenanceController;
//# sourceMappingURL=maintenanceController.js.map