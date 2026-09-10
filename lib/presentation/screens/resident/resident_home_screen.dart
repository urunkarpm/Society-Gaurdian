import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/auth_provider.dart';

class ResidentHomeScreen extends ConsumerStatefulWidget {
  const ResidentHomeScreen({super.key});

  @override
  ConsumerState<ResidentHomeScreen> createState() => _ResidentHomeScreenState();
}

class _ResidentHomeScreenState extends ConsumerState<ResidentHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const _ResidentVisitorsHomeTab(),
      const _ResidentParkingTab(),
      const _ResidentVisitorHistoryTab(),
      const _ResidentServiceRequestsTab(),
      const _ResidentNoticeBoardTab(),
      const _ResidentSettingsTab(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0
              ? 'Member Dashboard'
              : (_currentIndex == 1
                  ? 'My & Visitor Parking'
                  : (_currentIndex == 2
                      ? 'Visitor History'
                      : (_currentIndex == 3
                          ? 'Service Requests'
                          : (_currentIndex == 4 ? 'Community Notice Board' : 'Settings')))),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) context.go('/login');
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.door_sliding_outlined),
            selectedIcon: Icon(Icons.door_sliding),
            label: 'Visitors',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_car_outlined),
            selectedIcon: Icon(Icons.directions_car),
            label: 'Parking',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.handyman_outlined),
            selectedIcon: Icon(Icons.handyman),
            label: 'Services',
          ),
          NavigationDestination(
            icon: Icon(Icons.campaign_outlined),
            selectedIcon: Icon(Icons.campaign),
            label: 'Notices',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

/// TAB 1: Visitors Home & Pre-Approval
class _ResidentVisitorsHomeTab extends ConsumerWidget {
  const _ResidentVisitorsHomeTab();

  void _showPreApproveDialog(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final vehicleController = TextEditingController();
    String visitorType = 'guest';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Pre-approve Visitor'),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: visitorType,
                      decoration: const InputDecoration(
                        labelText: 'Visitor Type',
                        prefixIcon: Icon(Icons.category),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'guest', child: Text('Guest / Friend')),
                        DropdownMenuItem(value: 'delivery', child: Text('Delivery Agent')),
                        DropdownMenuItem(value: 'cab', child: Text('Cab Driver')),
                        DropdownMenuItem(value: 'service', child: Text('Service Personnel')),
                      ],
                      onChanged: (val) {
                        if (val != null) setDialogState(() => visitorType = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Visitor / Company Name',
                        hintText: 'e.g. John Doe or Amazon',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (v) => v == null || v.trim().isEmpty ? 'Name required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number (Optional)',
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: vehicleController,
                      decoration: const InputDecoration(
                        labelText: 'Vehicle Number (Optional)',
                        prefixIcon: Icon(Icons.directions_car),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: isLoading ? null : () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (!formKey.currentState!.validate()) return;
                        setDialogState(() => isLoading = true);

                        try {
                          final user = FirebaseAuth.instance.currentUser;
                          final currentUserEntity = ref.read(currentUserProvider);
                          final societyId = ref.read(societyIdProvider);

                          final passCode = (100000 + (DateTime.now().millisecondsSinceEpoch % 900000)).toString();

                          final docRef = FirebaseFirestore.instance
                              .collection(AppConstants.societiesCollection)
                              .doc(societyId)
                              .collection(AppConstants.visitorsCollection)
                              .doc();

                          await docRef.set({
                            'id': docRef.id,
                            'societyId': societyId,
                            'visitorName': nameController.text.trim(),
                            'visitorPhone': phoneController.text.trim(),
                            'vehicleNumber': vehicleController.text.trim(),
                            'hostFlatNumber': currentUserEntity?.flatId ?? 'Unassigned',
                            'hostUserId': user?.uid,
                            'hostName': user?.displayName ?? user?.email ?? 'Resident',
                            'type': visitorType,
                            'status': 'preApproved',
                            'passCode': passCode,
                            'purpose': 'Pre-approved Guest Entry',
                            'createdAt': FieldValue.serverTimestamp(),
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Pre-approval Created!'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('Share this Passcode with your visitor:'),
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.blue.shade300),
                                      ),
                                      child: Text(
                                        passCode,
                                        style: const TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 4,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(ctx),
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
                            );
                          }
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Create Pass'),
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
    final user = FirebaseAuth.instance.currentUser;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Pre-approve Banner Card
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expecting a Visitor?',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Pre-approve guests, delivery drivers, or service agents for fast gate entry.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () => _showPreApproveDialog(context, ref),
                    icon: const Icon(Icons.add_moderator),
                    label: const Text('Pre-approve'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text(
            'Current & Expected Visitors',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(AppConstants.societiesCollection)
                .doc(societyId)
                .collection(AppConstants.visitorsCollection)
                .where('hostUserId', isEqualTo: user?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final docs = snapshot.data?.docs ?? [];
              final activeDocs = docs.where((doc) {
                final st = (doc.data() as Map<String, dynamic>)['status'] ?? '';
                return st == 'pending' || st == 'preApproved' || st == 'checkedIn';
              }).toList();

              if (activeDocs.isEmpty) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Icon(Icons.no_accounts_outlined, size: 48, color: Colors.grey.shade400),
                        const SizedBox(height: 12),
                        const Text('No active visitors at your gate right now.'),
                      ],
                    ),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activeDocs.length,
                itemBuilder: (context, index) {
                  final doc = activeDocs[index];
                  final data = doc.data() as Map<String, dynamic>;
                  final name = data['visitorName'] ?? 'Visitor';
                  final type = data['type'] ?? 'Guest';
                  final status = data['status'] ?? 'pending';
                  final passCode = data['passCode'];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: status == 'checkedIn' ? Colors.green.shade100 : Colors.blue.shade100,
                        child: Icon(
                          status == 'checkedIn' ? Icons.check_circle : Icons.person_pin,
                          color: status == 'checkedIn' ? Colors.green : Colors.blue,
                        ),
                      ),
                      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Type: $type • Status: ${status.toUpperCase()}'),
                      trailing: passCode != null
                          ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text('Pass: $passCode', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                            )
                          : null,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

/// TAB 2: Resident Parking & Community Visitor Parking Visibility List
class _ResidentParkingTab extends ConsumerStatefulWidget {
  const _ResidentParkingTab();

  @override
  ConsumerState<_ResidentParkingTab> createState() => _ResidentParkingTabState();
}

class _ResidentParkingTabState extends ConsumerState<_ResidentParkingTab> {
  void _showAddVehicleDialog(BuildContext context, String flatNumber) {
    final formKey = GlobalKey<FormState>();
    final vehicleNumberController = TextEditingController();
    final ownerNameController = TextEditingController(
      text: FirebaseAuth.instance.currentUser?.displayName ?? 'Resident Owner',
    );
    String vehicleType = '4 Wheeler';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Register Flat Vehicle'),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: vehicleNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Vehicle Number',
                        hintText: 'e.g. MH 01 XX 1234',
                        prefixIcon: Icon(Icons.directions_car),
                      ),
                      validator: (v) => v == null || v.trim().isEmpty ? 'Vehicle number required' : null,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: vehicleType,
                      decoration: const InputDecoration(
                        labelText: 'Vehicle Type',
                        prefixIcon: Icon(Icons.category),
                      ),
                      items: ['4 Wheeler', '2 Wheeler', 'EV 4 Wheeler', 'EV 2 Wheeler']
                          .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setDialogState(() => vehicleType = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: ownerNameController,
                      decoration: const InputDecoration(
                        labelText: 'Owner Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: isLoading ? null : () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (!formKey.currentState!.validate()) return;
                        setDialogState(() => isLoading = true);

                        try {
                          final societyId = ref.read(societyIdProvider);
                          final docRef = FirebaseFirestore.instance
                              .collection(AppConstants.societiesCollection)
                              .doc(societyId)
                              .collection('vehicles')
                              .doc();

                          await docRef.set({
                            'id': docRef.id,
                            'societyId': societyId,
                            'flatNumber': flatNumber,
                            'vehicleNumber': vehicleNumberController.text.trim(),
                            'ownerName': ownerNameController.text.trim(),
                            'vehicleType': vehicleType,
                            'userId': FirebaseAuth.instance.currentUser?.uid,
                            'createdAt': FieldValue.serverTimestamp(),
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Vehicle registered successfully!'), backgroundColor: Colors.green),
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
                child: const Text('Register Vehicle'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final societyId = ref.watch(societyIdProvider);
    final currentUserEntity = ref.watch(currentUserProvider);
    final flatNumber = currentUserEntity?.flatId ?? 'B-1204';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Section 1: Resident Assigned Slot & Vehicles
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.directions_car, color: Theme.of(context).colorScheme.onPrimaryContainer),
                          const SizedBox(width: 8),
                          Text(
                            'My Flat Parking & Vehicles',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () => _showAddVehicleDialog(context, flatNumber),
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('Add Vehicle'),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 4),

                  // Assigned Resident Parking Slot Stream
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(AppConstants.societiesCollection)
                        .doc(societyId)
                        .collection('parking_slots')
                        .where('assignedFlatNumber', isEqualTo: flatNumber)
                        .snapshots(),
                    builder: (context, snapshot) {
                      final assignedSlots = snapshot.data?.docs ?? [];
                      if (assignedSlots.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            'Flat $flatNumber • Slot: Unassigned (Contact Admin)',
                            style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                          ),
                        );
                      }

                      final slotNumbers = assignedSlots
                          .map((d) => (d.data() as Map<String, dynamic>)['slotNumber'] ?? '')
                          .join(', ');

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'Flat $flatNumber • Assigned Parking: $slotNumbers',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 8),

                  // Resident Registered Vehicles
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(AppConstants.societiesCollection)
                        .doc(societyId)
                        .collection('vehicles')
                        .where('flatNumber', isEqualTo: flatNumber)
                        .snapshots(),
                    builder: (context, snapshot) {
                      final vDocs = snapshot.data?.docs ?? [];
                      if (vDocs.isEmpty) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('🚗 No registered vehicles added for your flat yet.'),
                        );
                      }

                      return Column(
                        children: vDocs.map((doc) {
                          final vData = doc.data() as Map<String, dynamic>;
                          final vNum = vData['vehicleNumber'] ?? 'N/A';
                          final vType = vData['vehicleType'] ?? '4 Wheeler';

                          return Container(
                            margin: const EdgeInsets.only(top: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Text('🚗', style: TextStyle(fontSize: 18)),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    '$vNum ($vType)',
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Section 2: Community Visitor Parking Visibility List
          Row(
            children: [
              const Icon(Icons.local_parking, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                'Visitor Parking Directory',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Text('Real-time visibility of active visitor vehicles and assigned spots in the society.'),
          const SizedBox(height: 12),

          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(AppConstants.societiesCollection)
                .doc(societyId)
                .collection('parking_slots')
                .where('type', isEqualTo: 'visitor')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final docs = snapshot.data?.docs ?? [];
              final occupiedVisitorSlots = docs.where((doc) {
                return (doc.data() as Map<String, dynamic>)['isOccupied'] == true;
              }).toList();

              if (occupiedVisitorSlots.isEmpty) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(Icons.local_parking_outlined, size: 48, color: Colors.grey.shade400),
                        const SizedBox(height: 8),
                        const Text('No visitor vehicles currently parked in society slots.'),
                      ],
                    ),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: occupiedVisitorSlots.length,
                itemBuilder: (context, index) {
                  final data = occupiedVisitorSlots[index].data() as Map<String, dynamic>;
                  final slotNum = data['slotNumber'] ?? 'V-?';
                  final vehicleNum = data['currentVehicleNumber'] ?? 'Vehicle N/A';
                  final visitorName = data['currentVisitorName'] ?? 'Visitor';
                  final flatNum = data['currentVisitorFlatNumber'] ?? '';

                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber.shade100,
                        child: Text(
                          slotNum,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.amber.shade900,
                          ),
                        ),
                      ),
                      title: Text(
                        'Vehicle: $vehicleNum',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Visiting Flat: ${flatNum.isEmpty ? "N/A" : flatNum} • Guest: $visitorName'),
                      trailing: Chip(
                        label: Text('Spot: $slotNum', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 11)),
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

/// TAB 3: Visitor History
class _ResidentVisitorHistoryTab extends ConsumerWidget {
  const _ResidentVisitorHistoryTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyId = ref.watch(societyIdProvider);
    final user = FirebaseAuth.instance.currentUser;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .where('hostUserId', isEqualTo: user?.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data?.docs ?? [];

        if (docs.isEmpty) {
          return const Center(child: Text('No visitor history recorded.'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[index];
            final data = doc.data() as Map<String, dynamic>;
            final name = data['visitorName'] ?? 'Visitor';
            final phone = data['visitorPhone'] ?? '';
            final status = data['status'] ?? 'pending';
            final purpose = data['purpose'] ?? 'General';

            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
                  child: const Icon(Icons.person, color: AppTheme.primaryColor),
                ),
                title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Purpose: $purpose\nPhone: ${phone.isEmpty ? "N/A" : phone}'),
                trailing: Chip(
                  label: Text(status.toUpperCase(), style: const TextStyle(fontSize: 10, color: Colors.white)),
                  backgroundColor: status == 'checkedIn'
                      ? Colors.green
                      : (status == 'checkedOut' ? Colors.grey : Colors.blue),
                ),
                isThreeLine: true,
              ),
            );
          },
        );
      },
    );
  }
}

/// TAB 4: Service Requests
class _ResidentServiceRequestsTab extends ConsumerWidget {
  const _ResidentServiceRequestsTab();

  void _showNewRequestDialog(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descController = TextEditingController();
    String category = 'Plumbing';
    String urgency = 'Normal';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Raise Service Request'),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      initialValue: category,
                      decoration: const InputDecoration(
                        labelText: 'Service Needed',
                        prefixIcon: Icon(Icons.build),
                      ),
                      items: ['Plumbing', 'Electrical', 'Carpenter', 'Pest Control', 'General']
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setDialogState(() => category = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title / Issue',
                        hintText: 'e.g. Tap leaking in kitchen',
                        prefixIcon: Icon(Icons.title),
                      ),
                      validator: (v) => v == null || v.trim().isEmpty ? 'Title required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: descController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Description & Details',
                        hintText: 'Describe the issue...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      initialValue: urgency,
                      decoration: const InputDecoration(
                        labelText: 'Urgency',
                        prefixIcon: Icon(Icons.priority_high),
                      ),
                      items: ['Low', 'Normal', 'Urgent', 'Emergency']
                          .map((u) => DropdownMenuItem(value: u, child: Text(u)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setDialogState(() => urgency = val);
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: isLoading ? null : () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (!formKey.currentState!.validate()) return;
                        setDialogState(() => isLoading = true);

                        try {
                          final user = FirebaseAuth.instance.currentUser;
                          final currentUserEntity = ref.read(currentUserProvider);
                          final societyId = ref.read(societyIdProvider);

                          final reqRef = FirebaseFirestore.instance
                              .collection(AppConstants.societiesCollection)
                              .doc(societyId)
                              .collection('service_requests')
                              .doc();

                          await reqRef.set({
                            'id': reqRef.id,
                            'societyId': societyId,
                            'residentId': user?.uid,
                            'residentName': user?.displayName ?? user?.email ?? 'Resident',
                            'flatNumber': currentUserEntity?.flatId ?? 'Unassigned',
                            'category': category,
                            'title': titleController.text.trim(),
                            'description': descController.text.trim(),
                            'urgency': urgency,
                            'status': 'Open',
                            'createdAt': FieldValue.serverTimestamp(),
                            'updatedAt': FieldValue.serverTimestamp(),
                            'workLogs': [
                              {
                                'status': 'Open',
                                'notes': 'Request created by resident.',
                                'updatedBy': user?.displayName ?? 'Resident',
                                'timestamp': DateTime.now().toIso8601String(),
                              }
                            ],
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Service request submitted!'), backgroundColor: Colors.green),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
                            );
                          }
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Submit Request'),
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
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showNewRequestDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Raise Request'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(AppConstants.societiesCollection)
            .doc(societyId)
            .collection('service_requests')
            .where('residentId', isEqualTo: user?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data?.docs ?? [];

          if (docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.handyman_outlined, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  const Text('No service requests raised yet.'),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final category = data['category'] ?? 'General';
              final title = data['title'] ?? 'Request';
              final status = data['status'] ?? 'Open';
              final urgency = data['urgency'] ?? 'Normal';
              final workLogs = (data['workLogs'] as List<dynamic>?) ?? [];

              Color statusColor = Colors.blue;
              if (status == 'Completed') statusColor = Colors.green;
              if (status == 'Waiting for Part') statusColor = Colors.orange;
              if (status == 'In Progress') statusColor = Colors.purple;

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ExpansionTile(
                  leading: CircleAvatar(
                    backgroundColor: statusColor.withValues(alpha: 0.15),
                    child: Icon(
                      category == 'Plumbing'
                          ? Icons.plumbing
                          : (category == 'Electrical' ? Icons.electrical_services : Icons.build),
                      color: statusColor,
                    ),
                  ),
                  title: Text('$category: $title', style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Urgency: $urgency • Status: $status'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Real-time Updates & Logs:', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          ...workLogs.map((log) {
                            final lMap = log as Map<String, dynamic>;
                            final lStatus = lMap['status'] ?? '';
                            final lNotes = lMap['notes'] ?? '';
                            final lBy = lMap['updatedBy'] ?? 'Staff';

                            return Container(
                              margin: const EdgeInsets.only(top: 6),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    lStatus == 'Completed' ? Icons.check_circle : Icons.info_outline,
                                    size: 16,
                                    color: lStatus == 'Completed' ? Colors.green : Colors.blue,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text('[$lStatus] $lNotes ($lBy)')),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// TAB 5: Community Notice Board
class _ResidentNoticeBoardTab extends ConsumerWidget {
  const _ResidentNoticeBoardTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyId = ref.watch(societyIdProvider);

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('notices')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data?.docs ?? [];

        if (docs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.campaign_outlined, size: 64, color: Colors.grey.shade400),
                const SizedBox(height: 16),
                const Text('No community notices posted.'),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[index];
            final data = doc.data() as Map<String, dynamic>;
            final title = data['title'] ?? 'Notice';
            final content = data['content'] ?? '';
            final category = data['category'] ?? 'General';

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          label: Text(category),
                          backgroundColor: Colors.blue.shade50,
                        ),
                        const Icon(Icons.push_pin, size: 18, color: Colors.orange),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(content, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// TAB 6: Settings & Profile
class _ResidentSettingsTab extends ConsumerWidget {
  const _ResidentSettingsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser;
    final currentUserEntity = ref.watch(currentUserProvider);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: AppTheme.primaryColor,
              child: Text(
                (user?.displayName ?? user?.email ?? 'R')[0].toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              user?.displayName ?? 'Resident Member',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text('${user?.email ?? ''}\nFlat / Unit: ${currentUserEntity?.flatId ?? 'Assigned'}'),
            isThreeLine: true,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: const Text('Visitor Notifications'),
                subtitle: const Text('Receive push alerts for arriving visitors'),
                trailing: Switch(
                  value: true,
                  onChanged: (val) {},
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.lock_outline),
                title: const Text('Privacy & Security'),
                onTap: () {},
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: const Text('Help & Support'),
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            if (context.mounted) context.go('/login');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
        ),
      ],
    );
  }
}
