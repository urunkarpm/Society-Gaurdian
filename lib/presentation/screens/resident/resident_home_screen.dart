import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/logger.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/entities/visitor_entity.dart';
import '../../../domain/entities/complaint_entity.dart';
import '../../providers/auth_provider.dart';

/// Resident Home Screen - Main interface for residents
class ResidentHomeScreen extends ConsumerStatefulWidget {
  const ResidentHomeScreen({super.key});

  @override
  ConsumerState<ResidentHomeScreen> createState() => _ResidentHomeScreenState();
}

class _ResidentHomeScreenState extends ConsumerState<ResidentHomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authServiceProviders).signOut();
            },
          ),
        ],
      ),
      body: _buildBody(user),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.qr_code_outlined),
            selectedIcon: Icon(Icons.qr_code),
            label: 'My Passes',
          ),
          NavigationDestination(
            icon: Icon(Icons.complaint_outlined),
            selectedIcon: Icon(Icons.complaint),
            label: 'Complaints',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBody(UserEntity? user) {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeTab(user);
      case 1:
        return _buildPassesTab();
      case 2:
        return _buildComplaintsTab();
      case 3:
        return _buildBookingsTab();
      case 4:
        return _buildProfileTab(user);
      default:
        return _buildHomeTab(user);
    }
  }

  Widget _buildHomeTab(UserEntity? user) {
    final societyId = ref.watch(societyIdProvider);
    final flatId = ref.watch(flatIdProvider);

    return RefreshIndicator(
      onRefresh: () async {
        // Trigger refresh
        setState(() {});
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            _buildWelcomeCard(user),
            
            const SizedBox(height: 24),
            
            // Quick Actions
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildQuickActionsGrid(),
            
            const SizedBox(height: 24),
            
            // Recent Visitors
            Text(
              'Recent Visitors',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildRecentVisitorsList(societyId, flatId),
            
            const SizedBox(height: 24),
            
            // Announcements
            Text(
              'Announcements',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildAnnouncementsList(societyId),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(UserEntity? user) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryColor,
              AppTheme.primaryDark,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: user?.photoUrl != null
                      ? ClipOval(
                          child: Image.network(
                            user!.photoUrl!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.white,
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back,',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        user?.displayName ?? 'Resident',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (user?.flatId != null)
                        Text(
                          'Flat: ${user!.flatId}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildStatCard(
                  icon: Icons.directions_car,
                  label: 'Parking',
                  value: 'A-12',
                ),
                const SizedBox(width: 12),
                _buildStatCard(
                  icon: Icons.people,
                  label: 'Family',
                  value: '4',
                ),
                const SizedBox(width: 12),
                _buildStatCard(
                  icon: Icons.shopping_bag,
                  label: 'Packages',
                  value: '2',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsGrid() {
    final actions = [
      _QuickActionItem(
        icon: Icons.person_add,
        label: 'Invite Visitor',
        color: AppTheme.primaryColor,
        onTap: () {
          // TODO: Navigate to visitor invitation
        },
      ),
      _QuickActionItem(
        icon: Icons.qr_code,
        label: 'Generate Pass',
        color: AppTheme.secondaryColor,
        onTap: () {
          // TODO: Generate QR pass
        },
      ),
      _QuickActionItem(
        icon: Icons.report_problem,
        label: 'Raise Complaint',
        color: AppTheme.warningColor,
        onTap: () {
          setState(() => _selectedIndex = 2);
        },
      ),
      _QuickActionItem(
        icon: Icons.sports_tennis,
        label: 'Book Amenity',
        color: AppTheme.successColor,
        onTap: () {
          setState(() => _selectedIndex = 3);
        },
      ),
      _QuickActionItem(
        icon: Icons.payment,
        label: 'Pay Bills',
        color: AppTheme.infoColor,
        onTap: () {
          // TODO: Navigate to payments
        },
      ),
      _QuickActionItem(
        icon: Icons.security,
        label: 'Emergency',
        color: AppTheme.errorColor,
        onTap: () {
          // TODO: Show emergency dialog
        },
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return _QuickActionTile(action: action);
      },
    );
  }

  Widget _buildRecentVisitorsList(String? societyId, String? flatId) {
    if (societyId == null || flatId == null) {
      return const Center(child: Text('Loading...'));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .where('hostFlatNumber', isEqualTo: flatId)
          .orderBy('createdAt', descending: true)
          .limit(5)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final visitors = snapshot.data?.docs ?? [];

        if (visitors.isEmpty) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(Icons.visibility_off, size: 48, color: Colors.grey[400]),
                  const SizedBox(height: 8),
                  Text(
                    'No recent visitors',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: visitors.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final visitor = visitors[index].data() as Map<String, dynamic>;
            final status = VisitorStatus.values.firstWhere(
              (e) => e.name == visitor['status'],
              orElse: () => VisitorStatus.pending,
            );

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: _getStatusColor(status).withOpacity(0.2),
                child: Icon(
                  Icons.person,
                  color: _getStatusColor(status),
                ),
              ),
              title: Text(visitor['visitorName'] ?? 'Unknown'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(visitor['purpose'] ?? ''),
                  const SizedBox(height: 4),
                  Text(
                    _formatDate(visitor['createdAt']),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              trailing: _buildStatusChip(status),
            );
          },
        );
      },
    );
  }

  Widget _buildAnnouncementsList(String? societyId) {
    if (societyId == null) {
      return const Center(child: Text('Loading...'));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.announcementsCollection)
          .orderBy('createdAt', descending: true)
          .limit(3)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final announcements = snapshot.data?.docs ?? [];

        if (announcements.isEmpty) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(Icons.campaign_outlined, size: 48, color: Colors.grey[400]),
                  const SizedBox(height: 8),
                  Text(
                    'No announcements',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: announcements.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final announcement = announcements[index].data() as Map<String, dynamic>;
            
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.campaign,
                          color: AppTheme.primaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            announcement['title'] ?? 'Announcement',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      announcement['message'] ?? '',
                      style: TextStyle(color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _formatDate(announcement['createdAt']),
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPassesTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'My Passes',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Your visitor passes will appear here',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Generate new pass
            },
            icon: const Icon(Icons.add),
            label: const Text('Generate Pass'),
          ),
        ],
      ),
    );
  }

  Widget _buildComplaintsTab() {
    final societyId = ref.watch(societyIdProvider);
    final flatId = ref.watch(flatIdProvider);

    if (societyId == null || flatId == null) {
      return const Center(child: Text('Loading...'));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                'My Complaints',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              FloatingActionButton.small(
                onPressed: () {
                  // TODO: Show new complaint dialog
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(AppConstants.societiesCollection)
                .doc(societyId)
                .collection(AppConstants.complaintsCollection)
                .where('flatNumber', isEqualTo: flatId)
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final complaints = snapshot.data?.docs ?? [];

              if (complaints.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.report_outlined, size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'No complaints yet',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Raise a complaint when you need assistance',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: complaints.length,
                itemBuilder: (context, index) {
                  final complaint = complaints[index].data() as Map<String, dynamic>;
                  final status = ComplaintStatus.values.firstWhere(
                    (e) => e.name == complaint['status'],
                    orElse: () => ComplaintStatus.open,
                  );

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getComplaintStatusColor(status).withOpacity(0.2),
                        child: Icon(
                          Icons.report_problem,
                          color: _getComplaintStatusColor(status),
                        ),
                      ),
                      title: Text(complaint['subject'] ?? 'Complaint'),
                      subtitle: Text(complaint['description'] ?? ''),
                      trailing: Chip(
                        label: Text(
                          status.name.toUpperCase(),
                          style: const TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        backgroundColor: _getComplaintStatusColor(status),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBookingsTab() {
    final societyId = ref.watch(societyIdProvider);
    final flatId = ref.watch(flatIdProvider);

    if (societyId == null || flatId == null) {
      return const Center(child: Text('Loading...'));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                'Amenity Bookings',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              FloatingActionButton.small(
                onPressed: () {
                  // TODO: Show booking dialog
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(AppConstants.societiesCollection)
                .doc(societyId)
                .collection(AppConstants.bookingsCollection)
                .where('bookedByFlat', isEqualTo: flatId)
                .orderBy('bookingDate', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final bookings = snapshot.data?.docs ?? [];

              if (bookings.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'No bookings yet',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Book amenities like clubhouse, pool, etc.',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index].data() as Map<String, dynamic>;
                  
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.primaryLight,
                        child: Icon(
                          Icons.sports_tennis,
                          color: AppTheme.primaryDark,
                        ),
                      ),
                      title: Text(booking['amenityName'] ?? 'Amenity'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: ${_formatDate(booking['bookingDate'])}'),
                          Text('Time: ${booking['timeSlot'] ?? 'N/A'}'),
                        ],
                      ),
                      trailing: Chip(
                        label: Text(
                          (booking['status'] as String? ?? 'pending').toUpperCase(),
                          style: const TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        backgroundColor: booking['status'] == 'confirmed' 
                            ? AppTheme.successColor 
                            : AppTheme.warningColor,
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTab(UserEntity? user) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          CircleAvatar(
            radius: 50,
            backgroundColor: AppTheme.primaryLight,
            child: user?.photoUrl != null
                ? ClipOval(
                    child: Image.network(
                      user!.photoUrl!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    Icons.person,
                    size: 50,
                    color: AppTheme.primaryDark,
                  ),
          ),
          const SizedBox(height: 16),
          Text(
            user?.displayName ?? 'Resident',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            user?.email ?? '',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          _buildProfileTile(
            icon: Icons.home,
            title: 'Flat Number',
            subtitle: user?.flatId ?? 'N/A',
          ),
          _buildProfileTile(
            icon: Icons.phone,
            title: 'Phone',
            subtitle: user?.phoneNumber ?? 'Not added',
          ),
          const Divider(height: 32),
          _buildProfileTile(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              // TODO: Navigate to settings
            },
          ),
          _buildProfileTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {
              // TODO: Navigate to help
            },
          ),
          _buildProfileTile(
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            onTap: () {
              // TODO: Show privacy policy
            },
          ),
          _buildProfileTile(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'v${AppConstants.appVersion}',
            onTap: () {
              // TODO: Show about dialog
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryColor),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: onTap != null
          ? const Icon(Icons.chevron_right)
          : null,
      onTap: onTap,
    );
  }

  Color _getStatusColor(VisitorStatus status) {
    switch (status) {
      case VisitorStatus.approved:
      case VisitorStatus.checkedIn:
        return AppTheme.successColor;
      case VisitorStatus.rejected:
      case VisitorStatus.expired:
        return AppTheme.errorColor;
      case VisitorStatus.pending:
        return AppTheme.warningColor;
      default:
        return AppTheme.infoColor;
    }
  }

  Color _getComplaintStatusColor(ComplaintStatus status) {
    switch (status) {
      case ComplaintStatus.resolved:
      case ComplaintStatus.closed:
        return AppTheme.successColor;
      case ComplaintStatus.inProgress:
        return AppTheme.warningColor;
      case ComplaintStatus.open:
        return AppTheme.errorColor;
    }
  }

  Widget _buildStatusChip(VisitorStatus status) {
    return Chip(
      label: Text(
        status.name.toUpperCase(),
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
      backgroundColor: _getStatusColor(status),
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  String _formatDate(dynamic timestamp) {
    if (timestamp == null) return '';
    try {
      DateTime date;
      if (timestamp is Timestamp) {
        date = timestamp.toDate();
      } else if (timestamp is DateTime) {
        date = timestamp;
      } else {
        return '';
      }
      return DateFormat('MMM dd, yyyy • hh:mm a').format(date);
    } catch (e) {
      Logger.error('Date format error', error: e, tag: 'ResidentHomeScreen');
      return '';
    }
  }
}

class _QuickActionItem {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  _QuickActionItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}

class _QuickActionTile extends StatelessWidget {
  final _QuickActionItem action;

  const _QuickActionTile({required this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action.onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: action.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: action.color.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: action.color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                action.icon,
                color: action.color,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              action.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

