import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/logger.dart';
import '../../../domain/entities/visitor_entity.dart';
import '../../providers/auth_provider.dart';

/// Guard Home Screen - Main interface for security personnel
class GuardHomeScreen extends ConsumerStatefulWidget {
  const GuardHomeScreen({super.key});

  @override
  ConsumerState<GuardHomeScreen> createState() => _GuardHomeScreenState();
}

class _GuardHomeScreenState extends ConsumerState<GuardHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Guard Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (mounted) context.go('/');
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.shield_outlined), text: 'Visitor Mgt'),
            Tab(icon: Icon(Icons.inventory_2_outlined), text: 'Packages'),
            Tab(icon: Icon(Icons.warning_amber_rounded), text: 'Report Incident'),
            Tab(icon: Icon(Icons.history), text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _GuardVisitorManagementTab(),
          _GuardPackageManagementTab(),
          _GuardIncidentReportingTab(),
          _GuardHistoryTab(),
        ],
      ),
    );
  }
}

/// TAB 1: Visitor Management (Scan, Quick Check-in/Out, Manual Entry)
class _GuardVisitorManagementTab extends ConsumerStatefulWidget {
  const _GuardVisitorManagementTab();

  @override
  ConsumerState<_GuardVisitorManagementTab> createState() => _GuardVisitorManagementTabState();
}

class _GuardVisitorManagementTabState extends ConsumerState<_GuardVisitorManagementTab> {
  final _visitorNameController = TextEditingController();
  final _visitorPhoneController = TextEditingController();
  final _purposeController = TextEditingController();
  final _flatNumberController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  VisitorType _selectedType = VisitorType.guest;
  String _selectedGate = AppConstants.gateMain;
  bool _isSaving = false;

  @override
  void dispose() {
    _visitorNameController.dispose();
    _visitorPhoneController.dispose();
    _purposeController.dispose();
    _flatNumberController.dispose();
    _vehicleNumberController.dispose();
    super.dispose();
  }

  Future<void> _registerVisitor() async {
    if (_visitorNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter visitor name')),
      );
      return;
    }

