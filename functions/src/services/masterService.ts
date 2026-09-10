import * as admin from 'firebase-admin';
import { MasterUser, SocietyMembership, TenantRegistryEntry } from '../types';

export class MasterService {
  private db: admin.firestore.Firestore;

  constructor(db?: admin.firestore.Firestore) {
    this.db = db || admin.firestore();
  }

  /**
   * Fetch Master User details from Master Firestore
   */
  async getUserProfile(uid: string): Promise<MasterUser | null> {
    const userDoc = await this.db.collection('users').doc(uid).get();
    if (!userDoc.exists) {
      return null;
    }
    const data = userDoc.data()!;
    return {
      uid: userDoc.id,
      email: data.email,
      name: data.name,
      phone: data.phone,
      photoUrl: data.photoUrl,
      createdAt: data.createdAt ? new Date(data.createdAt.toDate?.() || data.createdAt).toISOString() : undefined,
    };
  }

  /**
   * Fetch memberships for a Master User UID
   */
  async getUserMemberships(uid: string): Promise<SocietyMembership[]> {
    // Check memberships collection under memberships/{uid}
    const membershipsDoc = await this.db.collection('memberships').doc(uid).get();
    if (membershipsDoc.exists) {
      const data = membershipsDoc.data()!;
      if (Array.isArray(data.societies)) {
        return data.societies as SocietyMembership[];
      }
    }

    // Fallback: Check subcollection memberships/{uid}/societies
    const snapshot = await this.db.collection('memberships').doc(uid).collection('societies').get();
    if (!snapshot.empty) {
      return snapshot.docs.map(doc => ({
        societyId: doc.id,
        role: doc.data().role || 'RESIDENT',
        status: doc.data().status || 'ACTIVE',
        flatNumber: doc.data().flatNumber,
        buildingId: doc.data().buildingId,
        joinedAt: doc.data().joinedAt,
      }));
    }

    // Fallback 2: Check user profile `societies` array if present
    const userDoc = await this.db.collection('users').doc(uid).get();
    if (userDoc.exists && Array.isArray(userDoc.data()?.societies)) {
      return userDoc.data()!.societies;
    }

    return [];
  }

  /**
   * Get specific society membership for user
   */
  async getUserMembershipForSociety(uid: string, societyId: string): Promise<SocietyMembership | null> {
    const memberships = await this.getUserMemberships(uid);
    const found = memberships.find(m => m.societyId === societyId);
    return found || null;
  }

  /**
   * Fetch tenant registry entry from Master Firestore
   */
  async getTenantRegistry(societyId: string): Promise<TenantRegistryEntry | null> {
    // Check 'tenants' collection or 'societies' collection in Master Firestore
    let tenantDoc = await this.db.collection('tenants').doc(societyId).get();
    if (!tenantDoc.exists) {
      tenantDoc = await this.db.collection('societies').doc(societyId).get();
    }

    if (!tenantDoc.exists) {
      return null;
    }

    const data = tenantDoc.data()!;
    return {
      societyId: tenantDoc.id,
      name: data.name || societyId,
      projectId: data.projectId || data.connectionMetadata?.projectId || `society-${societyId.toLowerCase()}`,
      connectionMetadata: {
        projectId: data.connectionMetadata?.projectId || data.projectId || `society-${societyId.toLowerCase()}`,
        region: data.connectionMetadata?.region || 'us-central1',
        databaseId: data.connectionMetadata?.databaseId,
      },
      tenantConfig: {
        allowGuestRegistration: data.tenantConfig?.allowGuestRegistration ?? true,
        requireVerification: data.tenantConfig?.requireVerification ?? true,
        maintenanceCycle: data.tenantConfig?.maintenanceCycle || 'MONTHLY',
        timezone: data.tenantConfig?.timezone || 'UTC',
      },
      featureFlags: data.featureFlags || {
        inventoryManagement: true,
        visitorQrScanning: true,
        onlinePayments: true,
      },
      platformVersion: data.platformVersion || '1.0.0',
      migrationStatus: data.migrationStatus || 'COMPLETED',
      status: data.status || 'ACTIVE',
    };
  }
}
