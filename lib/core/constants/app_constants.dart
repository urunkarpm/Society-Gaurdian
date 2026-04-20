/// Application-wide constants
class AppConstants {
  AppConstants._();

  static const String appName = 'Society Guardian';
  static const String appVersion = '1.0.0';
  
  // Firestore Collections
  static const String societiesCollection = 'societies';
  static const String flatsCollection = 'flats';
  static const String visitorsCollection = 'visitors';
  static const String usersCollection = 'users';
  static const String notificationsCollection = 'notifications';
  static const String complaintsCollection = 'complaints';
  static const String bookingsCollection = 'bookings';
  static const String announcementsCollection = 'announcements';
  static const String paymentsCollection = 'payments';
  static const String amenitiesCollection = 'amenities';
  static const String patrolLogsCollection = 'patrol_logs';
  static const String auditLogsCollection = 'audit_logs';
  
  // Storage Paths
  static const String visitorPhotosPath = 'visitor_photos';
  static const String complaintPhotosPath = 'complaint_photos';
  static const String profilePhotosPath = 'profile_photos';
  static const String documentsPath = 'documents';
  static const String packagePhotosPath = 'package_photos';
  
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
  static const String notificationTypeEmergency = 'emergency';
  static const String notificationTypePayment = 'payment';
  static const String notificationTypeComplaint = 'complaint';
  static const String notificationTypeBooking = 'booking';
  
  // Complaint Status
  static const String complaintStatusOpen = 'open';
  static const String complaintStatusInProgress = 'in_progress';
  static const String complaintStatusResolved = 'resolved';
  static const String complaintStatusClosed = 'closed';
  
  // Booking Status
  static const String bookingStatusPending = 'pending';
  static const String bookingStatusConfirmed = 'confirmed';
  static const String bookingStatusCancelled = 'cancelled';
  static const String bookingStatusCompleted = 'completed';
  
  // Gate Numbers
  static const String gateMain = 'Main Gate';
  static const String gateSide = 'Side Gate';
  static const String gateService = 'Service Gate';
  
  // Timeouts & Limits
  static const int visitorPhotoMaxSizeMB = 5;
  static const int complaintPhotoMaxSizeMB = 10;
  static const int maxVisitorsPerFlat = 10;
  static const int sessionTimeoutMinutes = 30;
  static const int otpTimeoutSeconds = 60;
  static const int offlineSyncIntervalSeconds = 30;
  
  // FCM Topics
  static const String fcmTopicAllResidents = 'all_residents';
  static const String fcmTopicSecurity = 'security_team';
  static const String fcmTopicAdmins = 'admin_team';
  
  // Deep Link Routes
  static const String deepLinkBase = 'societyguardian://';
  static const String deepLinkVisitor = '${deepLinkBase}visitor/';
  static const String deepLinkComplaint = '${deepLinkBase}complaint/';
  static const String deepLinkBooking = '${deepLinkBase}booking/';
  static const String deepLinkPayment = '${deepLinkBase}payment/';
  
  // Hive Boxes
  static const String hiveBoxSyncQueue = 'sync_queue';
  static const String hiveBoxCache = 'cache';
  static const String hiveBoxSettings = 'settings';
  
  // Error Messages
  static const String errorGeneric = 'Something went wrong. Please try again.';
  static const String errorNoInternet = 'No internet connection. Please check your network.';
  static const String errorUnauthorized = 'You are not authorized to perform this action.';
  static const String errorNotFound = 'The requested resource was not found.';
  static const String errorTimeout = 'Request timed out. Please try again.';
}
