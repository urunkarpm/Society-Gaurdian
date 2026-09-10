import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/user_entity.dart';
import '../providers/auth_provider.dart';
import 'admin/admin_inventory_screen.dart';
import 'admin/admin_verifications_screen.dart';
import 'admin/admin_flat_members_screen.dart';

class AdminDashboardScreen extends ConsumerStatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  ConsumerState<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends ConsumerState<AdminDashboardScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const AdminInventoryScreen(), // Inventory Management (Fire extinguishers, lights, custom)
    const _AdminServiceRequestsScreen(), // Job List & Task Assignment
    const _AdminWorkerProfilesScreen(), // Worker Profiles
    const _AdminSocietyConfigScreen(), // Society Configuration (Wings, Floors, Rooms)
    const AdminVerificationsScreen(), // Verifications
    const AdminFlatMembersScreen(), // Flat & Member Management
    const _AdminSettingsScreen(), // Settings
  ];

  @override
  Widget build(BuildContext context) {
    final canToggleRoles = ref.watch(canToggleRolesProvider);
    final activeRole = ref.watch(activeRoleProvider);
    final isOwner = ref.watch(isOwnerProvider);
    
    return Scaffold(
      body: Row(
        children: [
          // Navigation Rail for Desktop/Tablet
          NavigationRail(
            extended: MediaQuery.of(context).size.width > 600,
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) => setState(() => _currentIndex = index),
            labelType: NavigationRailLabelType.all,
            leading: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Icon(
                    isOwner ? Icons.home_work_outlined : Icons.admin_panel_settings,
                    size: 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                if (canToggleRoles) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.outline),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          activeRole == UserRole.admin ? Icons.admin_panel_settings : Icons.home_work,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          activeRole == UserRole.admin ? 'Admin' : 'Owner',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.swap_horiz, size: 20),
                    onPressed: () {
                      ref.read(activeRoleProvider.notifier).toggleRole();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Switched to ${activeRole == UserRole.admin ? 'Owner' : 'Admin'} mode'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    tooltip: 'Toggle Role',
                  ),
                ],
              ],
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.inventory_2_outlined),
                selectedIcon: Icon(Icons.inventory_2),
                label: Text('Inventory'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.assignment_outlined),
                selectedIcon: Icon(Icons.assignment),
                label: Text('Job List'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.badge_outlined),
                selectedIcon: Icon(Icons.badge),
                label: Text('Workers'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.apartment_outlined),
                selectedIcon: Icon(Icons.apartment),
                label: Text('Society Config'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.verified_user_outlined),
                selectedIcon: Icon(Icons.verified_user),
                label: Text('Verifications'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people_outlined),
                selectedIcon: Icon(Icons.people),
                label: Text('Flat Members'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      if (context.mounted) context.go('/login');
                    },
                    tooltip: 'Logout',
                  ),
                ),
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: _screens[_currentIndex]),
        ],
      ),
    );
  }
}

/// Admin Service Requests / Job List & Helper Task Assignment
class _AdminServiceRequestsScreen extends ConsumerWidget {
  const _AdminServiceRequestsScreen();

