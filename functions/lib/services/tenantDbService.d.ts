import * as admin from 'firebase-admin';
import { TenantRegistryEntry } from '../types';
export declare class TenantDbService {
    private masterDb;
    private tenantApps;
    constructor(masterDb?: admin.firestore.Firestore);
    /**
     * Resolves the Firestore instance for a given tenant configuration.
     * Isolates database connections securely on the backend.
     */
    getTenantFirestore(tenantConfig: TenantRegistryEntry): admin.firestore.Firestore;
    /**
     * Helper to get tenant root collection reference for a collection name
     */
    getTenantCollection(tenantConfig: TenantRegistryEntry, collectionName: string): admin.firestore.CollectionReference;
}
//# sourceMappingURL=tenantDbService.d.ts.map