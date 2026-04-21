/**
 * Cloud Functions for Society Guardian
 * Firebase Gen 2 Functions with TypeScript
 */

import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

const db = admin.firestore();
const messaging = admin.messaging();

// ==================== VISITOR FUNCTIONS ====================

/**
 * Triggered when a new visitor is created
 * Sends FCM notification to resident and creates notification document
 * Also notifies admins/owners who should receive visitor notifications
 */
export const onVisitorCreate = functions.firestore
  .document('societies/{societyId}/visitors/{visitorId}')
  .onCreate(async (snap, context) => {
    const visitorData = snap.data();
    const { societyId, visitorId } = context.params;
    
    try {
      // Get host flat information
      const flatDoc = await db
        .collection('societies')
        .doc(societyId)
        .collection('flats')
        .doc(visitorData.hostFlatId)
        .get();
      
      if (!flatDoc.exists) {
        console.error('Host flat not found:', visitorData.hostFlatId);
        return;
      }
      
      const flatData = flatDoc.data()!;
      const residentUids = flatData.residentUids || [];
      
      if (residentUids.length === 0) {
        console.log('No residents found for flat');
      }
      
      // Get resident FCM tokens
      const residentDocs = await Promise.all(
        residentUids.map(uid => 
          db.collection('users').doc(uid).get()
        )
      );
      
      const fcmTokens: string[] = [];
      for (const doc of residentDocs) {
        if (doc.exists) {
          const userData = doc.data()!;
          if (userData.fcmTokens) {
            fcmTokens.push(...userData.fcmTokens);
          }
        }
      }
      
      // Get admin/owner FCM tokens for visitor notifications
      // This ensures admins (including those with owner role) get visitor notifications
      const adminQuery = await db
        .collection('users')
        .where('societyId', '==', societyId)
        .where('role', 'in', ['admin', 'owner'])
        .get();
      
      const adminFcmTokens: string[] = [];
      for (const doc of adminQuery.docs) {
        const userData = doc.data();
        // Check if this admin/owner should receive visitor notifications
        const shouldReceiveVisitorNotifications = 
          userData.receiveVisitorNotifications !== false && // Default true
          userData.isAdminMode !== false; // For owners toggled to admin mode
        
        if (shouldReceiveVisitorNotifications && userData.fcmTokens) {
          adminFcmTokens.push(...userData.fcmTokens);
        }
      }
      
      // Combine all tokens (residents + admins/owners)
      const allTokens = [...fcmTokens, ...adminFcmTokens];
      
      if (allTokens.length === 0) {
        console.log('No FCM tokens found for residents or admins');
      } else {
        // Send FCM notification
        const message: admin.messaging.MulticastMessage = {
          tokens: allTokens,
          notification: {
            title: 'New Visitor Alert',
            body: `${visitorData.visitorName} has arrived at ${visitorData.gateName}`,
          },
          data: {
            type: 'visitor',
            visitorId: visitorId,
            visitorName: visitorData.visitorName,
            purpose: visitorData.purpose,
            gateName: visitorData.gateName,
            deepLink: `societyguardian://visitor/${visitorId}`,
          },
          android: {
            priority: 'high',
            notification: {
              sound: 'default',
              channelId: 'visitor_notifications',
            },
          },
          apns: {
            payload: {
              aps: {
                sound: 'default',
                badge: 1,
              },
            },
          },
        };
        
        await messaging.sendEachForMulticast(message);
        console.log('FCM notifications sent successfully');
      }
      
      // Create notification document in Firestore for residents
      const residentNotificationData = {
        societyId: societyId,
        type: 'visitor',
        title: 'New Visitor Alert',
        body: `${visitorData.visitorName} has arrived at ${visitorData.gateName}`,
        targetUserIds: residentUids,
        targetFlatIds: [visitorData.hostFlatId],
        deepLink: `societyguardian://visitor/${visitorId}`,
        data: {
          visitorId: visitorId,
          visitorName: visitorData.visitorName,
          purpose: visitorData.purpose,
          gateName: visitorData.gateName,
        },
        priority: 3,
        isRead: false,
        shouldSendPush: false, // Already sent via FCM above
        shouldShowInApp: true,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      };
      
      await db
        .collection('societies')
        .doc(societyId)
        .collection('notifications')
        .add(residentNotificationData);
      
      // Create separate notification document for admins/owners
      const adminUids = adminQuery.docs.map(doc => doc.id);
      if (adminUids.length > 0) {
        const adminNotificationData = {
          societyId: societyId,
          type: 'visitor_admin',
          title: 'Visitor Arrived (Admin Notification)',
          body: `${visitorData.visitorName} arrived at ${visitorData.gateName} for Flat ${flatData.flatNumber || visitorData.hostFlatId}`,
          targetUserIds: adminUids,
          deepLink: `societyguardian://visitor/${visitorId}`,
          data: {
            visitorId: visitorId,
            visitorName: visitorData.visitorName,
            purpose: visitorData.purpose,
            gateName: visitorData.gateName,
            hostFlatId: visitorData.hostFlatId,
          },
          priority: 2,
          isRead: false,
          shouldSendPush: false, // Already sent via FCM above
          shouldShowInApp: true,
          createdAt: admin.firestore.FieldValue.serverTimestamp(),
        };
        
        await db
          .collection('societies')
          .doc(societyId)
          .collection('notifications')
          .add(adminNotificationData);
        
        console.log('Admin notification document created');
      }
      
      console.log('Notification documents created');
      
      // Log audit trail
      await db.collection('audit_logs').add({
        action: 'visitor_created',
        visitorId: visitorId,
        societyId: societyId,
        performedBy: visitorData.createdBy || 'system',
        timestamp: admin.firestore.FieldValue.serverTimestamp(),
        details: visitorData,
      });
      
    } catch (error) {
      console.error('Error in onVisitorCreate:', error);
      throw error;
    }
  });

