import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../providers/auth_provider.dart';
import '../../features/visitor_tracking/screens/guard_home_screen.dart';
import '../../features/visitor_tracking/screens/resident_visitor_screen.dart';
import '../../features/complaints/screens/complaint_list_screen.dart';
import '../../features/amenity_booking/screens/amenity_list_screen.dart';
import '../../features/announcements/screens/announcement_list_screen.dart';
import '../../features/billing/screens/billing_screen.dart';
import '../../features/security/screens/emergency_screen.dart';
import '../../features/community/screens/community_hub_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/no_internet_screen.dart';

/// App router provider
@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authState = ref.watch(authProvider);
  
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.isAuthenticated;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/';
      
      // If still loading on splash, stay there
      if (isSplash && authState.isLoading) {
        return null;
      }
      
      // If not logged in and not going to login, redirect to login
      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }
      
      // If logged in and going to login or splash, redirect to home
      if (isLoggedIn && (isLoggingIn || isSplash)) {
        if (authState.isSecurityPersonnel) {
          return '/guard-home';
        } else {
          return '/resident-home';
        }
      }
      
      return null;
    },
    routes: [
      // Public routes
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/no-internet',
        name: 'no-internet',
        builder: (context, state) => const NoInternetScreen(),
      ),
      
      // Security personnel routes
      GoRoute(
        path: '/guard-home',
        name: 'guard-home',
        builder: (context, state) => const GuardHomeScreen(),
      ),
      
      // Resident routes
      ShellRoute(
        builder: (context, state, child) => _ResidentShell(child: child),
        routes: [
          GoRoute(
            path: '/resident-home',
            name: 'resident-home',
            pageBuilder: (context, state) => NoTransitionPage(child: const ResidentVisitorScreen()),
            routes: [
              GoRoute(
                path: 'complaints',
                name: 'complaints',
                builder: (context, state) => const ComplaintListScreen(),
              ),
              GoRoute(
                path: 'amenities',
                name: 'amenities',
                builder: (context, state) => const AmenityListScreen(),
              ),
              GoRoute(
                path: 'announcements',
                name: 'announcements',
                builder: (context, state) => const AnnouncementListScreen(),
              ),
              GoRoute(
                path: 'billing',
                name: 'billing',
                builder: (context, state) => const BillingScreen(),
              ),
              GoRoute(
                path: 'emergency',
                name: 'emergency',
                builder: (context, state) => const EmergencyScreen(),
              ),
              GoRoute(
                path: 'community',
                name: 'community',
                builder: (context, state) => const CommunityHubScreen(),
              ),
            ],
          ),
        ],
      ),
      
      // Deep link routes
      GoRoute(
        path: '/visitor/approve/:visitorId',
        name: 'visitor-approve',
        builder: (context, state) => VisitorApproveScreen(
          visitorId: state.pathParameters['visitorId']!,
        ),
      ),
      GoRoute(
        path: '/complaint/:complaintId',
        name: 'complaint-detail',
        builder: (context, state) => ComplaintDetailScreen(
          complaintId: state.pathParameters['complaintId']!,
        ),
      ),
      GoRoute(
        path: '/booking/:bookingId',
        name: 'booking-detail',
        builder: (context, state) => BookingDetailScreen(
          bookingId: state.pathParameters['bookingId']!,
        ),
      ),
    ],
  );
}

/// Resident shell with bottom navigation
class _ResidentShell extends StatelessWidget {
  final Widget child;
  
  const _ResidentShell({required this.child});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Notices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build_outlined),
            activeIcon: Icon(Icons.build),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Payments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Community',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
  
  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/resident-home/complaints') || 
        location.startsWith('/resident-home/amenities')) {
      return 2;
    }
    if (location.startsWith('/resident-home/announcements')) {
      return 1;
    }
    if (location.startsWith('/resident-home/billing')) {
      return 3;
    }
    if (location.startsWith('/resident-home/community')) {
      return 4;
    }
    return 0;
  }
  
  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/resident-home');
        break;
      case 1:
        context.go('/resident-home/announcements');
        break;
      case 2:
        context.go('/resident-home/complaints');
        break;
      case 3:
        context.go('/resident-home/billing');
        break;
      case 4:
        context.go('/resident-home/community');
        break;
    }
  }
}

// Placeholder screens for routes
class VisitorApproveScreen extends StatelessWidget {
  final String visitorId;
  const VisitorApproveScreen({super.key, required this.visitorId});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Approve Visitor')),
      body: Center(child: Text('Visitor Approval: $visitorId')),
    );
  }
}

class ComplaintDetailScreen extends StatelessWidget {
  final String complaintId;
  const ComplaintDetailScreen({super.key, required this.complaintId});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complaint Details')),
      body: Center(child: Text('Complaint: $complaintId')),
    );
  }
}

class BookingDetailScreen extends StatelessWidget {
  final String bookingId;
  const BookingDetailScreen({super.key, required this.bookingId});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Details')),
      body: Center(child: Text('Booking: $bookingId')),
    );
  }
}
