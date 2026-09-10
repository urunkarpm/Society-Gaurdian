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
exports.MasterService = void 0;
const admin = __importStar(require("firebase-admin"));
class MasterService {
    constructor(db) {
        this.db = db || admin.firestore();
    }
    /**
     * Fetch Master User details from Master Firestore
     */
    async getUserProfile(uid) {
        var _a, _b;
        const userDoc = await this.db.collection('users').doc(uid).get();
        if (!userDoc.exists) {
            return null;
        }
        const data = userDoc.data();
        return {
            uid: userDoc.id,
            email: data.email,
            name: data.name,
            phone: data.phone,
            photoUrl: data.photoUrl,
            createdAt: data.createdAt ? new Date(((_b = (_a = data.createdAt).toDate) === null || _b === void 0 ? void 0 : _b.call(_a)) || data.createdAt).toISOString() : undefined,
        };
    }
    /**
     * Fetch memberships for a Master User UID
     */
    async getUserMemberships(uid) {
        var _a;
        // Check memberships collection under memberships/{uid}
        const membershipsDoc = await this.db.collection('memberships').doc(uid).get();
        if (membershipsDoc.exists) {
            const data = membershipsDoc.data();
            if (Array.isArray(data.societies)) {
                return data.societies;
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
        if (userDoc.exists && Array.isArray((_a = userDoc.data()) === null || _a === void 0 ? void 0 : _a.societies)) {
            return userDoc.data().societies;
        }
        return [];
    }
    /**
     * Get specific society membership for user
     */
    async getUserMembershipForSociety(uid, societyId) {
        const memberships = await this.getUserMemberships(uid);
        const found = memberships.find(m => m.societyId === societyId);
        return found || null;
    }
    /**
     * Fetch tenant registry entry from Master Firestore
     */
    async getTenantRegistry(societyId) {
        var _a, _b, _c, _d, _e, _f, _g, _h, _j, _k;
        // Check 'tenants' collection or 'societies' collection in Master Firestore
        let tenantDoc = await this.db.collection('tenants').doc(societyId).get();
        if (!tenantDoc.exists) {
            tenantDoc = await this.db.collection('societies').doc(societyId).get();
        }
        if (!tenantDoc.exists) {
            return null;
        }
        const data = tenantDoc.data();
        return {
            societyId: tenantDoc.id,
            name: data.name || societyId,
            projectId: data.projectId || ((_a = data.connectionMetadata) === null || _a === void 0 ? void 0 : _a.projectId) || `society-${societyId.toLowerCase()}`,
            connectionMetadata: {
                projectId: ((_b = data.connectionMetadata) === null || _b === void 0 ? void 0 : _b.projectId) || data.projectId || `society-${societyId.toLowerCase()}`,
                region: ((_c = data.connectionMetadata) === null || _c === void 0 ? void 0 : _c.region) || 'us-central1',
                databaseId: (_d = data.connectionMetadata) === null || _d === void 0 ? void 0 : _d.databaseId,
            },
            tenantConfig: {
                allowGuestRegistration: (_f = (_e = data.tenantConfig) === null || _e === void 0 ? void 0 : _e.allowGuestRegistration) !== null && _f !== void 0 ? _f : true,
                requireVerification: (_h = (_g = data.tenantConfig) === null || _g === void 0 ? void 0 : _g.requireVerification) !== null && _h !== void 0 ? _h : true,
                maintenanceCycle: ((_j = data.tenantConfig) === null || _j === void 0 ? void 0 : _j.maintenanceCycle) || 'MONTHLY',
                timezone: ((_k = data.tenantConfig) === null || _k === void 0 ? void 0 : _k.timezone) || 'UTC',
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
exports.MasterService = MasterService;
//# sourceMappingURL=masterService.js.map