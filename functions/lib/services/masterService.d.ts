import * as admin from 'firebase-admin';
import { MasterUser, SocietyMembership, TenantRegistryEntry } from '../types';
export declare class MasterService {
    private db;
    constructor(db?: admin.firestore.Firestore);
    /**
     * Fetch Master User details from Master Firestore
     */
    getUserProfile(uid: string): Promise<MasterUser | null>;
    /**
     * Fetch memberships for a Master User UID
     */
    getUserMemberships(uid: string): Promise<SocietyMembership[]>;
    /**
     * Get specific society membership for user
     */
    getUserMembershipForSociety(uid: string, societyId: string): Promise<SocietyMembership | null>;
    /**
     * Fetch tenant registry entry from Master Firestore
     */
    getTenantRegistry(societyId: string): Promise<TenantRegistryEntry | null>;
}
//# sourceMappingURL=masterService.d.ts.map