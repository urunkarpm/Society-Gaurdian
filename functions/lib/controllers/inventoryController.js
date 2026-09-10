"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.InventoryController = void 0;
class InventoryController {
    constructor(tenantDbService) {
        /**
         * GET /inventory
         * List inventory items for society
         */
        this.getInventoryItems = async (req, res) => {
            try {
                if (!req.tenant) {
                    res.status(400).json({ error: 'Tenant context required' });
                    return;
                }
                const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'inventory_items');
                const snapshot = await collection.get();
                const items = snapshot.docs.map(doc => (Object.assign({ id: doc.id }, doc.data())));
                res.json({ societyId: req.tenant.societyId, items });
            }
            catch (error) {
                console.error('Error fetching inventory items:', error);
                res.status(500).json({ error: 'Failed to fetch inventory items' });
            }
        };
        /**
         * POST /inventory/transaction
         * Record inventory transaction (addition/consumption with evidence)
         */
        this.addInventoryTransaction = async (req, res) => {
            try {
                if (!req.tenant || !req.user) {
                    res.status(400).json({ error: 'Tenant context required' });
                    return;
                }
                const { itemId, quantityChange, reason, evidencePhotos } = req.body;
                if (!itemId || quantityChange === undefined) {
                    res.status(400).json({ error: 'itemId and quantityChange are required' });
                    return;
                }
                const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'inventory_transactions');
                const now = new Date().toISOString();
                const txRecord = {
                    itemId,
                    quantityChange: Number(quantityChange),
                    reason: reason || '',
                    evidencePhotos: evidencePhotos || [],
                    performedBy: req.user.uid,
                    timestamp: now,
                };
                const docRef = await collection.add(txRecord);
                res.status(201).json(Object.assign({ id: docRef.id }, txRecord));
            }
            catch (error) {
                console.error('Error adding inventory transaction:', error);
                res.status(500).json({ error: 'Failed to record inventory transaction' });
            }
        };
        this.tenantDbService = tenantDbService;
    }
}
exports.InventoryController = InventoryController;
//# sourceMappingURL=inventoryController.js.map