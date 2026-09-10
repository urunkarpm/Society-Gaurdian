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
    _tabController = TabController(length: 5, vsync: this);
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
            Tab(icon: Icon(Icons.local_parking_outlined), text: 'Visitor Parking'),
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
          _GuardVisitorParkingTab(),
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
  String? _selectedParkingSlotId;
  String? _selectedParkingSlotNumber;
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

      final visitorRef = FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .doc();

      final visitorData = {
        'id': visitorRef.id,
        'societyId': societyId,
        'gateName': _selectedGate,
        'visitorName': _visitorNameController.text.trim(),
        'visitorPhone': _visitorPhoneController.text.trim(),
        'purpose': _purposeController.text.trim(),
        'hostFlatNumber': _flatNumberController.text.trim(),
        'vehicleNumber': _vehicleNumberController.text.trim(),
        'parkingSlotId': _selectedParkingSlotId,
        'parkingSlotNumber': _selectedParkingSlotNumber,
        'type': _selectedType.name,
        'status': VisitorStatus.checkedIn.name,
        'createdAt': FieldValue.serverTimestamp(),
        'createdBy': FirebaseAuth.instance.currentUser?.uid,
      };

      await visitorRef.set(visitorData);

      if (_selectedParkingSlotId != null) {
        await FirebaseFirestore.instance
            .collection(AppConstants.societiesCollection)
            .doc(societyId)
            .collection('parking_slots')
            .doc(_selectedParkingSlotId)
            .update({
          'isOccupied': true,
          'currentVehicleNumber': _vehicleNumberController.text.trim(),
          'currentVisitorId': visitorRef.id,
          'currentVisitorName': _visitorNameController.text.trim(),
          'currentVisitorFlatNumber': _flatNumberController.text.trim(),
          'occupiedAt': FieldValue.serverTimestamp(),
        });
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Visitor checked in successfully!'), backgroundColor: Colors.green),
        );
        _visitorNameController.clear();
        _visitorPhoneController.clear();
        _purposeController.clear();
        _flatNumberController.clear();
        _vehicleNumberController.clear();
        setState(() {
          _selectedParkingSlotId = null;
          _selectedParkingSlotNumber = null;
        });
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
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _vehicleNumberController,
                    decoration: const InputDecoration(labelText: 'Vehicle Number (Optional)', hintText: 'e.g. MH 01 AB 1234', prefixIcon: Icon(Icons.directions_car)),
                  ),
                  const SizedBox(height: 12),
                  // Visitor Parking Spot Selection
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection(AppConstants.societiesCollection)
                        .doc(ref.watch(societyIdProvider))
                        .collection('parking_slots')
                        .where('type', isEqualTo: 'visitor')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const SizedBox.shrink();

                      final slots = snapshot.data!.docs;
                      final availableSlots = slots.where((s) {
                        final data = s.data() as Map<String, dynamic>;
                        return data['isOccupied'] != true;
                      }).toList();

                      return DropdownButtonFormField<String>(
                        initialValue: _selectedParkingSlotId,
                        decoration: const InputDecoration(
                          labelText: 'Assign Visitor Parking Slot (Optional)',
                          hintText: 'Select available visitor spot',
                          prefixIcon: Icon(Icons.local_parking),
                        ),
                        items: [
                          const DropdownMenuItem<String>(
                            value: null,
                            child: Text('No Parking Allocated'),
                          ),
                          ...availableSlots.map((sDoc) {
                            final sData = sDoc.data() as Map<String, dynamic>;
                            final slotNum = sData['slotNumber'] ?? 'Slot';
                            final category = sData['category'] ?? 'standard';
                            final zone = sData['floorZone'] ?? '';
                            return DropdownMenuItem<String>(
                              value: sDoc.id,
                              child: Text('$slotNum ($category - $zone)'),
                            );
                          }),
                        ],
                        onChanged: (val) {
                          setState(() {
                            _selectedParkingSlotId = val;
                            if (val != null) {
                              final matched = availableSlots.firstWhere((s) => s.id == val);
                              _selectedParkingSlotNumber = (matched.data() as Map<String, dynamic>)['slotNumber'];
                            } else {
                              _selectedParkingSlotNumber = null;
                            }
                          });
                        },
                      );
                    },
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

