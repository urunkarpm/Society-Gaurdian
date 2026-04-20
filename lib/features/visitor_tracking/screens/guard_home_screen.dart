import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

import '../../../core/constants/app_constants.dart';
import '../../../domain/entities/user_entity.dart';
import '../providers/visitor_provider.dart';
import '../../../presentation/providers/auth_provider.dart';

/// Guard home screen for visitor tracking
class GuardHomeScreen extends ConsumerStatefulWidget {
  const GuardHomeScreen({super.key});

  @override
  ConsumerState<GuardHomeScreen> createState() => _GuardHomeScreenState();
}

class _GuardHomeScreenState extends ConsumerState<GuardHomeScreen> {
  MobileScannerController? _scannerController;
  bool _isScanning = false;
  String? _selectedGate;
  final _gates = ['Gate 1', 'Gate 2', 'Gate 3', 'Main Entrance'];
  
  final _formKey = GlobalKey<FormState>();
  final _visitorNameController = TextEditingController();
  final _visitorPhoneController = TextEditingController();
  final _purposeController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _flatNumberController = TextEditingController();
  final _durationController = TextEditingController(text: '60');
  
  File? _visitorPhoto;
  File? _licensePlatePhoto;
  
  @override
  void initState() {
    super.initState();
    _selectedGate = _gates.first;
  }
  
  @override
  void dispose() {
    _scannerController?.dispose();
    _visitorNameController.dispose();
    _visitorPhoneController.dispose();
    _purposeController.dispose();
    _vehicleNumberController.dispose();
    _flatNumberController.dispose();
    _durationController.dispose();
    super.dispose();
  }
  
