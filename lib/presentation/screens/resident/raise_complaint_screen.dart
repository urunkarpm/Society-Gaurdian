import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../domain/entities/complaint_entity.dart';
import '../../../data/repositories/complaint_repository.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/auth_provider.dart';
import 'complaint_detail_screen.dart';

/// Screen for residents to raise new complaints
class RaiseComplaintScreen extends StatefulWidget {
  const RaiseComplaintScreen({super.key});

  @override
  State<RaiseComplaintScreen> createState() => _RaiseComplaintScreenState();
}

class _RaiseComplaintScreenState extends State<RaiseComplaintScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  ComplaintCategory _selectedCategory = ComplaintCategory.other;
  ComplaintPriority _selectedPriority = ComplaintPriority.medium;
  bool _isAnonymous = false;
  List<File> _photos = [];
  bool _isLoading = false;

  final ImagePicker _imagePicker = ImagePicker();

  final List<ComplaintCategory> _categories = [
    ComplaintCategory.electrical,
    ComplaintCategory.plumbing,
    ComplaintCategory.tiles,
    ComplaintCategory.carpentry,
    ComplaintCategory.painting,
    ComplaintCategory.cleaning,
    ComplaintCategory.security,
    ComplaintCategory.elevator,
    ComplaintCategory.waterSupply,
    ComplaintCategory.gardening,
    ComplaintCategory.other,
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raise Complaint'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Category Selection
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<ComplaintCategory>(
                        value: _selectedCategory,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                        ),
                        items: _categories.map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(_formatCategory(category)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => _selectedCategory = value!);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 16),

              // Priority Selection
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Priority',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SegmentedButton<ComplaintPriority>(
                        segments: ComplaintPriority.values.map((priority) {
                          return ButtonSegment(
                            value: priority,
                            label: Text(_formatPriority(priority)),
                            icon: Icon(_getPriorityIcon(priority)),
                          );
                        }).toList(),
                        selected: {_selectedPriority},
                        onSelectionChanged: (Set<ComplaintPriority> selected) {
                          setState(() => _selectedPriority = selected.first);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Title Field
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Brief description of the issue',
                  prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Description Field
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Provide detailed information about the issue',
                  prefixIcon: const Icon(Icons.description),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Photo Upload
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Photos (Optional)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (_photos.isEmpty)
                        InkWell(
                          onTap: _pickImages,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_photo_alternate, size: 40),
                                  SizedBox(height: 8),
                                  Text('Tap to add photos'),
                                ],
                              ),
                            ),
                          ),
                        )
                      else
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _photos.length + 1,
                            itemBuilder: (context, index) {
                              if (index == _photos.length) {
                                return InkWell(
                                  onTap: _pickImages,
                                  child: Container(
                                    width: 100,
                                    margin: const EdgeInsets.only(left: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey.shade400),
                                    ),
                                    child: const Icon(Icons.add),
                                  ),
                                );
                              }
                              return Container(
                                width: 100,
                                margin: const EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: FileImage(_photos[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          shadows: [Shadow(color: Colors.black)],
                                        ),
                                        onPressed: () => _removePhoto(index),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Anonymous Toggle
              SwitchListTile(
                title: const Text('Submit Anonymously'),
                subtitle: const Text('Your name will not be shown'),
                value: _isAnonymous,
                onChanged: (value) {
                  setState(() => _isAnonymous = value);
                },
              ),

              const SizedBox(height: 24),

              // Submit Button
              ElevatedButton(
                onPressed: _isLoading ? null : _submitComplaint,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Submit Complaint',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCategory(ComplaintCategory category) {
    switch (category) {
      case ComplaintCategory.electrical: return 'Electrical';
      case ComplaintCategory.plumbing: return 'Plumbing';
      case ComplaintCategory.tiles: return 'Tiles';
      case ComplaintCategory.carpentry: return 'Carpentry';
      case ComplaintCategory.painting: return 'Painting';
      case ComplaintCategory.cleaning: return 'Cleaning';
      case ComplaintCategory.security: return 'Security';
      case ComplaintCategory.elevator: return 'Elevator';
      case ComplaintCategory.waterSupply: return 'Water Supply';
      case ComplaintCategory.gardening: return 'Gardening';
      case ComplaintCategory.other: return 'Other';
    }
  }

  String _formatPriority(ComplaintPriority priority) {
    switch (priority) {
      case ComplaintPriority.low: return 'Low';
      case ComplaintPriority.medium: return 'Medium';
      case ComplaintPriority.high: return 'High';
      case ComplaintPriority.urgent: return 'Urgent';
    }
  }

  IconData _getPriorityIcon(ComplaintPriority priority) {
    switch (priority) {
      case ComplaintPriority.low: return Icons.arrow_downward;
      case ComplaintPriority.medium: return Icons.remove;
      case ComplaintPriority.high: return Icons.arrow_upward;
      case ComplaintPriority.urgent: return Icons.warning;
    }
  }

  Future<void> _pickImages() async {
    final pickedFiles = await _imagePicker.pickMultiImage(
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
    );

    if (pickedFiles != null) {
      setState(() {
        _photos.addAll(pickedFiles.map((file) => File(file.path)).toList());
      });
    }
  }

  void _removePhoto(int index) {
    setState(() {
      _photos.removeAt(index);
    });
  }

  Future<void> _submitComplaint() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // Get society and flat info from auth provider or context
      // This would typically come from your auth state
      final societyId = 'society_123'; // TODO: Get from auth provider
      final flatId = 'flat_456'; // TODO: Get from auth provider
      final flatNumber = 'A-101'; // TODO: Get from auth provider

      final repository = ComplaintRepository();
      
      await repository.createComplaint(
        societyId: societyId,
        flatId: flatId,
        flatNumber: flatNumber,
        category: _selectedCategory,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        priority: _selectedPriority,
        photos: _photos.isEmpty ? null : _photos,
        isAnonymous: _isAnonymous,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Complaint submitted successfully!'),
            backgroundColor: AppTheme.successColor,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
