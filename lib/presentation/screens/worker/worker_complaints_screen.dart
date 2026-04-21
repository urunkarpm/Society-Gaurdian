import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../domain/entities/complaint_entity.dart';
import '../../../data/repositories/complaint_repository.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/auth_provider.dart';

/// Worker screen to view assigned complaints and mark as complete
class WorkerComplaintsScreen extends ConsumerStatefulWidget {
  const WorkerComplaintsScreen({super.key});

  @override
  ConsumerState<WorkerComplaintsScreen> createState() => _WorkerComplaintsScreenState();
}

class _WorkerComplaintsScreenState extends ConsumerState<WorkerComplaintsScreen> {
  final ComplaintRepository _repository = ComplaintRepository();
  String _selectedFilter = 'All';

  final List<String> _statusFilters = [
    'All',
    'Assigned',
    'In Progress',
    'Completed',
  ];

  @override
  Widget build(BuildContext context) {
    final societyId = ref.watch(societyIdProvider);
    final userId = ref.watch(userIdProvider);

    if (societyId == null || userId == null) {
      return const Center(child: Text('User or Society not found'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Assignments'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Status Filter Chips
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _statusFilters.length,
              itemBuilder: (context, index) {
                final status = _statusFilters[index];
                final isSelected = status == _selectedFilter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(status),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() => _selectedFilter = status);
                    },
                  ),
                );
              },
            ),
          ),

          // Complaints List
          Expanded(
            child: StreamBuilder<List<ComplaintEntity>>(
              stream: _repository.getWorkerComplaintsStream(societyId, userId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                var complaints = snapshot.data ?? [];

                // Apply status filter
                if (_selectedFilter != 'All') {
                  final statusEnum = _getStatusFromFilter(_selectedFilter);
                  complaints = complaints
                      .where((c) => c.status == statusEnum)
                      .toList();
                }

                if (complaints.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work_outline,
                          size: 64,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No assignments yet',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Complaints assigned to you will appear here',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: complaints.length,
                  itemBuilder: (context, index) {
                    final complaint = complaints[index];
                    return _WorkerComplaintCard(
                      complaint: complaint,
                      societyId: societyId,
                      onTap: () => _navigateToDetail(complaint, societyId),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ComplaintStatus _getStatusFromFilter(String filter) {
    switch (filter.toLowerCase()) {
      case 'assigned': return ComplaintStatus.assigned;
      case 'in progress': return ComplaintStatus.inProgress;
      case 'completed': return ComplaintStatus.completed;
      default: return ComplaintStatus.assigned;
    }
  }

  void _navigateToDetail(ComplaintEntity complaint, String societyId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkerComplaintDetailScreen(
          complaint: complaint,
          societyId: societyId,
        ),
      ),
    );
  }
}

// Worker Complaint Card Widget
class _WorkerComplaintCard extends StatelessWidget {
  final ComplaintEntity complaint;
  final String societyId;
  final VoidCallback onTap;

  const _WorkerComplaintCard({
    required this.complaint,
    required this.societyId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(complaint.category).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getCategoryIcon(complaint.category),
                          size: 14,
                          color: _getCategoryColor(complaint.category),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatCategory(complaint.category),
                          style: TextStyle(
                            color: _getCategoryColor(complaint.category),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(complaint.status).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _formatStatus(complaint.status),
                      style: TextStyle(
                        color: _getStatusColor(complaint.status),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                complaint.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                complaint.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Flat ${complaint.flatNumber}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  if (complaint.priority == ComplaintPriority.urgent)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warning, size: 14, color: Colors.red.shade700),
                          const SizedBox(width: 4),
                          Text(
                            'URGENT',
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
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

  String _formatStatus(ComplaintStatus status) {
    switch (status) {
      case ComplaintStatus.open: return 'Open';
      case ComplaintStatus.inProgress: return 'In Progress';
      case ComplaintStatus.assigned: return 'Assigned';
      case ComplaintStatus.workInProgress: return 'Work in Progress';
      case ComplaintStatus.completed: return 'Completed';
      case ComplaintStatus.resolved: return 'Resolved';
      case ComplaintStatus.closed: return 'Closed';
      case ComplaintStatus.rejected: return 'Rejected';
    }
  }

  IconData _getCategoryIcon(ComplaintCategory category) {
    switch (category) {
      case ComplaintCategory.electrical: return Icons.bolt;
      case ComplaintCategory.plumbing: return Icons.water_drop;
      case ComplaintCategory.tiles: return Icons.grid_on;
      case ComplaintCategory.carpentry: return Icons.hardware;
      case ComplaintCategory.painting: return Icons.palette;
      case ComplaintCategory.cleaning: return Icons.cleaning_services;
      case ComplaintCategory.security: return Icons.security;
      case ComplaintCategory.elevator: return Icons.elevator;
      case ComplaintCategory.waterSupply: return Icons.water;
      case ComplaintCategory.gardening: return Icons.yard;
      case ComplaintCategory.other: return Icons.build;
    }
  }

  Color _getCategoryColor(ComplaintCategory category) {
    switch (category) {
      case ComplaintCategory.electrical: return Colors.orange;
      case ComplaintCategory.plumbing: return Colors.blue;
      case ComplaintCategory.tiles: return Colors.brown;
      case ComplaintCategory.carpentry: return Colors.amber;
      case ComplaintCategory.painting: return Colors.purple;
      case ComplaintCategory.cleaning: return Colors.green;
      case ComplaintCategory.security: return Colors.red;
      case ComplaintCategory.elevator: return Colors.indigo;
      case ComplaintCategory.waterSupply: return Colors.cyan;
      case ComplaintCategory.gardening: return Colors.teal;
      case ComplaintCategory.other: return Colors.grey;
    }
  }

  Color _getStatusColor(ComplaintStatus status) {
    switch (status) {
      case ComplaintStatus.open: return Colors.orange;
      case ComplaintStatus.inProgress: return Colors.blue;
      case ComplaintStatus.assigned: return Colors.purple;
      case ComplaintStatus.workInProgress: return Colors.indigo;
      case ComplaintStatus.completed: return Colors.green;
      case ComplaintStatus.resolved: return Colors.teal;
      case ComplaintStatus.closed: return Colors.grey;
      case ComplaintStatus.rejected: return Colors.red;
    }
  }
}

// Worker Complaint Detail Screen
class WorkerComplaintDetailScreen extends StatefulWidget {
  final ComplaintEntity complaint;
  final String societyId;

  const WorkerComplaintDetailScreen({
    super.key,
    required this.complaint,
    required this.societyId,
  });

  @override
  State<WorkerComplaintDetailScreen> createState() => _WorkerComplaintDetailScreenState();
}

class _WorkerComplaintDetailScreenState extends State<WorkerComplaintDetailScreen> {
  final ComplaintRepository _repository = ComplaintRepository();
  final ImagePicker _imagePicker = ImagePicker();
  final _notesController = TextEditingController();
  
  List<File> _evidencePhotos = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Details'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoSection(),
            const SizedBox(height: 16),
            if (widget.complaint.status != ComplaintStatus.completed &&
                widget.complaint.status != ComplaintStatus.resolved) ...[
              _buildActionSection(),
            ] else ...[
              _buildCompletionSection(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(widget.complaint.category).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _formatCategory(widget.complaint.category),
                    style: TextStyle(
                      color: _getCategoryColor(widget.complaint.category),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(widget.complaint.status).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _formatStatus(widget.complaint.status),
                    style: TextStyle(
                      color: _getStatusColor(widget.complaint.status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.complaint.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.complaint.description,
              style: const TextStyle(fontSize: 15),
            ),
            const Divider(height: 24),
            Row(
              children: [
                const Icon(Icons.location_on, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Flat ${widget.complaint.flatNumber}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.person, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Raised by: ${widget.complaint.raisedByName}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            if (widget.complaint.photos != null && widget.complaint.photos!.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                'Issue Photos:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.complaint.photos!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(widget.complaint.photos![index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActionSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (widget.complaint.status == ComplaintStatus.assigned)
              ElevatedButton.icon(
                onPressed: _startWork,
                icon: const Icon(Icons.play_arrow),
                label: const Text('Start Work'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            const SizedBox(height: 12),
            if (widget.complaint.status == ComplaintStatus.inProgress ||
                widget.complaint.status == ComplaintStatus.assigned) ...[
              const Text(
                'Upload Evidence Photos:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (_evidencePhotos.isEmpty)
                InkWell(
                  onTap: _pickEvidencePhotos,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_photo_alternate, size: 32),
                          SizedBox(height: 4),
                          Text('Add Photos'),
                        ],
                      ),
                    ),
                  ),
                )
              else
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _evidencePhotos.length + 1,
                    itemBuilder: (context, index) {
                      if (index == _evidencePhotos.length) {
                        return InkWell(
                          onTap: _pickEvidencePhotos,
                          child: Container(
                            width: 80,
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
                        width: 80,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: FileImage(_evidencePhotos[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 2,
                              right: 2,
                              child: IconButton(
                                icon: const Icon(Icons.close, color: Colors.white, size: 16),
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
              const SizedBox(height: 16),
              TextField(
                controller: _notesController,
                decoration: InputDecoration(
                  labelText: 'Completion Notes (Optional)',
                  hintText: 'Describe the work done',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _isLoading ? null : _completeWork,
                icon: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.check_circle),
                label: Text(_isLoading ? 'Submitting...' : 'Mark as Complete'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCompletionSection() {
    return Card(
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              Icons.check_circle,
              size: 48,
              color: Colors.green.shade700,
            ),
            const SizedBox(height: 16),
            Text(
              'Work Completed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            if (widget.complaint.completionNotes != null &&
                widget.complaint.completionNotes!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                widget.complaint.completionNotes!,
                textAlign: TextAlign.center,
              ),
            ],
            if (widget.complaint.evidencePhotos != null &&
                widget.complaint.evidencePhotos!.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                'Evidence Photos:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.complaint.evidencePhotos!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(widget.complaint.evidencePhotos![index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _pickEvidencePhotos() async {
    final pickedFiles = await _imagePicker.pickMultiImage(
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
    );

    if (pickedFiles != null) {
      setState(() {
        _evidencePhotos.addAll(pickedFiles.map((f) => File(f.path)));
      });
    }
  }

  void _removePhoto(int index) {
    setState(() {
      _evidencePhotos.removeAt(index);
    });
  }

  Future<void> _startWork() async {
    try {
      await _repository.updateComplaintStatus(
        societyId: widget.societyId,
        complaintId: widget.complaint.id,
        status: ComplaintStatus.inProgress,
        updatedBy: widget.complaint.assignedTo ?? 'worker',
        comment: 'Work started',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Work started! Good luck!'),
            backgroundColor: AppTheme.successColor,
          ),
        );
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
    }
  }

  Future<void> _completeWork() async {
    if (_evidencePhotos.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload at least one evidence photo'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _repository.completeComplaint(
        societyId: widget.societyId,
        complaintId: widget.complaint.id,
        workerId: widget.complaint.assignedTo ?? 'worker',
        completionNotes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        evidencePhotos: _evidencePhotos,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Work completed successfully!'),
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

  String _formatStatus(ComplaintStatus status) {
    switch (status) {
      case ComplaintStatus.open: return 'Open';
      case ComplaintStatus.inProgress: return 'In Progress';
      case ComplaintStatus.assigned: return 'Assigned';
      case ComplaintStatus.workInProgress: return 'Work in Progress';
      case ComplaintStatus.completed: return 'Completed';
      case ComplaintStatus.resolved: return 'Resolved';
      case ComplaintStatus.closed: return 'Closed';
      case ComplaintStatus.rejected: return 'Rejected';
    }
  }

  Color _getCategoryColor(ComplaintCategory category) {
    switch (category) {
      case ComplaintCategory.electrical: return Colors.orange;
      case ComplaintCategory.plumbing: return Colors.blue;
      case ComplaintCategory.tiles: return Colors.brown;
      case ComplaintCategory.carpentry: return Colors.amber;
      case ComplaintCategory.painting: return Colors.purple;
      case ComplaintCategory.cleaning: return Colors.green;
      case ComplaintCategory.security: return Colors.red;
      case ComplaintCategory.elevator: return Colors.indigo;
      case ComplaintCategory.waterSupply: return Colors.cyan;
      case ComplaintCategory.gardening: return Colors.teal;
      case ComplaintCategory.other: return Colors.grey;
    }
  }

  Color _getStatusColor(ComplaintStatus status) {
    switch (status) {
      case ComplaintStatus.open: return Colors.orange;
      case ComplaintStatus.inProgress: return Colors.blue;
      case ComplaintStatus.assigned: return Colors.purple;
      case ComplaintStatus.workInProgress: return Colors.indigo;
      case ComplaintStatus.completed: return Colors.green;
      case ComplaintStatus.resolved: return Colors.teal;
      case ComplaintStatus.closed: return Colors.grey;
      case ComplaintStatus.rejected: return Colors.red;
    }
  }
}