/**
 * Scheduled function to expire pending visitors after 24 hours
 */
export const expirePendingVisitors = functions.pubsub
  .schedule('every 60 minutes')
  .onRun(async (context) => {
    const oneDayAgo = new Date(Date.now() - 24 * 60 * 60 * 1000);
    
    try {
      const societiesSnapshot = await db.collection('societies').get();
      
      const updatePromises: Promise<void>[] = [];
      
      for (const societyDoc of societiesSnapshot.docs) {
        const expiredVisitors = await db
          .collection('societies')
          .doc(societyDoc.id)
          .collection('visitors')
          .where('status', '==', 'pending')
          .where('createdAt', '<=', oneDayAgo)
          .get();
        
        for (const visitorDoc of expiredVisitors.docs) {
          const updatePromise = visitorDoc.ref.update({
            status: 'expired',
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
          });
          updatePromises.push(updatePromise);
        }
      }
      
      await Promise.all(updatePromises);
      console.log(`Expired ${updatePromises.length} pending visitors`);
      
    } catch (error) {
      console.error('Error expiring visitors:', error);
    }
  });

// ==================== NOTIFICATION FUNCTIONS ====================

/**
 * Send scheduled announcements
 */
export const sendScheduledNotifications = functions.pubsub
  .schedule('every day 09:00')
  .onRun(async (context) => {
    try {
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      
      const tomorrow = new Date(today);
      tomorrow.setDate(tomorrow.getDate() + 1);
      
      // Get upcoming bookings for tomorrow
      const bookingsSnapshot = await db
        .collectionGroup('bookings')
        .where('startTime', '>=', today)
        .where('startTime', '<', tomorrow)
        .where('status', '==', 'confirmed')
        .get();
      
      const notificationPromises: Promise<void>[] = [];
      
      for (const bookingDoc of bookingsSnapshot.docs) {
        const bookingData = bookingDoc.data();
        
        // Get resident FCM tokens
        const userDoc = await db
          .collection('users')
          .doc(bookingData.bookedBy)
          .get();
        
        if (userDoc.exists) {
          const userData = userDoc.data()!;
          const fcmTokens = userData.fcmTokens || [];
          
          if (fcmTokens.length > 0) {
            const message: admin.messaging.Message = {
              token: fcmTokens[0],
              notification: {
                title: 'Booking Reminder',
                body: `Your ${bookingData.amenityName} booking is tomorrow`,
              },
              data: {
                type: 'booking_reminder',
                bookingId: bookingDoc.id,
                amenityName: bookingData.amenityName,
                deepLink: `societyguardian://booking/${bookingDoc.id}`,
              },
            };
            
            await messaging.send(message);
          }
        }
      }
      
      console.log('Scheduled notifications sent');
      
    } catch (error) {
      console.error('Error sending scheduled notifications:', error);
    }
  });

// ==================== PAYMENT FUNCTIONS ====================

/**
 * Process payment webhook (Stripe/Razorpay)
 */
export const processPaymentWebhook = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        'unauthenticated',
        'User must be authenticated'
      );
    }
    
    const { paymentId, status, transactionId, amount } = data;
    
    try {
      await db.doc(`payments/${paymentId}`).update({
        status: status,
        transactionId: transactionId,
        paidAt: admin.firestore.FieldValue.serverTimestamp(),
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      });
      
      // Create audit log
      await db.collection('audit_logs').add({
        action: 'payment_processed',
        paymentId: paymentId,
        status: status,
        amount: amount,
        performedBy: context.auth.uid,
        timestamp: admin.firestore.FieldValue.serverTimestamp(),
      });
      
      return { success: true };
      
    } catch (error) {
      console.error('Error processing payment:', error);
      throw new functions.https.HttpsError(
        'internal',
        'Failed to process payment'
      );
    }
  }
);

// ==================== ADMIN FUNCTIONS ====================

/**
 * Assign custom claims to users
 */
export const assignUserRole = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        'unauthenticated',
        'User must be authenticated'
      );
    }
    
    // Check if caller is admin
    const callerDoc = await db
      .collection('users')
      .doc(context.auth.uid)
      .get();
    
    if (!callerDoc.exists || callerDoc.data()?.role !== 'admin') {
      throw new functions.https.HttpsError(
        'permission-denied',
        'Only admins can assign roles'
      );
    }
    
    const { userId, role } = data;
    
    if (!['resident', 'security', 'admin', 'vendor'].includes(role)) {
      throw new functions.https.HttpsError(
        'invalid-argument',
        'Invalid role'
      );
    }
    
    try {
      // Set custom claims
      await admin.auth().setCustomUserClaims(userId, { role });
      
      // Update Firestore user document
      await db.collection('users').doc(userId).update({
        role: role,
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      });
      
      // Audit log
      await db.collection('audit_logs').add({
        action: 'role_assigned',
        targetUserId: userId,
        newRole: role,
        performedBy: context.auth.uid,
        timestamp: admin.firestore.FieldValue.serverTimestamp(),
      });
      
      return { success: true };
      
    } catch (error) {
      console.error('Error assigning role:', error);
      throw new functions.https.HttpsError(
        'internal',
        'Failed to assign role'
      );
    }
  }
);

// Export all functions
exports.onVisitorCreate = onVisitorCreate;
exports.expirePendingVisitors = expirePendingVisitors;
exports.sendScheduledNotifications = sendScheduledNotifications;
exports.processPaymentWebhook = processPaymentWebhook;
exports.assignUserRole = assignUserRole;
