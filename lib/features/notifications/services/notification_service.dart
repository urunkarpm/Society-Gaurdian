import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../core/constants/app_constants.dart';

/// Notification service for FCM and local notifications
class NotificationService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  static bool _isInitialized = false;

  /// Initialize notification service
  static Future<void> initialize() async {
    if (_isInitialized) return;

    // Request permissions
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

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
      settings,
      onDidReceiveNotificationResponse: _handleNotificationTap,
    );

    // Create Android notification channel
    await _createNotificationChannel();

    // Setup FCM message handlers
    _setupMessageHandlers();

    // Get FCM token
    final token = await _messaging.getToken();
    if (token != null) {
      await updateFCMTokenInFirestore(token);
    }

    // Listen for token refresh
    _messaging.onTokenRefresh.listen(updateFCMTokenInFirestore);

    _isInitialized = true;
  }

  /// Create Android notification channel
  static Future<void> _createNotificationChannel() async {
    const androidChannel = AndroidNotificationChannel(
      'visitors',
      'Visitor Notifications',
      description: 'Notifications about visitors',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    const announcementsChannel = AndroidNotificationChannel(
      'announcements',
      'Announcements',
      description: 'Society announcements and notices',
      importance: Importance.high,
    );

    const emergencyChannel = AndroidNotificationChannel(
      'emergency',
      'Emergency Alerts',
      description: 'Emergency and SOS alerts',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(announcementsChannel);

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(emergencyChannel);
  }

  /// Setup FCM message handlers
  static void _setupMessageHandlers() {
    // Foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Background messages (handled in firebase_messaging_background.dart)
    // FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    // Notification tap when app is terminated
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationData(initialMessage.data);
    }
  }

  /// Handle foreground messages
  static Future<void> _handleForegroundMessage(RemoteMessage message) async {
    final notification = message.notification;
    final data = message.data;

    if (notification != null) {
      await showLocalNotification(
        title: notification.title ?? 'Notification',
        body: notification.body ?? '',
        payload: data['deepLink'] ?? '',
        type: data['type'] ?? 'general',
        imageUrl: data['photoUrl'],
      );
    }
  }

  /// Show local notification
  static Future<void> showLocalNotification({
    required String title,
    required String body,
    String? payload,
    String type = 'general',
    String? imageUrl,
  }) async {
    String channelId;
    Importance importance;

    switch (type) {
      case AppConstants.notificationTypeEmergency:
        channelId = 'emergency';
        importance = Importance.max;
        break;
      case AppConstants.notificationTypeAnnouncement:
        channelId = 'announcements';
        importance = Importance.high;
        break;
      default:
        channelId = 'visitors';
        importance = Importance.high;
    }

    final androidDetails = AndroidNotificationDetails(
      channelId,
      channelId,
      channelDescription: channelId,
      importance: importance,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      largeIcon: imageUrl != null ? FilePathAndroidBitmap(imageUrl) : null,
      styleInformation: BigPictureStyleInformation(
        FilePathAndroidBitmap(imageUrl!),
        hideExpandedLargeIcon: true,
      ),
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title,
      body,
      details,
      payload: payload,
    );
  }

  /// Handle notification tap
  static void _handleNotificationTap(NotificationResponse response) {
    if (response.payload != null) {
      _handleNotificationData({'deepLink': response.payload!});
    }
  }

  /// Handle notification data for navigation
  static void _handleNotificationData(Map<String, dynamic> data) {
    // This will be handled by the app's navigation system
    // Deep link is available in data['deepLink']
  }

  /// Update FCM token in Firestore
  static Future<void> updateFCMToken(String uid) async {
    final token = await _messaging.getToken();
    if (token != null) {
      await updateFCMTokenInFirestore(token, uid);
    }
  }

  /// Update FCM token in Firestore with specific UID
  static Future<void> updateFCMTokenInFirestore(String token, [String? uid]) async {
    try {
      final userUid = uid ?? (await _messaging.getUser()?.uid);
      if (userUid == null) return;

      await FirebaseFirestore.instance
          .collection(AppConstants.usersCollection)
          .doc(userUid)
          .update({
        'fcmTokens': FieldValue.arrayUnion([token]),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // Handle error silently or log it
    }
  }

  /// Subscribe to topic
  static Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  /// Unsubscribe from topic
  static Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }

  /// Subscribe to society topics
  static Future<void> subscribeToSocietyTopics(String societyId) async {
    await subscribeToTopic('${AppConstants.topicSocietyPrefix}$societyId');
  }

  /// Delete FCM token
  static Future<void> deleteFCMToken(String token) async {
    try {
      await _messaging.deleteToken();
      
      // Remove from Firestore
      // Implementation depends on current user context
    } catch (e) {
      // Handle error
    }
  }
}
