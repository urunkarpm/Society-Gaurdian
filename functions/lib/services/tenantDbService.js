"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.TenantDbService = void 0;
const admin = __importStar(require("firebase-admin"));
class TenantDbService {
    constructor(masterDb) {
        this.tenantApps = new Map();
        this.masterDb = masterDb || admin.firestore();
    }
    /**
     * Resolves the Firestore instance for a given tenant configuration.
     * Isolates database connections securely on the backend.
     */
    getTenantFirestore(tenantConfig) {
        const projectId = tenantConfig.connectionMetadata.projectId;
        // If tenant uses the current default master Firebase project or emulator
        if (!projectId || projectId === process.env.GCP_PROJECT || projectId === process.env.GPG_PROJECT_ID) {
            return this.masterDb;
        }
        // Check if tenant app instance is already initialized
        const appName = `tenant-${tenantConfig.societyId}`;
        if (this.tenantApps.has(appName)) {
            return this.tenantApps.get(appName).firestore();
        }
        // Attempt to reuse existing named app if already initialized in admin SDK
        const existingApp = admin.apps.find(app => app && app.name === appName);
        if (existingApp) {
            this.tenantApps.set(appName, existingApp);
            return existingApp.firestore();
        }
        try {
            // Initialize tenant app instance securely on backend
            const tenantApp = admin.initializeApp({
                projectId: projectId,
            }, appName);
            this.tenantApps.set(appName, tenantApp);
            return tenantApp.firestore();
        }
        catch (error) {
            console.warn(`Fallback to default Firestore instance for society ${tenantConfig.societyId}:`, error);
            return this.masterDb;
        }
    }
    /**
     * Helper to get tenant root collection reference for a collection name
     */
    getTenantCollection(tenantConfig, collectionName) {
        const tenantDb = this.getTenantFirestore(tenantConfig);
        // Standard tenant Firestore layout: /societies/{societyId}/{collectionName} or /{collectionName}
        return tenantDb.collection('societies').doc(tenantConfig.societyId).collection(collectionName);
    }
}
exports.TenantDbService = TenantDbService;
//# sourceMappingURL=tenantDbService.js.map