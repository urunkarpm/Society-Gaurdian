import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/user_entity.dart';
import '../providers/auth_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/auth/firebase_config_screen.dart';
import '../screens/admin/society_setup_screen.dart';
import '../screens/resident/resident_home_screen.dart';
import '../screens/resident/society_selection_screen.dart';
import '../screens/resident/waiting_approval_screen.dart';
import '../screens/guard/guard_home_screen.dart';
import '../screens/admin_dashboard_screen.dart';
import '../screens/admin/admin_verifications_screen.dart';
import '../screens/helper/helper_home_screen.dart';

/// App router provider
final appRouterProvider = Provider<GoRouter>((ref) {
  final authService = ref.watch(authServiceProviders);
  
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      final isLoggedIn = authService.currentUser != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/';
      final isFirebaseConfig = state.matchedLocation == '/firebase-config';
      
      if (isSplash || isFirebaseConfig) {
        return null; // Allow splash or firebase config screen to load freely
      }
      
      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }
      
      if (isLoggedIn && (isSplash || isLoggingIn)) {
        final user = authService.currentUser;
        if (user != null) {
          await Future.delayed(const Duration(milliseconds: 100));
          final currentUser = ref.read(currentUserProvider);
          final verificationStatus = currentUser?.metadata?['verificationStatus'];
          final societyId = currentUser?.societyId;

          // Redirect residents without verified residence
          if (currentUser?.role == UserRole.resident) {
            if (verificationStatus == 'pending') {
              return '/waiting-approval';
            }
            if (societyId == null || societyId.isEmpty) {
              return '/select-residence';
            }
          }

          final role = ref.read(userRoleProvider);

          switch (role) {
            case UserRole.resident:
              return '/resident/home';
            case UserRole.security:
              return '/guard/home';
            case UserRole.admin:
              return '/admin/dashboard';
            case UserRole.vendor:
              return '/helper/home';
            case UserRole.owner:
              return '/admin/dashboard';
            case null:
              return '/select-residence';
          }
        }
      }
      
      return null;
    },
    routes: [
      // Splash route
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      // Dynamic Firebase Config route
      GoRoute(
        path: '/firebase-config',
        builder: (context, state) => const FirebaseConfigScreen(),
      ),

      // Society Onboarding & Setup route
      GoRoute(
        path: '/setup-society',
        builder: (context, state) => const SocietySetupScreen(),
      ),
      
      // Auth routes
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      
      // Society Selection route (for new residents)
      GoRoute(
        path: '/select-residence',
        builder: (context, state) => const SocietySelectionScreen(),
      ),
      
      // Waiting Approval route
      GoRoute(
        path: '/waiting-approval',
        builder: (context, state) => const WaitingApprovalScreen(),
      ),
      
      // Resident routes
      GoRoute(
        path: '/resident/home',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
      GoRoute(
        path: '/resident/visitors',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
      GoRoute(
        path: '/resident/complaints',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
      GoRoute(
        path: '/resident/bookings',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
      GoRoute(
        path: '/resident/profile',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
      
      // Guard routes
      GoRoute(
        path: '/guard/home',
        builder: (context, state) => const GuardHomeScreen(),
      ),
      GoRoute(
        path: '/guard/scan',
        builder: (context, state) => const GuardHomeScreen(),
      ),
      GoRoute(
        path: '/guard/history',
        builder: (context, state) => const GuardHomeScreen(),
      ),
      
      // Admin routes
      GoRoute(
        path: '/admin/dashboard',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        path: '/admin/verifications',
        builder: (context, state) => const AdminVerificationsScreen(),
      ),
      GoRoute(
        path: '/admin/users',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        path: '/admin/announcements',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        path: '/admin/reports',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      
      // Owner routes
      GoRoute(
        path: '/owner/dashboard',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      GoRoute(
        path: '/owner/visitors',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
      
      // Helper / Vendor routes
      GoRoute(
        path: '/helper/home',
        builder: (context, state) => const HelperHomeScreen(),
      ),

      // Deep link routes
      GoRoute(
        path: '/visitor/:visitorId',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
      GoRoute(
        path: '/complaint/:complaintId',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
      GoRoute(
        path: '/booking/:bookingId',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
      GoRoute(
        path: '/payment/:paymentId',
        builder: (context, state) => const ResidentHomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.matchedLocation}'),
      ),
    ),
  );
});

/// Route guard for role-based access
class RoleGuard {
  final List<UserRole> allowedRoles;
  
  const RoleGuard({required this.allowedRoles});
  
  bool canAccess(UserRole userRole) {
    return allowedRoles.contains(userRole);
  }
  
  static const residentOnly = RoleGuard(allowedRoles: [UserRole.resident]);
  static const securityOnly = RoleGuard(allowedRoles: [UserRole.security]);
  static const adminOnly = RoleGuard(allowedRoles: [UserRole.admin]);
  static const ownerOnly = RoleGuard(allowedRoles: [UserRole.owner]);
  static const adminOrOwner = RoleGuard(allowedRoles: [UserRole.admin, UserRole.owner]);
  static const vendorOnly = RoleGuard(allowedRoles: [UserRole.vendor]);
  static const staffOnly = RoleGuard(allowedRoles: [UserRole.security, UserRole.admin, UserRole.owner]);
  static const allRoles = RoleGuard(allowedRoles: UserRole.values);
}
