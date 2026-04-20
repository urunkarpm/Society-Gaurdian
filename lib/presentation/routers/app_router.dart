import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/user_entity.dart';
import '../providers/auth_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/resident/resident_home_screen.dart';
import '../screens/guard/guard_home_screen.dart';
import '../screens/admin_dashboard_screen.dart';
import '../../core/constants/app_constants.dart';

/// App router provider
final appRouterProvider = Provider<GoRouter>((ref) {
  final authService = ref.watch(authServiceProviders);
  
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authService.currentUser != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/';
      
      if (isSplash) {
        return null; // Allow splash to load
      }
      
      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }
      
      if (isLoggedIn && (isSplash || isLoggingIn)) {
        final user = authService.currentUser;
        if (user != null) {
          final role = UserRole.resident;
          
          switch (role) {
            case UserRole.resident:
              return '/resident/home';
            case UserRole.security:
              return '/guard/home';
            case UserRole.admin:
              return '/admin/dashboard';
            case UserRole.vendor:
              return '/vendor/home';
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
      
      // Auth routes
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
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
      
      // Deep link routes
      GoRoute(
        path: '/visitor/:visitorId',
        builder: (context, state) {
          final visitorId = state.pathParameters['visitorId'];
          // Return visitor detail screen
          return const ResidentHomeScreen();
        },
      ),
      GoRoute(
        path: '/complaint/:complaintId',
        builder: (context, state) {
          final complaintId = state.pathParameters['complaintId'];
          // Return complaint detail screen
          return const ResidentHomeScreen();
        },
      ),
      GoRoute(
        path: '/booking/:bookingId',
        builder: (context, state) {
          final bookingId = state.pathParameters['bookingId'];
          // Return booking detail screen
          return const ResidentHomeScreen();
        },
      ),
      GoRoute(
        path: '/payment/:paymentId',
        builder: (context, state) {
          final paymentId = state.pathParameters['paymentId'];
          // Return payment detail screen
          return const ResidentHomeScreen();
        },
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
  static const vendorOnly = RoleGuard(allowedRoles: [UserRole.vendor]);
  static const staffOnly = RoleGuard(allowedRoles: [UserRole.security, UserRole.admin]);
  static const allRoles = RoleGuard(allowedRoles: UserRole.values);
}
