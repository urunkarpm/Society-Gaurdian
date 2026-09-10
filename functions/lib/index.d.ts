/**
 * Cloud Functions for Society Guardian
 * Firebase Gen 2 Functions with TypeScript
 */
import * as functions from 'firebase-functions';
export declare const api: functions.HttpsFunction;
/**
 * Triggered when a new visitor is created
 * Sends FCM notification to resident and creates notification document
 * Also notifies admins/owners who should receive visitor notifications
 */
export declare const onVisitorCreate: functions.CloudFunction<functions.firestore.QueryDocumentSnapshot>;
/**
 * Scheduled function to expire pending visitors after 24 hours
 */
export declare const expirePendingVisitors: functions.CloudFunction<unknown>;
/**
 * Send scheduled announcements
 */
export declare const sendScheduledNotifications: functions.CloudFunction<unknown>;
/**
 * Process payment webhook (Stripe/Razorpay)
 */
export declare const processPaymentWebhook: functions.HttpsFunction & functions.Runnable<any>;
/**
 * Assign custom claims to users
 */
export declare const assignUserRole: functions.HttpsFunction & functions.Runnable<any>;
//# sourceMappingURL=index.d.ts.map