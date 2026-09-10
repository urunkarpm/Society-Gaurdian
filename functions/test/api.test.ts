import request from 'supertest';
import express from 'express';
import { createApp } from '../src/app';
import { MasterService } from '../src/services/masterService';
import { TenantDbService } from '../src/services/tenantDbService';
import { MasterUser, SocietyMembership, TenantRegistryEntry } from '../src/types';

describe('API Backend - Master Auth & Tenant Router Tests', () => {
  let app: express.Express;
  let mockMasterService: jest.Mocked<MasterService>;
  let mockTenantDbService: jest.Mocked<TenantDbService>;
  let mockAdminAuth: any;

  const mockUser: MasterUser = {
    uid: 'abc123',
    email: 'prasenjeet@example.com',
    name: 'Prasenjeet',
  };

  const mockMembership: SocietyMembership = {
    societyId: 'SOC001',
    role: 'RESIDENT',
    status: 'ACTIVE',
    flatNumber: 'A-302',
  };

  const mockAdminMembership: SocietyMembership = {
    societyId: 'SOC001',
    role: 'ADMIN',
    status: 'ACTIVE',
    flatNumber: 'A-101',
  };

  const mockTenantRegistry: TenantRegistryEntry = {
    societyId: 'SOC001',
    name: 'Green Valley Society',
    projectId: 'society-green-valley-prod',
    connectionMetadata: {
      projectId: 'society-green-valley-prod',
      region: 'us-central1',
    },
    tenantConfig: {
      allowGuestRegistration: true,
      requireVerification: true,
      maintenanceCycle: 'MONTHLY',
      timezone: 'UTC',
    },
    featureFlags: {
      inventoryManagement: true,
      visitorQrScanning: true,
    },
    platformVersion: '1.0.0',
    migrationStatus: 'COMPLETED',
    status: 'ACTIVE',
  };

  beforeEach(() => {
    mockAdminAuth = {
      verifyIdToken: jest.fn().mockImplementation((token: string) => {
        if (token === 'valid_token') {
          return Promise.resolve({
            uid: 'abc123',
            email: 'prasenjeet@example.com',
            name: 'Prasenjeet',
          });
        }
        return Promise.reject(new Error('Invalid token'));
      }),
    };

    mockMasterService = {
      getUserProfile: jest.fn().mockResolvedValue(mockUser),
      getUserMemberships: jest.fn().mockResolvedValue([mockMembership]),
      getUserMembershipForSociety: jest.fn().mockImplementation((uid, socId) => {
        if (socId === 'SOC001') {
          return Promise.resolve(mockMembership);
        }
        return Promise.resolve(null);
      }),
      getTenantRegistry: jest.fn().mockImplementation((socId) => {
        if (socId === 'SOC001') {
          return Promise.resolve(mockTenantRegistry);
        }
        return Promise.resolve(null);
      }),
    } as unknown as jest.Mocked<MasterService>;

    const mockCollectionRef = {
      get: jest.fn().mockResolvedValue({
        docs: [
          {
            id: 'doc_1',
            data: () => ({ name: 'Test Doc', status: 'pending', createdAt: '2026-01-01' }),
          },
        ],
        empty: false,
      }),
      orderBy: jest.fn().mockReturnThis(),
      limit: jest.fn().mockReturnThis(),
      where: jest.fn().mockReturnThis(),
      add: jest.fn().mockResolvedValue({ id: 'new_doc_id' }),
      doc: jest.fn().mockReturnValue({
        update: jest.fn().mockResolvedValue({}),
      }),
    };

    mockTenantDbService = {
      getTenantFirestore: jest.fn(),
      getTenantCollection: jest.fn().mockReturnValue(mockCollectionRef),
    } as unknown as jest.Mocked<TenantDbService>;

    app = createApp(mockMasterService, mockTenantDbService, mockAdminAuth);
  });

  describe('Healthcheck Endpoint', () => {
    it('GET /health returns 200 ok', async () => {
      const res = await request(app).get('/health');
      expect(res.status).toBe(200);
      expect(res.body.status).toBe('ok');
    });
  });

  describe('Master Auth Middleware', () => {
    it('returns 401 when Authorization header is missing', async () => {
      const res = await request(app).get('/auth/me');
      expect(res.status).toBe(401);
      expect(res.body.error).toMatch(/Missing or invalid Authorization/i);
    });

    it('returns 401 when Bearer token is invalid', async () => {
      const res = await request(app)
        .get('/auth/me')
        .set('Authorization', 'Bearer invalid_token');
      expect(res.status).toBe(401);
      expect(res.body.error).toMatch(/Invalid Auth Token/i);
    });

    it('GET /auth/me returns master user profile when token is valid', async () => {
      const res = await request(app)
        .get('/auth/me')
        .set('Authorization', 'Bearer valid_token');
      expect(res.status).toBe(200);
      expect(res.body.uid).toBe('abc123');
      expect(res.body.name).toBe('Prasenjeet');
    });

    it('GET /auth/memberships returns society memberships', async () => {
      const res = await request(app)
        .get('/auth/memberships')
        .set('Authorization', 'Bearer valid_token');
      expect(res.status).toBe(200);
      expect(res.body.uid).toBe('abc123');
      expect(res.body.memberships).toHaveLength(1);
      expect(res.body.memberships[0].societyId).toBe('SOC001');
    });
  });

  describe('Tenant Router Middleware', () => {
    it('returns 400 when x-society-id header is missing', async () => {
      const res = await request(app)
        .get('/tenant/config')
        .set('Authorization', 'Bearer valid_token');
      expect(res.status).toBe(400);
      expect(res.body.error).toMatch(/Missing x-society-id/i);
    });

    it('returns 404 when tenant registry entry does not exist', async () => {
      const res = await request(app)
        .get('/tenant/config')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC_UNKNOWN');
      expect(res.status).toBe(404);
      expect(res.body.error).toMatch(/Tenant society not found/i);
    });

    it('returns 403 when user is not a member of the requested society', async () => {
      mockMasterService.getUserMembershipForSociety.mockResolvedValueOnce(null);
      const res = await request(app)
        .get('/tenant/config')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001');
      expect(res.status).toBe(403);
      expect(res.body.error).toMatch(/not a member/i);
    });

    it('GET /tenant/config returns tenant config and user role', async () => {
      const res = await request(app)
        .get('/tenant/config')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001');
      expect(res.status).toBe(200);
      expect(res.body.societyId).toBe('SOC001');
      expect(res.body.name).toBe('Green Valley Society');
      expect(res.body.userRole).toBe('RESIDENT');
    });

    it('GET /tenant/features returns feature flags', async () => {
      const res = await request(app)
        .get('/tenant/features')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001');
      expect(res.status).toBe(200);
      expect(res.body.featureFlags.visitorQrScanning).toBe(true);
    });
  });

  describe('Tenant Operational Endpoints & RBAC', () => {
    it('GET /visitors lists visitors for society', async () => {
      const res = await request(app)
        .get('/visitors')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001');
      expect(res.status).toBe(200);
      expect(res.body.visitors).toHaveLength(1);
    });

    it('POST /visitors registers new visitor', async () => {
      const res = await request(app)
        .post('/visitors')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001')
        .send({
          visitorName: 'Delivery Agent',
          hostFlatId: 'A-302',
          purpose: 'Delivery',
        });
      expect(res.status).toBe(201);
      expect(res.body.id).toBe('new_doc_id');
      expect(res.body.visitorName).toBe('Delivery Agent');
    });

    it('PUT /visitors/:visitorId/status updates visitor entry status', async () => {
      const res = await request(app)
        .put('/visitors/visitor_123/status')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001')
        .send({ status: 'entered' });
      expect(res.status).toBe(200);
      expect(res.body.status).toBe('entered');
    });

    it('RESIDENT role cannot review verification (403 Forbidden)', async () => {
      const res = await request(app)
        .put('/verifications/verif_1/review')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001')
        .send({ status: 'APPROVED' });
      expect(res.status).toBe(403);
      expect(res.body.error).toMatch(/Forbidden: Role 'RESIDENT' is not allowed/i);
    });

    it('ADMIN role can review verification', async () => {
      mockMasterService.getUserMembershipForSociety.mockResolvedValueOnce(mockAdminMembership);
      const res = await request(app)
        .put('/verifications/verif_1/review')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001')
        .send({ status: 'APPROVED' });
      expect(res.status).toBe(200);
      expect(res.body.status).toBe('APPROVED');
    });

    it('RESIDENT role cannot add inventory transaction (403 Forbidden)', async () => {
      const res = await request(app)
        .post('/inventory/transaction')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001')
        .send({ itemId: 'item_1', quantityChange: 5 });
      expect(res.status).toBe(403);
    });

    it('ADMIN role can add inventory transaction', async () => {
      mockMasterService.getUserMembershipForSociety.mockResolvedValueOnce(mockAdminMembership);
      const res = await request(app)
        .post('/inventory/transaction')
        .set('Authorization', 'Bearer valid_token')
        .set('x-society-id', 'SOC001')
        .send({ itemId: 'item_1', quantityChange: 5, reason: 'Restock' });
      expect(res.status).toBe(201);
      expect(res.body.id).toBe('new_doc_id');
      expect(res.body.quantityChange).toBe(5);
    });
  });
});
