import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/logger.dart';

class SocietySetupScreen extends StatefulWidget {
  const SocietySetupScreen({super.key});

  @override
  State<SocietySetupScreen> createState() => _SocietySetupScreenState();
}

class _SocietySetupScreenState extends State<SocietySetupScreen> {
  final _formKey = GlobalKey<FormState>();

  // Society details
  final _societyNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();

  // Structure setup
  final _buildingsCountController = TextEditingController(text: '2');
  final _wingsPerBuildingController = TextEditingController(text: 'A,B');
  final _flatsPerFloorController = TextEditingController(text: '4');
  final _totalFloorsController = TextEditingController(text: '5');
  final _refugeFloorsController = TextEditingController(text: '');

  bool _isCreating = false;
  int _currentStep = 0;

  @override
  void dispose() {
    _societyNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _buildingsCountController.dispose();
    _wingsPerBuildingController.dispose();
    _flatsPerFloorController.dispose();
    _totalFloorsController.dispose();
    _refugeFloorsController.dispose();
    super.dispose();
  }

  Future<void> _createSociety() async {
    if (!_formKey.currentState!.validate()) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please log in first before setting up a society.')),
      );
      context.go('/login');
      return;
    }

    setState(() => _isCreating = true);

    try {
      final batch = FirebaseFirestore.instance.batch();

      // 1. Create Society document
      final societyRef = FirebaseFirestore.instance.collection(AppConstants.societiesCollection).doc();
      final societyId = societyRef.id;

      batch.set(societyRef, {
        'id': societyId,
        'name': _societyNameController.text.trim(),
        'address': _addressController.text.trim(),
        'city': _cityController.text.trim(),
        'createdBy': user.uid,
        'createdAt': FieldValue.serverTimestamp(),
        'isActive': true,
      });

      // 2. Auto-generate Flats
      final int buildingCount = int.tryParse(_buildingsCountController.text) ?? 1;
      final List<String> wings = _wingsPerBuildingController.text
          .split(',')
          .map((e) => e.trim().toUpperCase())
          .where((e) => e.isNotEmpty)
          .toList();

      final int floors = int.tryParse(_totalFloorsController.text) ?? 1;
      final int flatsPerFloor = int.tryParse(_flatsPerFloorController.text) ?? 1;
      final List<int> refugeFloors = _refugeFloorsController.text
          .split(',')
          .map((e) => int.tryParse(e.trim()))
          .whereType<int>()
          .toList();

      for (int b = 1; b <= buildingCount; b++) {
        final buildingNum = '$b';
        final targetWings = wings.isEmpty ? [''] : wings;

        for (final wing in targetWings) {
          for (int floor = 1; floor <= floors; floor++) {
            final isRefuge = refugeFloors.contains(floor);
            for (int f = 1; f <= flatsPerFloor; f++) {
              final flatNumber = '${floor * 100 + f}';
              final flatRef = FirebaseFirestore.instance.collection(AppConstants.flatsCollection).doc();

              batch.set(flatRef, {
                'id': flatRef.id,
                'societyId': societyId,
                'buildingNumber': buildingNum,
                'wing': wing.isEmpty ? null : wing,
                'flatNumber': flatNumber,
                'floor': floor,
                'isRefugeArea': isRefuge,
                'isActive': true,
                'createdAt': FieldValue.serverTimestamp(),
              });
            }
          }
        }
      }

      // 3. Promote creator user to Admin/Owner
      final userRef = FirebaseFirestore.instance.collection(AppConstants.usersCollection).doc(user.uid);
      batch.set(userRef, {
        'uid': user.uid,
        'email': user.email ?? '',
        'displayName': user.displayName ?? _societyNameController.text,
        'role': AppConstants.roleAdmin,
        'societyId': societyId,
        'isActive': true,
        'updatedAt': FieldValue.serverTimestamp(),
        'metadata': {
          'isOwner': true,
          'canActAsAdmin': true,
        },
      }, SetOptions(merge: true));

      await batch.commit();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Society setup completed successfully! You are now the Admin.'),
            backgroundColor: Colors.green,
          ),
        );
        context.go('/admin/dashboard');
      }
    } catch (e, stackTrace) {
      Logger.error('Failed to setup society', error: e, stackTrace: stackTrace, tag: 'SocietySetup');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to setup society: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isCreating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Society Onboarding Wizard'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep == 0) {
                if (_societyNameController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter society name.')),
                  );
                  return;
                }
                setState(() => _currentStep = 1);
              } else if (_currentStep == 1) {
                _createSociety();
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() => _currentStep -= 1);
              } else {
                context.go('/login');
              }
            },
            controlsBuilder: (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _isCreating ? null : details.onStepContinue,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: _isCreating
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(_currentStep == 1 ? 'Finish & Launch Society' : 'Next Step'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: _isCreating ? null : details.onStepCancel,
                      child: Text(_currentStep == 0 ? 'Cancel' : 'Back'),
                    ),
                  ],
                ),
              );
            },
            steps: [
              Step(
                title: const Text('Society Details'),
                subtitle: const Text('Basic information'),
                isActive: _currentStep >= 0,
                content: Column(
                  children: [
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _societyNameController,
                      decoration: const InputDecoration(
                        labelText: 'Society Name',
                        prefixIcon: Icon(Icons.business),
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Society name required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        prefixIcon: Icon(Icons.location_on_outlined),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        labelText: 'City',
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text('Building & Flat Generator'),
                subtitle: const Text('Auto-create society layout'),
                isActive: _currentStep >= 1,
                content: Column(
                  children: [
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _buildingsCountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Number of Buildings/Towers',
                        prefixIcon: Icon(Icons.apartment),
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Building count required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _wingsPerBuildingController,
                      decoration: const InputDecoration(
                        labelText: 'Wings (Comma separated)',
                        hintText: 'e.g. A, B, C',
                        prefixIcon: Icon(Icons.view_column),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _totalFloorsController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Floors per Wing',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _flatsPerFloorController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Flats per Floor',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _refugeFloorsController,
                      decoration: const InputDecoration(
                        labelText: 'Refuge Floors (Comma separated)',
                        hintText: 'e.g. 5, 10 (Optional)',
                        prefixIcon: Icon(Icons.security),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
