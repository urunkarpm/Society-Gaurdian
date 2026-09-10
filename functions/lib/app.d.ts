import express from 'express';
import * as admin from 'firebase-admin';
import { MasterService } from './services/masterService';
import { TenantDbService } from './services/tenantDbService';
export declare function createApp(masterServiceOverride?: MasterService, tenantDbServiceOverride?: TenantDbService, adminAuthOverride?: admin.auth.Auth): express.Express;
//# sourceMappingURL=app.d.ts.map