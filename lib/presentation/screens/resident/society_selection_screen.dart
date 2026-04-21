import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/logger.dart';
import '../../../domain/entities/flat_entity.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/auth_provider.dart';

/// Society Selection Screen - For residents to select their society, wing & flat
class SocietySelectionScreen extends ConsumerStatefulWidget {
  const SocietySelectionScreen({super.key});

  @override
  ConsumerState<SocietySelectionScreen> createState() => _SocietySelectionScreenState();
}

class _SocietySelectionScreenState extends ConsumerState<SocietySelectionScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String? _selectedSocietyId;
  String? _selectedBuildingNumber;
  String? _selectedWing;
  String? _selectedFlatNumber;
  
  List<SocietyEntity> _societies = [];
  List<String> _buildings = [];
  List<String> _wings = [];
  List<String> _flats = [];
  
  bool _isLoading = false;
  bool _isSubmitting = false;
  
  @override
  void initState() {
    super.initState();
    _loadSocieties();
  }
  
  Future<void> _loadSocieties() async {
    setState(() => _isLoading = true);
    
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .where('isActive', isEqualTo: true)
          .get();
      
      setState(() {
        _societies = snapshot.docs.map((doc) {
          return SocietyEntity.fromJson({...doc.data(), 'id': doc.id});
        }).toList();
        _isLoading = false;
      });
    } catch (e, stackTrace) {
      Logger.error('Failed to load societies', error: e, stackTrace: stackTrace, tag: 'SocietySelection');
      setState(() => _isLoading = false);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load societies: ${e.toString()}')),
        );
      }
    }
  }
  
  Future<void> _loadBuildings(String societyId) async {
    setState(() {
      _buildings = [];
      _wings = [];
      _flats = [];
      _selectedBuildingNumber = null;
      _selectedWing = null;
      _selectedFlatNumber = null;
    });
    
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(AppConstants.flatsCollection)
          .where('societyId', isEqualTo: societyId)
          .get();
      
      final buildings = <String>{};
      for (var doc in snapshot.docs) {
        final data = doc.data();
        if (data['buildingNumber'] != null) {
          buildings.add(data['buildingNumber'] as String);
        }
      }
      
      setState(() {
        _buildings = buildings.toList()..sort();
      });
    } catch (e, stackTrace) {
      Logger.error('Failed to load buildings', error: e, stackTrace: stackTrace, tag: 'SocietySelection');
    }
  }
  
  Future<void> _loadWings(String societyId, String buildingNumber) async {
    setState(() {
      _wings = [];
      _flats = [];
      _selectedWing = null;
      _selectedFlatNumber = null;
    });
    
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(AppConstants.flatsCollection)
          .where('societyId', isEqualTo: societyId)
          .where('buildingNumber', isEqualTo: buildingNumber)
          .get();
      
      final wings = <String>{};
      for (var doc in snapshot.docs) {
        final data = doc.data();
        if (data['wing'] != null && (data['wing'] as String).isNotEmpty) {
          wings.add(data['wing'] as String);
        }
      }
      
      // If no wings, add a default option
      if (wings.isEmpty) {
        wings.add('N/A');
      }
      
      setState(() {
        _wings = wings.toList()..sort();
      });
    } catch (e, stackTrace) {
      Logger.error('Failed to load wings', error: e, stackTrace: stackTrace, tag: 'SocietySelection');
    }
  }
  
  Future<void> _loadFlats(String societyId, String buildingNumber, String wing) async {
    setState(() {
      _flats = [];
      _selectedFlatNumber = null;
    });
    
    try {
      QuerySnapshot snapshot;
      
      if (wing == 'N/A' || wing.isEmpty) {
        snapshot = await FirebaseFirestore.instance
            .collection(AppConstants.flatsCollection)
            .where('societyId', isEqualTo: societyId)
            .where('buildingNumber', isEqualTo: buildingNumber)
            .get();
      } else {
        snapshot = await FirebaseFirestore.instance
            .collection(AppConstants.flatsCollection)
            .where('societyId', isEqualTo: societyId)
            .where('buildingNumber', isEqualTo: buildingNumber)
            .where('wing', isEqualTo: wing)
            .get();
      }
      
      final flatNumbers = <String>{};
      for (var doc in snapshot.docs) {
        final data = doc.data();
        if (data['flatNumber'] != null) {
          flatNumbers.add(data['flatNumber'] as String);
        }
      }
      
      setState(() {
        _flats = flatNumbers.toList()..sort();
      });
    } catch (e, stackTrace) {
      Logger.error('Failed to load flats', error: e, stackTrace: stackTrace, tag: 'SocietySelection');
    }
  }
  
  Future<void> _submitRequest() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() => _isSubmitting = true);
    
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('No user logged in');
      
      // Find the flat document
      QuerySnapshot flatSnapshot;
      
      if (_selectedWing == 'N/A' || _selectedWing == null || _selectedWing!.isEmpty) {
        flatSnapshot = await FirebaseFirestore.instance
            .collection(AppConstants.flatsCollection)
            .where('societyId', isEqualTo: _selectedSocietyId)
            .where('buildingNumber', isEqualTo: _selectedBuildingNumber)
            .where('flatNumber', isEqualTo: _selectedFlatNumber)
            .limit(1)
            .get();
      } else {
        flatSnapshot = await FirebaseFirestore.instance
            .collection(AppConstants.flatsCollection)
            .where('societyId', isEqualTo: _selectedSocietyId)
            .where('buildingNumber', isEqualTo: _selectedBuildingNumber)
            .where('wing', isEqualTo: _selectedWing)
            .where('flatNumber', isEqualTo: _selectedFlatNumber)
            .limit(1)
            .get();
      }
      
      if (flatSnapshot.docs.isEmpty) {
        throw Exception('Flat not found. Please check your selection.');
      }
      
      final flatDoc = flatSnapshot.docs.first;
      final flatId = flatDoc.id;
      
      // Create residence verification request
      await FirebaseFirestore.instance
          .collection('residence_verifications')
          .add({
        'userId': user.uid,
        'userEmail': user.email,
        'userName': user.displayName,
        'societyId': _selectedSocietyId,
        'buildingNumber': _selectedBuildingNumber,
        'wing': _selectedWing == 'N/A' ? null : _selectedWing,
        'flatNumber': _selectedFlatNumber,
        'flatId': flatId,
        'status': 'pending', // pending, approved, rejected
        'requestedAt': FieldValue.serverTimestamp(),
        'reviewedAt': null,
        'reviewedBy': null,
        'rejectionReason': null,
      });
      
      // Update user profile with pending status
      await FirebaseFirestore.instance
          .collection(AppConstants.usersCollection)
          .doc(user.uid)
          .update({
        'societyId': _selectedSocietyId,
        'flatId': flatId,
        'verificationStatus': 'pending',
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verification request submitted successfully! Please wait for admin approval.'),
            backgroundColor: Colors.green,
          ),
        );
        
        // Navigate back or to a waiting screen
        context.go('/waiting-approval');
      }
    } catch (e, stackTrace) {
      Logger.error('Failed to submit verification request', error: e, stackTrace: stackTrace, tag: 'SocietySelection');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit request: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Residence'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            if (context.mounted) {
              context.go('/login');
            }
          },
          tooltip: 'Logout',
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    
                    // Header
                    Icon(
                      Icons.home_outlined,
                      size: 64,
                      color: AppTheme.primaryColor,
                    ),
                    const SizedBox(height: 16),
                    
                    Text(
                      'Select Your Residence',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    
                    Text(
                      'Please select your society, building, wing and flat number. Your request will be verified by the admin.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    
                    // Society Selection
                    if (_societies.isEmpty) ...[
                      Card(
                        color: Colors.orange.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Icon(Icons.info_outline, color: Colors.orange.shade700),
                              const SizedBox(height: 8),
                              Text(
                                'No societies found. Please contact your administrator to add a society.',
                                style: TextStyle(color: Colors.orange.shade700),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ] else ...[
                      DropdownButtonFormField<String>(
                        value: _selectedSocietyId,
                        decoration: const InputDecoration(
                          labelText: 'Society',
                          prefixIcon: Icon(Icons.business_outlined),
                          border: OutlineInputBorder(),
                        ),
                        hint: const Text('Select your society'),
                        items: _societies.map((society) {
                          return DropdownMenuItem(
                            value: society.id,
                            child: Text(society.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => _selectedSocietyId = value);
                          if (value != null) {
                            _loadBuildings(value);
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a society';
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Building Selection
                      if (_selectedSocietyId != null) ...[
                        if (_buildings.isEmpty) ...[
                          Card(
                            color: Colors.blue.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'No buildings found for this society. Please contact admin.',
                                style: TextStyle(color: Colors.blue.shade700),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ] else ...[
                          DropdownButtonFormField<String>(
                            value: _selectedBuildingNumber,
                            decoration: const InputDecoration(
                              labelText: 'Building',
                              prefixIcon: Icon(Icons.apartment_outlined),
                              border: OutlineInputBorder(),
                            ),
                            hint: const Text('Select building'),
                            items: _buildings.map((building) {
                              return DropdownMenuItem(
                                value: building,
                                child: Text('Building $building'),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() => _selectedBuildingNumber = value);
                              if (value != null && _selectedSocietyId != null) {
                                _loadWings(_selectedSocietyId!, value);
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a building';
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Wing Selection
                          if (_selectedBuildingNumber != null) ...[
                            DropdownButtonFormField<String>(
                              value: _selectedWing?.isEmpty == true ? 'N/A' : _selectedWing,
                              decoration: const InputDecoration(
                                labelText: 'Wing',
                                prefixIcon: Icon(Icons.view_column_outlined),
                                border: OutlineInputBorder(),
                              ),
                              hint: const Text('Select wing'),
                              items: _wings.map((wing) {
                                return DropdownMenuItem(
                                  value: wing,
                                  child: Text(wing == 'N/A' ? 'Not Applicable' : 'Wing $wing'),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() => _selectedWing = value == 'N/A' ? null : value);
                                if (_selectedSocietyId != null && _selectedBuildingNumber != null) {
                                  _loadFlats(_selectedSocietyId!, _selectedBuildingNumber!, value ?? '');
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a wing';
                                }
                                return null;
                              },
                            ),
                            
                            const SizedBox(height: 16),
                            
                            // Flat Number Selection
                            if (_selectedWing != null || _wings.contains('N/A')) ...[
                              if (_flats.isEmpty) ...[
                                Card(
                                  color: Colors.amber.shade50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      'No flats found for this selection. Please contact admin.',
                                      style: TextStyle(color: Colors.amber.shade700),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ] else ...[
                                DropdownButtonFormField<String>(
                                  value: _selectedFlatNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'Flat Number',
                                    prefixIcon: Icon(Icons.door_front_door_outlined),
                                    border: OutlineInputBorder(),
                                  ),
                                  hint: const Text('Select flat number'),
                                  items: _flats.map((flat) {
                                    return DropdownMenuItem(
                                      value: flat,
                                      child: Text('Flat $flat'),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() => _selectedFlatNumber = value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a flat number';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ],
                          ],
                        ],
                      ],
                    ],
                    
                    const SizedBox(height: 32),
                    
                    // Submit Button
                    ElevatedButton(
                      onPressed: (_selectedSocietyId != null && 
                                 _selectedBuildingNumber != null && 
                                 _selectedFlatNumber != null && 
                                 !_isSubmitting)
                          ? _submitRequest
                          : null,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isSubmitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text(
                              'Submit for Verification',
                              style: TextStyle(fontSize: 16),
                            ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Info card
                    Card(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline, color: AppTheme.primaryColor),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Your request will be reviewed by the society admin. You will be notified once it\'s approved.',
                                style: TextStyle(color: AppTheme.primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
