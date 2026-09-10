import { Request } from 'express';

export interface MasterUser {
  uid: string;
  email?: string;
  name?: string;
  phone?: string;
  photoUrl?: string;
  createdAt?: string;
}

export interface SocietyMembership {
  societyId: string;
  role: 'RESIDENT' | 'COMMITTEE_MEMBER' | 'ADMIN' | 'SECURITY' | 'VENDOR' | 'OWNER';
  status: 'ACTIVE' | 'PENDING' | 'INACTIVE';
  flatNumber?: string;
  buildingId?: string;
  joinedAt?: string;
}

export interface TenantRegistryEntry {
  societyId: string;
  name: string;
  projectId: string;
  connectionMetadata: {
    projectId: string;
    region?: string;
    databaseId?: string;
  };
  tenantConfig: {
    allowGuestRegistration: boolean;
    requireVerification: boolean;
    maintenanceCycle: string;
    timezone: string;
  };
  featureFlags: Record<string, boolean>;
  platformVersion: string;
  migrationStatus: 'COMPLETED' | 'PENDING' | 'IN_PROGRESS';
  status: 'ACTIVE' | 'SUSPENDED';
}

export interface TenantContext {
  societyId: string;
  tenantConfig: TenantRegistryEntry;
  membership: SocietyMembership;
}

export interface AuthenticatedRequest extends Request {
  user?: MasterUser;
  tenant?: TenantContext;
}
