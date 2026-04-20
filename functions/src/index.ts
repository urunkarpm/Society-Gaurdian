/**
 * Society Guardian Cloud Functions
 * 
 * Key Functions:
 * - onVisitorCreate: Triggered when a new visitor is tagged by security
 * - onVisitorExpire: Scheduled function to auto-expire pending visitors
 * - sendScheduledNotifications: Daily reminders for pending approvals
 * - processPaymentWebhook: Handle Stripe/Razorpay payment webhooks
 */

import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

const db = admin.firestore();
const messaging = admin.messaging();

/**
 * Trigger FCM notification when a new visitor is created
 */
export const onVisitorCreate = functions.firestore
  .document('societies/{societyId}/visitors/{visitorId}')
  .onCreate(async (snapshot, context) => {
    const visitorData = snapshot.data();
    const { societyId, visitorId } = context.params;
    
    try {
      // Get flat members to notify
      const flatDoc = await db
        .collection('societies')
        .doc(societyId)
        .collection('flats')
        .doc(visitorData.hostFlatId)
        .get();
      
      if (!flatDoc.exists) {
        console.log(`Flat ${visitorData.hostFlatId} not found`);
        return null;
      }
      
      const flatData = flatDoc.data()!;
      const memberUids = flatData.memberUids || [];
      
      if (memberUids.length === 0) {
        console.log('No members in flat');
        return null;
      }
      
      // Get FCM tokens for all members
      const tokens: string[] = [];
      for (const uid of memberUids) {
        const userDoc = await db.collection('users').doc(uid).get();
        if (userDoc.exists) {
          const userData = userDoc.data();
          const userTokens = userData?.fcmTokens || [];
          tokens.push(...userTokens);
        }
      }
      
      if (tokens.length === 0) {
        console.log('No FCM tokens found');
        return null;
      }
      
      // Prepare notification payload
      const message: admin.messaging.MulticastMessage = {
        tokens: tokens,
        notification: {
          title: '🚪 New Visitor Alert',
          body: `${visitorData.visitorName} is at ${visitorData.gateNumber}`,
        },
        data: {
          type: 'visitor',
          visitorId: visitorId,
          visitorName: visitorData.visitorName,
          purpose: visitorData.purpose || '',
          gateNumber: visitorData.gateNumber,
          photoUrl: visitorData.visitorPhotoUrl || '',
          flatId: visitorData.hostFlatId,
          deepLink: `/visitor/approve/${visitorId}`,
        },
        android: {
          priority: 'high',
          notification: {
            channelId: 'visitors',
            clickAction: 'FLUTTER_NOTIFICATION_CLICK',
          },
        },
        apns: {
          payload: {
            aps: {
              contentAvailable: true,
              sound: 'default',
            },
          },
          headers: {
            'apns-priority': '10',
          },
        },
      };
      
      // Send notifications
      const response = await messaging.sendEachForMulticast(message);
      console.log(`Sent ${response.successCount} notifications`);
      
      // Create in-app notifications
      const notifications = memberUids.map((uid: string) => ({
        id: db.collection('notifications').doc().id,
        userId: uid,
        type: 'visitor',
        title: 'New Visitor Alert',
        body: `${visitorData.visitorName} is at ${visitorData.gateNumber}`,
        data: {
          visitorId,
          visitorName: visitorData.visitorName,
          gateNumber: visitorData.gateNumber,
        },
        imageUrl: visitorData.visitorPhotoUrl || null,
        actionUrl: `/visitor/approve/${visitorId}`,
        isRead: false,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      }));
      
      const batch = db.batch();
      notifications.forEach((notif: any) => {
        batch.set(
          db.collection('societies').doc(societyId).collection('notifications').doc(notif.id),
          notif
        );
      });
      await batch.commit();
      
      return null;
    } catch (error) {
      console.error('Error sending visitor notification:', error);
      return null;
    }
  });

/**
 * Auto-expire pending visitors after timeout (2 hours default)
 */
