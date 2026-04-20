/// Application-wide constants
class AppConstants {
  AppConstants._();

  // Firebase Configuration
  static const String webRecaptchaKey = 'YOUR_RECAPTCHA_KEY';
  
  // Collections
  static const String societiesCollection = 'societies';
  static const String flatsCollection = 'flats';
  static const String visitorsCollection = 'visitors';
  static const String notificationsCollection = 'notifications';
  static const String complaintsCollection = 'complaints';
  static const String maintenanceCollection = 'maintenance';
  static const String amenitiesCollection = 'amenities';
  static const String bookingsCollection = 'bookings';
  static const String announcementsCollection = 'announcements';
  static const String usersCollection = 'users';
  static const String paymentsCollection = 'payments';
  
  // User Roles
  static const String roleResident = 'resident';
  static const String roleSecurity = 'security';
  static const String roleAdmin = 'admin';
  static const String roleVendor = 'vendor';
  
  // Visitor Status
  static const String visitorStatusPending = 'pending';
  static const String visitorStatusApproved = 'approved';
  static const String visitorStatusRejected = 'rejected';
  static const String visitorStatusCheckedIn = 'checked_in';
  static const String visitorStatusCheckedOut = 'checked_out';
  static const String visitorStatusExpired = 'expired';
  
  // Notification Types
  static const String notificationTypeVisitor = 'visitor';
  static const String notificationTypeAnnouncement = 'announcement';
  static const String notificationTypeComplaint = 'complaint';
  static const String notificationTypePayment = 'payment';
  static const String notificationTypeEmergency = 'emergency';
  
  // Storage Paths
  static const String visitorPhotosPath = 'visitor_photos';
  static const String complaintPhotosPath = 'complaint_photos';
  static const String profilePhotosPath = 'profile_photos';
  static const String documentsPath = 'documents';
  
  // Hive Boxes
  static const String syncQueueBox = 'sync_queue';
  static const String userPreferencesBox = 'user_preferences';
  
  // FCM Topics
  static const String topicSocietyPrefix = 'society_';
  static const String topicBuildingPrefix = 'building_';
  static const String topicFloorPrefix = 'floor_';
  
  // Timeouts & Limits
  static const int visitorPassDefaultDurationMinutes = 60;
  static const int maxVisitorsPerFlat = 10;
  static const int maxPhotoUploadSizeMB = 5;
  static const int sessionTimeoutMinutes = 30;
  
  // Deep Link Routes
  static const String deepLinkBase = 'societyguardian://';
  static const String deepLinkVisitorApproval = 'visitor/approve/';
  static const String deepLinkComplaint = 'complaint/';
  static const String deepLinkBooking = 'booking/';
}

/// Environment configuration
enum Environment { development, staging, production }

class EnvConfig {
  static Environment current = Environment.development;
  
  static String get firebaseProjectId {
    switch (current) {
      case Environment.development:
        return 'society-guardian-dev';
      case Environment.staging:
        return 'society-guardian-staging';
      case Environment.production:
        return 'society-guardian-prod';
    }
  }
  
  static bool get isProduction => current == Environment.production;
}
