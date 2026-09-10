"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.VisitorController = void 0;
class VisitorController {
    constructor(tenantDbService) {
        /**
         * GET /visitors
         * Fetch visitor logs for tenant society
         */
        this.getVisitors = async (req, res) => {
            try {
                if (!req.tenant) {
                    res.status(400).json({ error: 'Tenant context required' });
                    return;
                }
                const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'visitors');
                let query = collection.orderBy('createdAt', 'desc').limit(50);
                if (req.query.status) {
                    query = collection.where('status', '==', req.query.status).orderBy('createdAt', 'desc').limit(50);
                }
                const snapshot = await query.get();
                const visitors = snapshot.docs.map(doc => (Object.assign({ id: doc.id }, doc.data())));
                res.json({ societyId: req.tenant.societyId, visitors });
            }
            catch (error) {
                console.error('Error fetching visitors:', error);
                res.status(500).json({ error: 'Failed to fetch visitors' });
            }
        };
        /**
         * POST /visitors
         * Create new visitor registration
         */
        this.createVisitor = async (req, res) => {
            try {
                if (!req.tenant || !req.user) {
                    res.status(400).json({ error: 'Tenant context required' });
                    return;
                }
                const { visitorName, phone, purpose, hostFlatId, gateName, vehicleNumber, visitorType, photoUrl } = req.body;
                if (!visitorName || !hostFlatId) {
                    res.status(400).json({ error: 'visitorName and hostFlatId are required' });
                    return;
                }
                const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'visitors');
                const now = new Date().toISOString();
                const visitorData = {
                    visitorName,
                    phone: phone || '',
                    purpose: purpose || 'Guest',
                    hostFlatId,
                    gateName: gateName || 'Main Gate',
                    vehicleNumber: vehicleNumber || '',
                    visitorType: visitorType || 'Guest',
                    photoUrl: photoUrl || '',
                    status: 'pending',
                    createdBy: req.user.uid,
                    createdAt: now,
                    updatedAt: now,
                };
                const docRef = await collection.add(visitorData);
                res.status(201).json(Object.assign({ id: docRef.id, societyId: req.tenant.societyId }, visitorData));
            }
            catch (error) {
                console.error('Error creating visitor:', error);
                res.status(500).json({ error: 'Failed to create visitor' });
            }
        };
        /**
         * PUT /visitors/:visitorId/status
         * Update visitor status (entered / exited)
         */
        this.updateVisitorStatus = async (req, res) => {
            try {
                if (!req.tenant) {
                    res.status(400).json({ error: 'Tenant context required' });
                    return;
                }
                const { visitorId } = req.params;
                const visitorIdStr = Array.isArray(visitorId) ? visitorId[0] : visitorId;
                const { status } = req.body;
                if (!['pending', 'entered', 'exited', 'denied'].includes(status)) {
                    res.status(400).json({ error: 'Invalid visitor status' });
                    return;
                }
                const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'visitors');
                const now = new Date().toISOString();
                const updateData = {
                    status,
                    updatedAt: now,
                };
                if (status === 'entered') {
                    updateData.entryTime = now;
                }
                else if (status === 'exited') {
                    updateData.exitTime = now;
                }
                await collection.doc(visitorIdStr).update(updateData);
                res.json({ id: visitorIdStr, status, updatedAt: now });
            }
            catch (error) {
                console.error('Error updating visitor status:', error);
                res.status(500).json({ error: 'Failed to update visitor status' });
            }
        };
        this.tenantDbService = tenantDbService;
    }
}
exports.VisitorController = VisitorController;
//# sourceMappingURL=visitorController.js.map