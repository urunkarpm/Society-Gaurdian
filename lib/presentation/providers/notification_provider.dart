import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/app_constants.dart';
import '../../core/utils/logger.dart';
import '../providers/auth_provider.dart';

/// Notification service provider
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

/// FCM token provider
final fcmTokenProvider = StreamProvider<String?>((ref) async* {
  final messaging = FirebaseMessaging.instance;
  
  // Request permission
  final settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    provisional: false,
  );
  
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    Logger.log('User granted notification permission', tag: 'NotificationProvider');
    
    // Get FCM token
    String? token = await messaging.getToken();
    yield token;
    
    // Listen for token refresh
    await for (final newToken in messaging.onTokenRefresh) {
      Logger.log('FCM token refreshed', tag: 'NotificationProvider');
      yield newToken;
    }
  } else {
    Logger.warning('User denied notification permission', tag: 'NotificationProvider');
    yield null;
  }
});

/// Notification Service
class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = 
      FlutterLocalNotificationsPlugin();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isInitialized = false;

  /// Initialize notification service
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      Logger.log('Initializing notification service', tag: 'NotificationService');

      // Initialize local notifications
      const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
      const iosSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );
      
      const settings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

      await _localNotifications.initialize(
        settings: settings,
        onDidReceiveNotificationResponse: _onNotificationTapped,
        onDidReceiveBackgroundNotificationResponse: _onBackgroundNotificationTapped,
      );

      // Configure FCM
      await _configureFCM();
      
      _isInitialized = true;
      Logger.log('Notification service initialized', tag: 'NotificationService');
    } catch (e, stackTrace) {
      Logger.error('Failed to initialize notification service', 
          error: e, stackTrace: stackTrace, tag: 'NotificationService');
      rethrow;
    }
  }

  /// Configure Firebase Cloud Messaging
  Future<void> _configureFCM() async {
    // Set foreground presentation options
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle notification taps when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // Check if app was opened from a notification
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleInitialMessage(initialMessage);
    }

    // Subscribe to default topics based on role
    await _subscribeToTopics();

    Logger.log('FCM configured', tag: 'NotificationService');
  }

  /// Handle foreground message
  void _handleForegroundMessage(RemoteMessage message) {
    Logger.notification('Foreground message received', 
        type: message.data['type'], title: message.notification?.title);

    final notification = message.notification;
    final data = message.data;

    if (notification != null) {
      _showLocalNotification(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        title: notification.title ?? 'Notification',
        body: notification.body ?? '',
        payload: data.isNotEmpty ? jsonEncode(data) : null,
        type: data['type'] ?? 'general',
      );
    }
  }

  /// Handle message opened app
  void _handleMessageOpenedApp(RemoteMessage message) {
    Logger.notification('Notification tapped (background)', 
        type: message.data['type'], title: message.notification?.title);
    _navigateToScreen(message.data);
  }

  /// Handle initial message (cold start)
  void _handleInitialMessage(RemoteMessage message) {
    Logger.notification('Notification tapped (cold start)', 
        type: message.data['type'], title: message.notification?.title);
    _navigateToScreen(message.data);
  }

  /// Show local notification
  Future<void> _showLocalNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
    String? type,
  }) async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'society_guardian_channel',
        'Society Guardian Notifications',
        channelDescription: 'Notifications for Society Guardian app',
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _localNotifications.show(
        id: id,
        title: title,
        body: body,
        notificationDetails: details,
        payload: payload,
      );

      Logger.notification('Local notification shown', type: type, title: title);
    } catch (e, stackTrace) {
      Logger.error('Failed to show local notification', 
          error: e, stackTrace: stackTrace, tag: 'NotificationService');
    }
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    Logger.log('Notification tapped', tag: 'NotificationService');
    if (response.payload != null) {
      final data = jsonDecode(response.payload!) as Map<String, dynamic>;
      _navigateToScreen(data);
    }
  }

  /// Handle background notification tap
  @pragma('vm:entry-point')
  static void _onBackgroundNotificationTapped(NotificationResponse response) {
    Logger.log('Background notification tapped', tag: 'NotificationService');
    // Handle navigation in background
  }

  /// Navigate to screen based on notification data
  void _navigateToScreen(Map<String, dynamic> data) {
    final deepLink = data['deepLink'];
    final type = data['type'];
    
    Logger.log('Navigating to: $deepLink (type: $type)', tag: 'NotificationService');
    
    // Navigation logic will be handled by the router
    // This is a placeholder for actual navigation implementation
  }

  /// Subscribe to FCM topics based on user role
  Future<void> _subscribeToTopics() async {
    try {
      // Subscribe all users to general announcements
      await _messaging.subscribeToTopic(AppConstants.fcmTopicAllResidents);
      Logger.log('Subscribed to ${AppConstants.fcmTopicAllResidents}', tag: 'NotificationService');
    } catch (e, stackTrace) {
      Logger.error('Failed to subscribe to topics', 
          error: e, stackTrace: stackTrace, tag: 'NotificationService');
    }
  }

  /// Save FCM token to Firestore
  Future<void> saveFcmTokenToFirestore(String userId, String token) async {
    try {
      await _firestore.collection(AppConstants.usersCollection).doc(userId).update({
        'fcmTokens': FieldValue.arrayUnion([token]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      Logger.log('FCM token saved to Firestore', tag: 'NotificationService');
    } catch (e, stackTrace) {
      Logger.error('Failed to save FCM token', 
          error: e, stackTrace: stackTrace, tag: 'NotificationService');
    }
  }

  /// Remove FCM token from Firestore
  Future<void> removeFcmTokenFromFirestore(String userId, String token) async {
    try {
      await _firestore.collection(AppConstants.usersCollection).doc(userId).update({
        'fcmTokens': FieldValue.arrayRemove([token]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      Logger.log('FCM token removed from Firestore', tag: 'NotificationService');
    } catch (e, stackTrace) {
      Logger.error('Failed to remove FCM token', 
          error: e, stackTrace: stackTrace, tag: 'NotificationService');
    }
  }

  /// Create notification document in Firestore
  Future<void> createNotificationDocument({
    required String societyId,
    required String type,
    required String title,
    required String body,
    List<String>? targetUserIds,
    List<String>? targetFlatIds,
    String? deepLink,
    Map<String, dynamic>? data,
    int priority = 2,
  }) async {
    try {
      final notificationData = {
        'societyId': societyId,
        'type': type,
        'title': title,
        'body': body,
        'targetUserIds': targetUserIds ?? [],
        'targetFlatIds': targetFlatIds ?? [],
        'deepLink': deepLink,
        'data': data ?? {},
        'priority': priority,
        'isRead': false,
        'shouldSendPush': true,
        'shouldShowInApp': true,
        'createdAt': FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.notificationsCollection)
          .add(notificationData);

      Logger.firestore('create', AppConstants.notificationsCollection, 
          data: notificationData);
    } catch (e, stackTrace) {
      Logger.error('Failed to create notification document', 
          error: e, stackTrace: stackTrace, tag: 'NotificationService');
    }
  }

  /// Mark notification as read
  Future<void> markNotificationAsRead(String notificationId, String societyId) async {
    try {
      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.notificationsCollection)
          .doc(notificationId)
          .update({
        'isRead': true,
        'readAt': FieldValue.serverTimestamp(),
      });

      Logger.firestore('update', AppConstants.notificationsCollection, 
          docId: notificationId);
    } catch (e, stackTrace) {
      Logger.error('Failed to mark notification as read', 
          error: e, stackTrace: stackTrace, tag: 'NotificationService');
    }
  }

  /// Delete notification
  Future<void> deleteNotification(String notificationId, String societyId) async {
    try {
      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.notificationsCollection)
          .doc(notificationId)
          .delete();

      Logger.firestore('delete', AppConstants.notificationsCollection, 
          docId: notificationId);
    } catch (e, stackTrace) {
      Logger.error('Failed to delete notification', 
          error: e, stackTrace: stackTrace, tag: 'NotificationService');
    }
  }
}