    try {
      setState(() => _isSaving = true);
      final societyId = ref.read(societyIdProvider);
      if (societyId == null) throw Exception('Society ID not found');

      final visitorData = {
        'societyId': societyId,
        'gateName': _selectedGate,
        'visitorName': _visitorNameController.text.trim(),
        'visitorPhone': _visitorPhoneController.text.trim(),
        'purpose': _purposeController.text.trim(),
        'hostFlatNumber': _flatNumberController.text.trim(),
        'vehicleNumber': _vehicleNumberController.text.trim(),
        'type': _selectedType.name,
        'status': VisitorStatus.checkedIn.name,
        'createdAt': FieldValue.serverTimestamp(),
        'createdBy': FirebaseAuth.instance.currentUser?.uid,
      };

      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .add(visitorData);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Visitor checked in successfully!'), backgroundColor: Colors.green),
        );
        _visitorNameController.clear();
        _visitorPhoneController.clear();
        _purposeController.clear();
        _flatNumberController.clear();
        _vehicleNumberController.clear();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quick Gate Scanner', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: MobileScanner(
                        onDetect: (capture) {
                          for (final barcode in capture.barcodes) {
                            Logger.log('Barcode: ${barcode.rawValue}');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Register Visitor Entry', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const Divider(),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<VisitorType>(
                    initialValue: _selectedType,
                    decoration: const InputDecoration(labelText: 'Visitor Type', prefixIcon: Icon(Icons.category)),
                    items: VisitorType.values.map((type) {
                      return DropdownMenuItem(value: type, child: Text(type.name.toUpperCase()));
                    }).toList(),
                    onChanged: (val) => setState(() => _selectedType = val!),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _visitorNameController,
                    decoration: const InputDecoration(labelText: 'Visitor Name', prefixIcon: Icon(Icons.person)),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _visitorPhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(labelText: 'Phone Number', prefixIcon: Icon(Icons.phone)),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _flatNumberController,
                          decoration: const InputDecoration(labelText: 'Flat / Room No', prefixIcon: Icon(Icons.home)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: _selectedGate,
                          decoration: const InputDecoration(labelText: 'Gate', prefixIcon: Icon(Icons.door_front_door)),
                          items: [AppConstants.gateMain, AppConstants.gateSide, AppConstants.gateService]
                              .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                              .toList(),
                          onChanged: (v) => setState(() => _selectedGate = v!),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _purposeController,
                    decoration: const InputDecoration(labelText: 'Purpose of Visit', prefixIcon: Icon(Icons.note)),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: _isSaving ? null : _registerVisitor,
                    icon: const Icon(Icons.login),
                    label: Text(_isSaving ? 'Checking In...' : 'Check In Visitor'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// TAB 2: Package Management (Log incoming parcels & mark collected)
class _GuardPackageManagementTab extends ConsumerStatefulWidget {
  const _GuardPackageManagementTab();

  @override
  ConsumerState<_GuardPackageManagementTab> createState() => _GuardPackageManagementTabState();
}

class _GuardPackageManagementTabState extends ConsumerState<_GuardPackageManagementTab> {
  final _courierController = TextEditingController();
  final _flatController = TextEditingController();
  final _recipientController = TextEditingController();
  final _trackingController = TextEditingController();
  bool _isSaving = false;

  @override
  void dispose() {
    _courierController.dispose();
    _flatController.dispose();
    _recipientController.dispose();
    _trackingController.dispose();
    super.dispose();
  }

  Future<void> _logPackage() async {
    if (_courierController.text.trim().isEmpty || _flatController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Courier name and Flat number are required')),
      );
      return;
    }

    try {
      setState(() => _isSaving = true);
      final societyId = ref.read(societyIdProvider);

      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('packages')
          .add({
        'courierCompany': _courierController.text.trim(),
        'flatNumber': _flatController.text.trim(),
        'recipientName': _recipientController.text.trim(),
        'trackingNumber': _trackingController.text.trim(),
        'status': 'Arrived at Gate',
        'receivedAt': FieldValue.serverTimestamp(),
        'loggedBy': FirebaseAuth.instance.currentUser?.uid,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Package logged successfully!'), backgroundColor: Colors.green),
        );
        _courierController.clear();
        _flatController.clear();
        _recipientController.clear();
        _trackingController.clear();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final societyId = ref.watch(societyIdProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Log New Package / Delivery', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const Divider(),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _courierController,
                    decoration: const InputDecoration(labelText: 'Courier / Provider (e.g. Amazon, BlueDart)', prefixIcon: Icon(Icons.local_shipping)),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _flatController,
                          decoration: const InputDecoration(labelText: 'Flat Number', prefixIcon: Icon(Icons.home)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          controller: _recipientController,
                          decoration: const InputDecoration(labelText: 'Recipient Name', prefixIcon: Icon(Icons.person)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _trackingController,
                    decoration: const InputDecoration(labelText: 'Tracking Number (Optional)', prefixIcon: Icon(Icons.qr_code)),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: _isSaving ? null : _logPackage,
                    icon: const Icon(Icons.add_box),
                    label: Text(_isSaving ? 'Logging Package...' : 'Log Package Arrival'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('Packages at Gate', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(AppConstants.societiesCollection)
                .doc(societyId)
                .collection('packages')
                .where('status', isEqualTo: 'Arrived at Gate')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
              if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());

              final docs = snapshot.data?.docs ?? [];
              if (docs.isEmpty) return const Card(child: Padding(padding: EdgeInsets.all(16), child: Text('No packages pending collection.')));

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];
                  final data = doc.data() as Map<String, dynamic>;
                  final courier = data['courierCompany'] ?? 'Package';
                  final flat = data['flatNumber'] ?? 'Unknown';
                  final recipient = data['recipientName'] ?? 'Resident';

                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.markunread_mailbox)),
                      title: Text('$courier -> Flat $flat', style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Recipient: $recipient'),
                      trailing: FilledButton(
                        onPressed: () async {
                          await doc.reference.update({
                            'status': 'Collected',
                            'collectedAt': FieldValue.serverTimestamp(),
                          });
                        },
                        child: const Text('Mark Delivered'),
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

/// TAB 3: Incident Reporting (Report to Admins)
class _GuardIncidentReportingTab extends ConsumerStatefulWidget {
  const _GuardIncidentReportingTab();

  @override
  ConsumerState<_GuardIncidentReportingTab> createState() => _GuardIncidentReportingTabState();
}

class _GuardIncidentReportingTabState extends ConsumerState<_GuardIncidentReportingTab> {
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();
  final _locationController = TextEditingController();
  String _severity = 'Medium';
  bool _isSaving = false;

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _reportIncident() async {
    if (_titleController.text.trim().isEmpty || _detailsController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter incident title and details')),
      );
      return;
    }

    try {
      setState(() => _isSaving = true);
      final societyId = ref.read(societyIdProvider);

      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('incidents')
          .add({
        'title': _titleController.text.trim(),
        'details': _detailsController.text.trim(),
        'location': _locationController.text.trim(),
        'severity': _severity,
        'status': 'Reported',
        'reportedBy': FirebaseAuth.instance.currentUser?.uid,
        'reportedByName': FirebaseAuth.instance.currentUser?.displayName ?? 'Security Guard',
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incident reported to Admins!'), backgroundColor: Colors.red),
        );
        _titleController.clear();
        _detailsController.clear();
        _locationController.clear();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
                  const SizedBox(width: 8),
                  Text('Report Incident to Society Admins', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _severity,
                decoration: const InputDecoration(labelText: 'Severity Level', prefixIcon: Icon(Icons.error_outline)),
                items: ['Low', 'Medium', 'High', 'Critical / Emergency']
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (v) => setState(() => _severity = v!),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Incident Summary / Title', prefixIcon: Icon(Icons.title)),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location / Area in Society', prefixIcon: Icon(Icons.place)),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _detailsController,
                maxLines: 4,
                decoration: const InputDecoration(labelText: 'Detailed Incident Description', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _isSaving ? null : _reportIncident,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                icon: const Icon(Icons.send),
                label: Text(_isSaving ? 'Submitting Report...' : 'Report Incident Immediately'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// TAB 4: Entry/Exit & Package History
class _GuardHistoryTab extends ConsumerWidget {
  const _GuardHistoryTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyId = ref.watch(societyIdProvider);

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .orderBy('createdAt', descending: true)
          .limit(50)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());

        final visitors = snapshot.data?.docs ?? [];
        if (visitors.isEmpty) return const Center(child: Text('No visitor history found.'));

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: visitors.length,
          itemBuilder: (context, index) {
            final visitor = visitors[index].data() as Map<String, dynamic>;
            final name = visitor['visitorName'] ?? 'Unknown';
            final flat = visitor['hostFlatNumber'] ?? 'N/A';
            final status = visitor['status'] ?? 'pending';

            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: status == 'checkedIn' ? Colors.green.shade100 : Colors.blue.shade100,
                  child: Text(name.isNotEmpty ? name[0].toUpperCase() : '?'),
                ),
                title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Flat: $flat • Status: ${status.toUpperCase()}'),
              ),
            );
          },
        );
      },
    );
  }
}