/// TAB 2: Guard Visitor Parking Map & Detection
class _GuardVisitorParkingTab extends ConsumerStatefulWidget {
  const _GuardVisitorParkingTab();

  @override
  ConsumerState<_GuardVisitorParkingTab> createState() => _GuardVisitorParkingTabState();
}

class _GuardVisitorParkingTabState extends ConsumerState<_GuardVisitorParkingTab> {
  final _searchController = TextEditingController();
  String _filterOccupancy = 'all'; // 'all', 'empty', 'occupied'
  String _filterCategory = 'all'; // 'all', 'standard', 'ev', 'guest', 'temporary'

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _releaseSlot(String slotId, String? currentVisitorId) async {
    final societyId = ref.read(societyIdProvider);
    if (societyId == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Vacate Parking Slot'),
        content: const Text('Are you sure you want to mark this visitor parking spot as empty?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Release Spot'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('parking_slots')
          .doc(slotId)
          .update({
        'isOccupied': false,
        'currentVehicleNumber': FieldValue.delete(),
        'currentVisitorId': FieldValue.delete(),
        'currentVisitorName': FieldValue.delete(),
        'currentVisitorFlatNumber': FieldValue.delete(),
        'occupiedAt': FieldValue.delete(),
      });

      if (currentVisitorId != null && currentVisitorId.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection(AppConstants.societiesCollection)
            .doc(societyId)
            .collection(AppConstants.visitorsCollection)
            .doc(currentVisitorId)
            .update({
          'status': VisitorStatus.checkedOut.name,
          'actualDepartureTime': FieldValue.serverTimestamp(),
        });
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Parking slot marked empty.'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error releasing spot: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final societyId = ref.watch(societyIdProvider);

    return Scaffold(
      body: Column(
        children: [
          // Empty Spot Detection & Filter Header
          Container(
            padding: const EdgeInsets.all(12),
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Search spot number or vehicle number...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Text('Occupancy:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(width: 6),
                      ChoiceChip(
                        label: const Text('All', style: TextStyle(fontSize: 12)),
                        selected: _filterOccupancy == 'all',
                        onSelected: (s) => setState(() => _filterOccupancy = 'all'),
                      ),
                      const SizedBox(width: 4),
                      ChoiceChip(
                        label: const Text('Empty (Vacant)', style: TextStyle(fontSize: 12)),
                        selected: _filterOccupancy == 'empty',
                        selectedColor: Colors.green.shade100,
                        onSelected: (s) => setState(() => _filterOccupancy = 'empty'),
                      ),
                      const SizedBox(width: 4),
                      ChoiceChip(
                        label: const Text('Occupied', style: TextStyle(fontSize: 12)),
                        selected: _filterOccupancy == 'occupied',
                        selectedColor: Colors.red.shade100,
                        onSelected: (s) => setState(() => _filterOccupancy = 'occupied'),
                      ),
                      const SizedBox(width: 12),
                      const Text('Type:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(width: 6),
                      ChoiceChip(
                        label: const Text('All Categories', style: TextStyle(fontSize: 12)),
                        selected: _filterCategory == 'all',
                        onSelected: (s) => setState(() => _filterCategory = 'all'),
                      ),
                      const SizedBox(width: 4),
                      ChoiceChip(
                        label: const Text('⚡ EV', style: TextStyle(fontSize: 12)),
                        selected: _filterCategory == 'ev',
                        onSelected: (s) => setState(() => _filterCategory = 'ev'),
                      ),
                      const SizedBox(width: 4),
                      ChoiceChip(
                        label: const Text('Guest', style: TextStyle(fontSize: 12)),
                        selected: _filterCategory == 'guest',
                        onSelected: (s) => setState(() => _filterCategory = 'guest'),
                      ),
                      const SizedBox(width: 4),
                      ChoiceChip(
                        label: const Text('Temp', style: TextStyle(fontSize: 12)),
                        selected: _filterCategory == 'temporary',
                        onSelected: (s) => setState(() => _filterCategory = 'temporary'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Visitor Parking Map Grid
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
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

                final allVisitorDocs = snapshot.data?.docs ?? [];
                if (allVisitorDocs.isEmpty) {
                  return const Center(
                    child: Text('No Visitor Parking slots created by Admin yet.\nGo to Admin > Parking to create slots like V-1, V-2, V-32.'),
                  );
                }

                final searchQuery = _searchController.text.trim().toLowerCase();

                final filteredDocs = allVisitorDocs.where((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final slotNum = (data['slotNumber'] ?? '').toString().toLowerCase();
                  final vehicleNum = (data['currentVehicleNumber'] ?? '').toString().toLowerCase();
                  final visitorName = (data['currentVisitorName'] ?? '').toString().toLowerCase();
                  final isOccupied = data['isOccupied'] == true;
                  final category = (data['category'] ?? 'standard').toString().toLowerCase();

                  // Search match
                  if (searchQuery.isNotEmpty &&
                      !slotNum.contains(searchQuery) &&
                      !vehicleNum.contains(searchQuery) &&
                      !visitorName.contains(searchQuery)) {
                    return false;
                  }

                  // Occupancy match
                  if (_filterOccupancy == 'empty' && isOccupied) return false;
                  if (_filterOccupancy == 'occupied' && !isOccupied) return false;

                  // Category match
                  if (_filterCategory != 'all' && category != _filterCategory) return false;

                  return true;
                }).toList();

                final emptyCount = allVisitorDocs.where((d) => (d.data() as Map<String, dynamic>)['isOccupied'] != true).length;
                final occupiedCount = allVisitorDocs.length - emptyCount;

                return Column(
                  children: [
                    // Detection Summary Banner
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: Colors.blue.shade50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Visitor Spots: ${allVisitorDocs.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: Colors.green.shade100, borderRadius: BorderRadius.circular(6)),
                                child: Text('Vacant: $emptyCount', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade900)),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: BorderRadius.circular(6)),
                                child: Text('Occupied: $occupiedCount', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade900)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Grid Parking Map
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: filteredDocs.length,
                        itemBuilder: (context, index) {
                          final doc = filteredDocs[index];
                          final data = doc.data() as Map<String, dynamic>;
                          final slotNumber = data['slotNumber'] ?? 'N/A';
                          final isOccupied = data['isOccupied'] == true;
                          final category = data['category'] ?? 'standard';
                          final zone = data['floorZone'] ?? 'Ground';
                          final vehicleNumber = data['currentVehicleNumber'] ?? 'N/A';
                          final visitorName = data['currentVisitorName'] ?? 'Visitor';
                          final flatNum = data['currentVisitorFlatNumber'] ?? '';
                          final currentVisitorId = data['currentVisitorId'];

                          Color cardBg = isOccupied ? Colors.red.shade50 : Colors.green.shade50;
                          Color borderColor = isOccupied ? Colors.red.shade300 : Colors.green.shade300;

                          return InkWell(
                            onTap: isOccupied ? () => _releaseSlot(doc.id, currentVisitorId) : null,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: cardBg,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: borderColor, width: 2),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            category == 'ev' ? Icons.electric_car : Icons.local_parking,
                                            color: isOccupied ? Colors.red : Colors.green,
                                            size: 22,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            slotNumber,
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: isOccupied ? Colors.red : Colors.green,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          isOccupied ? 'OCCUPIED' : 'EMPTY',
                                          style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (isOccupied) ...[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('🚗 $vehicleNumber', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                        Text('👤 $visitorName${flatNum.isNotEmpty ? " → Flat $flatNum" : ""}',
                                            style: const TextStyle(fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                    const Text('Tap to release spot', style: TextStyle(fontSize: 9, color: Colors.red, fontStyle: FontStyle.italic)),
                                  ] else ...[
                                    Text('Zone: $zone\nType: ${category.toUpperCase()}', style: TextStyle(fontSize: 11, color: Colors.grey.shade700)),
                                    const Text('Available for entry', style: TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold)),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// TAB 3: Package Management (Log incoming parcels & mark collected)
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

/// TAB 4: Incident Reporting (Report to Admins)
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

/// TAB 5: Entry/Exit & Package History
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