  void _showAssignWorkerDialog(BuildContext context, WidgetRef ref, String docId, Map<String, dynamic> reqData) {
    String? selectedWorkerId;
    String? selectedWorkerName;
    final wingController = TextEditingController(text: reqData['wing'] ?? '');
    final roomController = TextEditingController(text: reqData['flatNumber'] ?? reqData['roomNumber'] ?? '');
    final notesController = TextEditingController();
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          final societyId = ref.read(societyIdProvider);

          return AlertDialog(
            title: const Text('Assign Job to Helper'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Job: ${reqData['category']} - ${reqData['title']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: wingController,
                          decoration: const InputDecoration(labelText: 'Wing / Building', prefixIcon: Icon(Icons.domain)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          controller: roomController,
                          decoration: const InputDecoration(labelText: 'Room / Flat No', prefixIcon: Icon(Icons.meeting_room)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('societies')
                        .doc(societyId)
                        .collection('workers')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const CircularProgressIndicator();
                      final workers = snapshot.data!.docs;

                      if (workers.isEmpty) {
                        return const Text('No worker profiles defined yet. Create worker profiles first.');
                      }

                      return DropdownButtonFormField<String>(
                        value: selectedWorkerId,
                        decoration: const InputDecoration(labelText: 'Select Helper / Worker', prefixIcon: Icon(Icons.person)),
                        items: workers.map((wDoc) {
                          final wData = wDoc.data() as Map<String, dynamic>;
                          final name = wData['name'] ?? 'Worker';
                          final skill = wData['skill'] ?? 'General';
                          return DropdownMenuItem<String>(
                            value: wDoc.id,
                            child: Text('$name ($skill)'),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            final selectedDoc = workers.firstWhere((w) => w.id == val);
                            final wData = selectedDoc.data() as Map<String, dynamic>;
                            setDialogState(() {
                              selectedWorkerId = val;
                              selectedWorkerName = wData['name'];
                            });
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: notesController,
                    decoration: const InputDecoration(labelText: 'Admin Instructions', hintText: 'Specific directions for helper'),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: isLoading ? null : () => Navigator.pop(context), child: const Text('Cancel')),
              FilledButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        setDialogState(() => isLoading = true);
                        try {
                          await FirebaseFirestore.instance
                              .collection('societies')
                              .doc(societyId)
                              .collection('service_requests')
                              .doc(docId)
                              .update({
                            'assignedWorkerId': selectedWorkerId,
                            'assignedWorkerName': selectedWorkerName ?? 'Helper',
                            'wing': wingController.text.trim(),
                            'flatNumber': roomController.text.trim(),
                            'status': 'In Progress',
                            'workLogs': FieldValue.arrayUnion([
                              {
                                'status': 'Assigned',
                                'notes': 'Assigned to $selectedWorkerName. Note: ${notesController.text.trim()}',
                                'updatedBy': 'Admin',
                                'timestamp': DateTime.now().toIso8601String(),
                              }
                            ]),
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Job assigned successfully!'), backgroundColor: Colors.green),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                          }
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Assign Job'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyId = ref.watch(societyIdProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Job List & Service Requests')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('societies')
            .doc(societyId)
            .collection('service_requests')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());

          final docs = snapshot.data?.docs ?? [];
          if (docs.isEmpty) return const Center(child: Text('No service requests raised yet.'));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final category = data['category'] ?? 'General';
              final title = data['title'] ?? 'Request';
              final status = data['status'] ?? 'Open';
              final wing = data['wing'] ?? '';
              final room = data['flatNumber'] ?? data['roomNumber'] ?? 'N/A';
              final worker = data['assignedWorkerName'] ?? 'Unassigned';

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(child: Icon(category == 'Plumbing' ? Icons.plumbing : Icons.build)),
                  title: Text('$category: $title', style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Location: Wing $wing, Room $room\nWorker: $worker • Status: $status'),
                  trailing: ElevatedButton.icon(
                    onPressed: () => _showAssignWorkerDialog(context, ref, doc.id, data),
                    icon: const Icon(Icons.person_add, size: 16),
                    label: const Text('Assign'),
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Admin Worker Profiles Screen
class _AdminWorkerProfilesScreen extends ConsumerWidget {
  const _AdminWorkerProfilesScreen();

  void _showAddWorkerDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    String skill = 'Electrician';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Define Worker Profile'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: skill,
                  decoration: const InputDecoration(labelText: 'Primary Skill', prefixIcon: Icon(Icons.handyman)),
                  items: ['Electrician', 'Plumber', 'Carpenter', 'Pest Control', 'General Staff']
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) setDialogState(() => skill = val);
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Worker Name', prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Phone Number', prefixIcon: Icon(Icons.phone)),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: isLoading ? null : () => Navigator.pop(context), child: const Text('Cancel')),
              FilledButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        setDialogState(() => isLoading = true);
                        try {
                          final societyId = ref.read(societyIdProvider);
                          final docRef = FirebaseFirestore.instance
                              .collection('societies')
                              .doc(societyId)
                              .collection('workers')
                              .doc();

                          await docRef.set({
                            'id': docRef.id,
                            'name': nameController.text.trim(),
                            'phoneNumber': phoneController.text.trim(),
                            'skill': skill,
                            'isActive': true,
                            'createdAt': FieldValue.serverTimestamp(),
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Worker profile created!'), backgroundColor: Colors.green),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: const Text('Save Profile'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyId = ref.watch(societyIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Worker & Helper Profiles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () => _showAddWorkerDialog(context, ref),
            tooltip: 'Add Worker Profile',
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('societies')
            .doc(societyId)
            .collection('workers')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());

          final docs = snapshot.data?.docs ?? [];
          if (docs.isEmpty) return const Center(child: Text('No worker profiles defined. Tap + to add.'));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final name = data['name'] ?? 'Worker';
              final skill = data['skill'] ?? 'General';
              final phone = data['phoneNumber'] ?? 'N/A';

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.badge)),
                  title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Skill: $skill • Phone: $phone'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => doc.reference.delete(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Admin Society Configuration Screen (Buildings, Wings, Floors, Rooms)
class _AdminSocietyConfigScreen extends ConsumerWidget {
  const _AdminSocietyConfigScreen();

  void _showAddBuildingDialog(BuildContext context, WidgetRef ref) {
    final buildingController = TextEditingController();
    final wingController = TextEditingController();
    final floorsController = TextEditingController(text: '4');
    final roomsPerFloorController = TextEditingController(text: '4');
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Configure Building Structure'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: buildingController,
                    decoration: const InputDecoration(labelText: 'Building / Block Name', prefixIcon: Icon(Icons.domain)),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: wingController,
                    decoration: const InputDecoration(labelText: 'Wing Name (e.g. Wing A)', prefixIcon: Icon(Icons.flag)),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: floorsController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Total Floors', prefixIcon: Icon(Icons.layers)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          controller: roomsPerFloorController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Rooms / Floor', prefixIcon: Icon(Icons.meeting_room)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: isLoading ? null : () => Navigator.pop(context), child: const Text('Cancel')),
              FilledButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        setDialogState(() => isLoading = true);
                        try {
                          final societyId = ref.read(societyIdProvider);
                          final docRef = FirebaseFirestore.instance
                              .collection('societies')
                              .doc(societyId)
                              .collection('buildings')
                              .doc();

                          await docRef.set({
                            'id': docRef.id,
                            'buildingName': buildingController.text.trim(),
                            'wingName': wingController.text.trim(),
                            'floors': int.tryParse(floorsController.text) ?? 1,
                            'roomsPerFloor': int.tryParse(roomsPerFloorController.text) ?? 1,
                            'createdAt': FieldValue.serverTimestamp(),
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Building configured successfully!'), backgroundColor: Colors.green),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: const Text('Save Structure'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyId = ref.watch(societyIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Society Configuration'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_business),
            onPressed: () => _showAddBuildingDialog(context, ref),
            tooltip: 'Add Building / Wing',
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('societies')
            .doc(societyId)
            .collection('buildings')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());

          final docs = snapshot.data?.docs ?? [];
          if (docs.isEmpty) return const Center(child: Text('No buildings configured yet. Tap + to configure buildings, wings, floors, and rooms.'));

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final bName = data['buildingName'] ?? 'Building';
              final wName = data['wingName'] ?? 'Wing A';
              final floors = data['floors'] ?? 1;
              final rooms = data['roomsPerFloor'] ?? 1;

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.apartment)),
                  title: Text('$bName - $wName', style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Floors: $floors • Rooms per floor: $rooms (Total Units: ${floors * rooms})'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => doc.reference.delete(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Admin Settings Screen
class _AdminSettingsScreen extends StatelessWidget {
  const _AdminSettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Society Manager Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text('Manager Administration'),
              subtitle: Text('Configure global society parameters and rules'),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Admin Notifications'),
                  trailing: Switch(value: true, onChanged: (v) {}),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.security),
                  title: const Text('Security & Access Roles'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
