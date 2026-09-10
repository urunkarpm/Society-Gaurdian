import * as admin from 'firebase-admin';
import { TenantRegistryEntry } from '../types';

export class TenantDbService {
  private masterDb: admin.firestore.Firestore;
  private tenantApps: Map<string, admin.app.App> = new Map();

  constructor(masterDb?: admin.firestore.Firestore) {
    this.masterDb = masterDb || admin.firestore();
  }

  /**
   * Resolves the Firestore instance for a given tenant configuration.
   * Isolates database connections securely on the backend.
   */
  getTenantFirestore(tenantConfig: TenantRegistryEntry): admin.firestore.Firestore {
    const projectId = tenantConfig.connectionMetadata.projectId;

    // If tenant uses the current default master Firebase project or emulator
    if (!projectId || projectId === process.env.GCP_PROJECT || projectId === process.env.GPG_PROJECT_ID) {
      return this.masterDb;
    }

    // Check if tenant app instance is already initialized
    const appName = `tenant-${tenantConfig.societyId}`;
    if (this.tenantApps.has(appName)) {
      return this.tenantApps.get(appName)!.firestore();
    }

    // Attempt to reuse existing named app if already initialized in admin SDK
    const existingApp = admin.apps.find(app => app && app.name === appName);
    if (existingApp) {
      this.tenantApps.set(appName, existingApp);
      return existingApp.firestore();
    }

    try {
      // Initialize tenant app instance securely on backend
      const tenantApp = admin.initializeApp(
        {
          projectId: projectId,
        },
        appName
      );
      this.tenantApps.set(appName, tenantApp);
      return tenantApp.firestore();
    } catch (error) {
      console.warn(`Fallback to default Firestore instance for society ${tenantConfig.societyId}:`, error);
      return this.masterDb;
    }
  }

  /**
   * Helper to get tenant root collection reference for a collection name
   */
  getTenantCollection(tenantConfig: TenantRegistryEntry, collectionName: string): admin.firestore.CollectionReference {
    const tenantDb = this.getTenantFirestore(tenantConfig);
    // Standard tenant Firestore layout: /societies/{societyId}/{collectionName} or /{collectionName}
    return tenantDb.collection('societies').doc(tenantConfig.societyId).collection(collectionName);
  }
}
