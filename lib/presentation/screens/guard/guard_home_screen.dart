import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';

import '../../../core/theme/app_theme.dart';
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
  MobileScannerController? _scannerController;
  bool _isScanning = false;
  final ImagePicker _imagePicker = ImagePicker();
  
  // Form controllers
  final _visitorNameController = TextEditingController();
  final _visitorPhoneController = TextEditingController();
  final _purposeController = TextEditingController();
  final _flatNumberController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  VisitorType _selectedType = VisitorType.guest;
  String _selectedGate = AppConstants.gateMain;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scannerController?.dispose();
    _visitorNameController.dispose();
    _visitorPhoneController.dispose();
    _purposeController.dispose();
    _flatNumberController.dispose();
    _vehicleNumberController.dispose();
    super.dispose();
  }

  Future<void> _registerVisitor() async {
    if (_visitorNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter visitor name')),
      );
      return;
    }

    try {
      setState(() => _isScanning = true);

      final societyId = ref.read(societyIdProvider);
      if (societyId == null) throw Exception('Society ID not found');

      // Create visitor document
      final visitorData = {
        'societyId': societyId,
        'gateName': _selectedGate,
        'visitorName': _visitorNameController.text.trim(),
        'visitorPhone': _visitorPhoneController.text.trim(),
        'purpose': _purposeController.text.trim(),
        'hostFlatNumber': _flatNumberController.text.trim(),
        'vehicleNumber': _vehicleNumberController.text.trim(),
        'type': _selectedType.name,
        'status': VisitorStatus.pending.name,
        'createdAt': FieldValue.serverTimestamp(),
        'createdBy': ref.read(currentUserProvider)?.uid,
      };

      final docRef = await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .add(visitorData);

      Logger.firestore('create', AppConstants.visitorsCollection,
          docId: docRef.id, data: visitorData);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Visitor registered successfully!'),
            backgroundColor: AppTheme.successColor,
          ),
        );
        
        // Clear form
        _clearForm();
        
        // Navigate to history tab
        _tabController.animateTo(2);
      }
    } catch (e, stackTrace) {
      Logger.error('Failed to register visitor', 
          error: e, stackTrace: stackTrace, tag: 'GuardHomeScreen');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed: ${e.toString()}'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isScanning = false);
      }
    }
  }

  void _clearForm() {
    _visitorNameController.clear();
    _visitorPhoneController.clear();
    _purposeController.clear();
    _flatNumberController.clear();
    _vehicleNumberController.clear();
    setState(() => _selectedType = VisitorType.guest);
  }

  Future<void> _pickAndUploadPhoto(String visitorId) async {
    try {
      final XFile? photo = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (photo != null) {
        final file = File(photo.path);
        final storageRef = FirebaseStorage.instance.ref();
        final photoRef = storageRef.child(
            '${AppConstants.visitorPhotosPath}/$visitorId/${DateTime.now().millisecondsSinceEpoch}.jpg');
        
        await photoRef.putFile(file);
        final downloadUrl = await photoRef.getDownloadURL();

        // Update visitor document with photo URL
        await FirebaseFirestore.instance
            .collection(AppConstants.societiesCollection)
            .doc(ref.read(societyIdProvider))
            .collection(AppConstants.visitorsCollection)
            .doc(visitorId)
            .update({
          'visitorPhotoUrl': downloadUrl,
          'photos': FieldValue.arrayUnion([downloadUrl]),
        });

        Logger.log('Photo uploaded successfully', tag: 'GuardHomeScreen');
      }
    } catch (e, stackTrace) {
      Logger.error('Failed to upload photo', 
          error: e, stackTrace: stackTrace, tag: 'GuardHomeScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (mounted) {
                context.go('/');
              }
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.qr_code_scanner), text: 'Scan'),
            Tab(icon: Icon(Icons.person_add), text: 'Manual'),
            Tab(icon: Icon(Icons.history), text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildScanTab(),
          _buildManualEntryTab(),
          _buildHistoryTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton.extended(
              onPressed: _isScanning ? null : _registerVisitor,
              icon: _isScanning
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.check),
              label: const Text('Register'),
            )
          : null,
    );
  }

  Widget _buildScanTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(24),
            height: 400,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: MobileScanner(
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  for (final barcode in barcodes) {
                    Logger.log('Barcode detected: ${barcode.rawValue}',
                        tag: 'GuardHomeScreen');
                    // Handle QR code data (pre-approval code, etc.)
                  }
                },
                errorBuilder: (context, error, child) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.no_photography,
                          size: 64,
                          color: Colors.white70,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Camera not available',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Text(
            'Scan QR code or pre-approval pass',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              setState(() => _tabController.animateTo(1));
            },
            icon: const Icon(Icons.edit),
            label: const Text('Manual Entry'),
          ),
        ],
      ),
    );
  }

  Widget _buildManualEntryTab() {
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
                  Text(
                    'Visitor Information',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  
                  DropdownButtonFormField<VisitorType>(
                    value: _selectedType,
                    decoration: const InputDecoration(
                      labelText: 'Visitor Type',
                      prefixIcon: Icon(Icons.category),
                    ),
                    items: VisitorType.values.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type.name.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _selectedType = value!);
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _visitorNameController,
                    decoration: const InputDecoration(
                      labelText: 'Visitor Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _visitorPhoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _purposeController,
                    decoration: const InputDecoration(
                      labelText: 'Purpose of Visit',
                      prefixIcon: Icon(Icons.note),
                    ),
                    maxLines: 2,
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
                  Text(
                    'Host Details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  
                  DropdownButtonFormField<String>(
                    value: _selectedGate,
                    decoration: const InputDecoration(
                      labelText: 'Gate',
                      prefixIcon: Icon(Icons.door_front_door),
                    ),
                    items: [
                      AppConstants.gateMain,
                      AppConstants.gateSide,
                      AppConstants.gateService,
                    ].map((gate) {
                      return DropdownMenuItem(value: gate, child: Text(gate));
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _selectedGate = value!);
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _flatNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Flat Number',
                      prefixIcon: Icon(Icons.home),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  TextFormField(
                    controller: _vehicleNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Vehicle Number (Optional)',
                      prefixIcon: Icon(Icons.directions_car),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    final societyId = ref.watch(societyIdProvider);
    
    if (societyId == null) {
      return const Center(child: Text('Society not found'));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .orderBy('createdAt', descending: true)
          .limit(50)
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
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.history, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  'No visitor history',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: visitors.length,
          itemBuilder: (context, index) {
            final visitor = visitors[index].data() as Map<String, dynamic>;
            final status = VisitorStatus.values.firstWhere(
              (e) => e.name == visitor['status'],
              orElse: () => VisitorStatus.pending,
            );

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _getStatusColor(status),
                  child: Text(
                    visitor['visitorName']?[0]?.toUpperCase() ?? '?',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(visitor['visitorName'] ?? 'Unknown'),
                subtitle: Text(
                  '${visitor['purpose'] ?? ''} • Flat: ${visitor['hostFlatNumber'] ?? 'N/A'}',
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Chip(
                      label: Text(
                        status.name.toUpperCase(),
                        style: const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      backgroundColor: _getStatusColor(status),
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _formatTime(visitor['createdAt']),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                onTap: () {
                  // TODO: Navigate to visitor detail screen
                },
              ),
            );
          },
        );
      },
    );
  }

  Color _getStatusColor(VisitorStatus status) {
    switch (status) {
      case VisitorStatus.pending:
        return AppTheme.warningColor;
      case VisitorStatus.approved:
        return AppTheme.infoColor;
      case VisitorStatus.checkedIn:
        return AppTheme.successColor;
      case VisitorStatus.checkedOut:
        return Colors.grey;
      case VisitorStatus.rejected:
      case VisitorStatus.expired:
        return AppTheme.errorColor;
    }
  }

  String _formatTime(dynamic timestamp) {
    if (timestamp == null) return '';
    final dateTime = (timestamp is Timestamp) ? timestamp.toDate() : DateTime.now();
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
