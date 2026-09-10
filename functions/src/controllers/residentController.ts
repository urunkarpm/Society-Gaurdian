import { Response } from 'express';
import { AuthenticatedRequest } from '../types';
import { TenantDbService } from '../services/tenantDbService';

export class ResidentController {
  private tenantDbService: TenantDbService;

  constructor(tenantDbService: TenantDbService) {
    this.tenantDbService = tenantDbService;
  }

  /**
   * GET /residents
   * Fetch residents list for tenant society
   */
  getResidents = async (req: AuthenticatedRequest, res: Response): Promise<void> => {
    try {
      if (!req.tenant) {
        res.status(400).json({ error: 'Tenant context required' });
        return;
      }

      const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'residents');
      const snapshot = await collection.get();

      const residents = snapshot.docs.map(doc => ({
        id: doc.id,
        ...doc.data(),
      }));

      res.json({ societyId: req.tenant.societyId, residents });
    } catch (error) {
      console.error('Error fetching residents:', error);
      res.status(500).json({ error: 'Failed to fetch residents' });
    }
  };

  /**
   * GET /flats
   * Fetch flats list for tenant society
   */
  getFlats = async (req: AuthenticatedRequest, res: Response): Promise<void> => {
    try {
      if (!req.tenant) {
        res.status(400).json({ error: 'Tenant context required' });
        return;
      }

      const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'flats');
      const snapshot = await collection.get();

      const flats = snapshot.docs.map(doc => ({
        id: doc.id,
        ...doc.data(),
      }));

      res.json({ societyId: req.tenant.societyId, flats });
    } catch (error) {
      console.error('Error fetching flats:', error);
      res.status(500).json({ error: 'Failed to fetch flats' });
    }
  };

  /**
   * POST /verifications
   * Submit residence verification request
   */
  submitVerification = async (req: AuthenticatedRequest, res: Response): Promise<void> => {
    try {
      if (!req.tenant || !req.user) {
        res.status(400).json({ error: 'Tenant context required' });
        return;
      }

      const { flatId, buildingId, wing, flatNumber } = req.body;
      const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'residence_verifications');
      const now = new Date().toISOString();

      const verificationData = {
        uid: req.user.uid,
        userName: req.user.name || '',
        userEmail: req.user.email || '',
        flatId: flatId || `${buildingId}_${flatNumber}`,
        buildingId: buildingId || '',
        wing: wing || '',
        flatNumber: flatNumber || '',
        status: 'PENDING',
        createdAt: now,
        updatedAt: now,
      };

      const docRef = await collection.add(verificationData);

      res.status(201).json({ id: docRef.id, ...verificationData });
    } catch (error) {
      console.error('Error submitting verification:', error);
      res.status(500).json({ error: 'Failed to submit residence verification' });
    }
  };

  /**
   * PUT /verifications/:id/review
   * Review (approve/reject) residence verification (Admin only)
   */
  reviewVerification = async (req: AuthenticatedRequest, res: Response): Promise<void> => {
    try {
      if (!req.tenant || !req.user) {
        res.status(400).json({ error: 'Tenant context required' });
        return;
      }

      const { id } = req.params;
      const idStr = Array.isArray(id) ? id[0] : id;
      const { status, rejectionReason } = req.body;

      if (!['APPROVED', 'REJECTED'].includes(status)) {
        res.status(400).json({ error: 'Status must be APPROVED or REJECTED' });
        return;
      }

      const collection = this.tenantDbService.getTenantCollection(req.tenant.tenantConfig, 'residence_verifications');
      const now = new Date().toISOString();

      await collection.doc(idStr).update({
        status,
        rejectionReason: rejectionReason || '',
        reviewedBy: req.user.uid,
        updatedAt: now,
      });

      res.json({ id: idStr, status, updatedAt: now });
    } catch (error) {
      console.error('Error reviewing verification:', error);
      res.status(500).json({ error: 'Failed to review verification' });
    }
  };
}