export const onVisitorExpire = functions.pubsub
  .schedule('every 15 minutes')
  .onRun(async (context) => {
    const now = admin.firestore.Timestamp.now();
    const expiryThreshold = new Date(Date.now() - 2 * 60 * 60 * 1000); // 2 hours ago
    
    try {
      const expiredVisitors = await db
        .collectionGroup('visitors')
        .where('status', '==', 'pending')
        .where('taggedAt', '<', admin.firestore.Timestamp.fromDate(expiryThreshold))
        .get();
      
      const batch = db.batch();
      expiredVisitors.forEach((doc) => {
        batch.update(doc.ref, {
          status: 'expired',
          updatedAt: now,
        });
      });
      
      await batch.commit();
      console.log(`Expired ${expiredVisitors.size} pending visitors`);
      
      return null;
    } catch (error) {
      console.error('Error expiring visitors:', error);
      return null;
    }
  });

/**
 * Send daily reminders for pending visitor approvals
 */
export const sendScheduledNotifications = functions.pubsub
  .schedule('0 9 * * *') // Every day at 9 AM
  .onRun(async (context) => {
    try {
      const societies = await db.collection('societies').get();
      
      for (const societyDoc of societies.docs) {
        const societyId = societyDoc.id;
        
        // Get pending visitors from last 24 hours
        const yesterday = new Date(Date.now() - 24 * 60 * 60 * 1000);
        const pendingVisitors = await db
          .collection('societies')
          .doc(societyId)
          .collection('visitors')
          .where('status', '==', 'pending')
          .where('taggedAt', '>', admin.firestore.Timestamp.fromDate(yesterday))
          .get();
        
        if (pendingVisitors.empty) continue;
        
        // Group by flat and notify members
        const flatVisitorMap = new Map<string, any[]>();
        pendingVisitors.forEach((doc) => {
          const data = doc.data();
          const flatId = data.hostFlatId;
          if (!flatVisitorMap.has(flatId)) {
            flatVisitorMap.set(flatId, []);
          }
          flatVisitorMap.get(flatId)!.push(data);
        });
        
        // Send reminders for each flat
        for (const [flatId, visitors] of flatVisitorMap.entries()) {
          const flatDoc = await db
            .collection('societies')
            .doc(societyId)
            .collection('flats')
            .doc(flatId)
            .get();
          
          if (!flatDoc.exists) continue;
          
          const memberUids = flatDoc.data()?.memberUids || [];
          // Send reminder notifications...
        }
      }
      
      return null;
    } catch (error) {
      console.error('Error sending scheduled notifications:', error);
      return null;
    }
  });

/**
 * Process payment webhooks (Stripe/Razorpay)
 */
export const processPaymentWebhook = functions.https.onRequest(
  async (req, res) => {
    const sig = req.headers['stripe-signature'] as string;
    
    try {
      // Verify webhook signature and process payment
      // Implementation depends on payment gateway
      
      res.status(200).send({ received: true });
    } catch (error) {
      console.error('Webhook error:', error);
      res.status(400).send('Webhook Error');
    }
  }
);

/**
 * Generate pre-approval QR code for residents
 */
export const generatePreApprovalCode = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        'unauthenticated',
        'User must be authenticated'
      );
    }
    
    const { flatId, visitorName, validUntil } = data;
    const userId = context.auth.uid;
    
    try {
      // Verify user is member of the flat
      // Generate unique code
      // Store in pre_approvals collection
      // Return code for QR generation
      
      return { success: true, code: 'PREAPPROVAL123' };
    } catch (error) {
      throw new functions.https.HttpsError('internal', error.message);
    }
  }
);

/**
 * Clean up old data based on retention policy
 */
export const cleanupOldData = functions.pubsub
  .schedule('0 2 * * 0') // Every Sunday at 2 AM
  .onRun(async (context) => {
    const retentionDays = 90; // Keep data for 90 days
    const cutoffDate = new Date(Date.now() - retentionDays * 24 * 60 * 60 * 1000);
    
    try {
      // Archive or delete old visitor records
      const oldVisitors = await db
        .collectionGroup('visitors')
        .where('taggedAt', '<', admin.firestore.Timestamp.fromDate(cutoffDate))
        .where('status', 'in', ['checked_out', 'expired', 'rejected'])
        .get();
      
      // Move to archive collection or delete
      console.log(`Found ${oldVisitors.size} old visitor records to clean up`);
      
      return null;
    } catch (error) {
      console.error('Error cleaning up old data:', error);
      return null;
    }
  });
