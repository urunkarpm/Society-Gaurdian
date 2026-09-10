import { Response } from 'express';
import { AuthenticatedRequest } from '../types';
import { TenantDbService } from '../services/tenantDbService';

export class InventoryController {
  private tenantDbService: TenantDbService;

  constructor(tenantDbService: TenantDbService) {
    this.tenantDbService = tenantDbService;
  }

  /**
   * GET /inventory
   * List inventory items for society
   */
  getInventoryItems = async (req: AuthenticatedRequest, res: Response): Promise<void> => {
    try {
      if (!req.tenant) {
        res.status(400).json({ error: 'Tenant context required' });
        return;
      }

      const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'inventory_items');
      const snapshot = await collection.get();

      const items = snapshot.docs.map(doc => ({
        id: doc.id,
        ...doc.data(),
      }));

      res.json({ societyId: req.tenant.societyId, items });
    } catch (error) {
      console.error('Error fetching inventory items:', error);
      res.status(500).json({ error: 'Failed to fetch inventory items' });
    }
  };

  /**
   * POST /inventory/transaction
   * Record inventory transaction (addition/consumption with evidence)
   */
  addInventoryTransaction = async (req: AuthenticatedRequest, res: Response): Promise<void> => {
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

      res.status(201).json({ id: docRef.id, ...txRecord });
    } catch (error) {
      console.error('Error adding inventory transaction:', error);
      res.status(500).json({ error: 'Failed to record inventory transaction' });
    }
  };
}