  Future<void> _pickVisitorPhoto() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    
    if (image != null) {
      setState(() {
        _visitorPhoto = File(image.path);
      });
    }
  }
  
  Future<void> _pickLicensePlatePhoto() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    
    if (image != null) {
      setState(() {
        _licensePlatePhoto = File(image.path);
      });
    }
  }
  
  Future<String?> _uploadPhoto(File file, String path) async {
    try {
      final filename = '${const Uuid().v4()}.jpg';
      final ref = FirebaseStorage.instance.ref().child('$path/$filename');
      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed: $e')),
      );
      return null;
    }
  }
  
  Future<void> _submitVisitor() async {
    if (!_formKey.currentState!.validate()) return;
    
    final user = ref.read(currentUserProvider);
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not authenticated')),
      );
      return;
    }
    
    // Upload photos if available
    String? visitorPhotoUrl;
    String? licensePlateUrl;
    
    if (_visitorPhoto != null) {
      visitorPhotoUrl = await _uploadPhoto(
        _visitorPhoto!,
        AppConstants.visitorPhotosPath,
      );
    }
    
    if (_licensePlatePhoto != null) {
      licensePlateUrl = await _uploadPhoto(
        _licensePlatePhoto!,
        AppConstants.visitorPhotosPath,
      );
    }
    
    // Create visitor entity
    final visitor = VisitorEntity(
      id: const Uuid().v4(),
      societyId: user.societyId,
      hostFlatId: _flatNumberController.text,
      visitorName: _visitorNameController.text.trim(),
      visitorPhone: _visitorPhoneController.text.trim(),
      visitorPhotoUrl: visitorPhotoUrl,
      purpose: _purposeController.text.trim(),
      vehicleNumber: _vehicleNumberController.text.trim().isEmpty 
          ? null 
          : _vehicleNumberController.text.trim(),
      licensePlatePhotoUrl: licensePlateUrl,
      expectedArrivalTime: DateTime.now(),
      actualArrivalTime: DateTime.now(),
      expectedDepartureTime: DateTime.now().add(
        Duration(minutes: int.tryParse(_durationController.text) ?? 60),
      ),
      status: AppConstants.visitorStatusPending,
      gateNumber: _selectedGate!,
      taggedBy: user.uid,
      taggedAt: DateTime.now(),
      isPreApproved: false,
      metadata: {},
    );
    
    // Write to Firestore via provider
    final result = await ref.read(visitorProvider.notifier).createVisitor(visitor);
    
    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed: $failure')),
        );
      },
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Visitor tagged successfully! Notification sent to resident.'),
            backgroundColor: Colors.green,
          ),
        );
        _resetForm();
      },
    );
  }
  
  void _resetForm() {
    _visitorNameController.clear();
    _visitorPhoneController.clear();
    _purposeController.clear();
    _vehicleNumberController.clear();
    _flatNumberController.clear();
    _durationController.text = '60';
    setState(() {
      _visitorPhoto = null;
      _licensePlatePhoto = null;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Entry'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => context.push('/guard-home/history'),
            tooltip: 'History',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Gate selection
              DropdownButtonFormField<String>(
                value: _selectedGate,
                decoration: const InputDecoration(
                  labelText: 'Select Gate',
                  prefixIcon: Icon(Icons.door_door),
                ),
                items: _gates.map((gate) => DropdownMenuItem(
                  value: gate,
                  child: Text(gate),
                )).toList(),
                onChanged: (value) => setState(() => _selectedGate = value),
              ),
              
              const SizedBox(height: 16),
              
              // QR Scanner button
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quick Scan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.qr_code_scanner),
                              label: const Text('Scan QR Code'),
                              onPressed: _startQrScanner,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.credit_card),
                              label: const Text('Scan NFC'),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('NFC coming soon')),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Visitor photo
              GestureDetector(
                onTap: _pickVisitorPhoto,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: _visitorPhoto != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(_visitorPhoto!, fit: BoxFit.cover),
                        )
                      : const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo, size: 48, color: Colors.grey),
                            SizedBox(height: 8),
                            Text('Tap to capture visitor photo'),
                          ],
                        ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _visitorNameController,
                decoration: const InputDecoration(
                  labelText: 'Visitor Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter visitor name';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _visitorPhoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _flatNumberController,
                decoration: const InputDecoration(
                  labelText: 'Flat Number',
                  prefixIcon: Icon(Icons.home),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter flat number';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _purposeController,
                decoration: const InputDecoration(
                  labelText: 'Purpose of Visit',
                  prefixIcon: Icon(Icons.notes),
                ),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter purpose';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _vehicleNumberController,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Number (Optional)',
                  prefixIcon: Icon(Icons.directions_car),
                ),
              ),
              
              const SizedBox(height: 16),
              
              GestureDetector(
                onTap: _pickLicensePlatePhoto,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: _licensePlatePhoto != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(_licensePlatePhoto!, fit: BoxFit.cover),
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, size: 32, color: Colors.grey),
                            SizedBox(width: 8),
                            Text('Capture license plate (optional)'),
                          ],
                        ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(
                  labelText: 'Expected Duration (minutes)',
                  prefixIcon: Icon(Icons.timer),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter duration';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 24),
              
              ElevatedButton(
                onPressed: _submitVisitor,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Tag Visitor & Notify Resident',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _startQrScanner() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => QRScannerSheet(
        onScan: (data) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Scanned: $data')),
          );
        },
      ),
    );
  }
}

/// QR Scanner bottom sheet
class QRScannerSheet extends StatefulWidget {
  final Function(String) onScan;
  
  const QRScannerSheet({super.key, required this.onScan});
  
  @override
  State<QRScannerSheet> createState() => _QRScannerSheetState();
}

class _QRScannerSheetState extends State<QRScannerSheet> {
  MobileScannerController? _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
    );
  }
  
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Scan QR Code',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: MobileScanner(
              controller: _controller,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  if (barcode.rawValue != null) {
                    widget.onScan(barcode.rawValue!);
                    break;
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _controller?.toggleFlash();
                    },
                    child: const Text('Toggle Flash'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
