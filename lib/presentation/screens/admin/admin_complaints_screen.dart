import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../domain/entities/complaint_entity.dart';
import '../../../data/repositories/complaint_repository.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/auth_provider.dart';

/// Admin screen to view and manage all complaints
class AdminComplaintsScreen extends ConsumerStatefulWidget {
  const AdminComplaintsScreen({super.key});

  @override
  ConsumerState<AdminComplaintsScreen> createState() => _AdminComplaintsScreenState();
}

class _AdminComplaintsScreenState extends ConsumerState<AdminComplaintsScreen> {
  String _selectedFilter = 'All';
  ComplaintCategory? _selectedCategory;
  final ComplaintRepository _repository = ComplaintRepository();

  final List<String> _statusFilters = [
    'All',
    'Open',
    'In Progress',
    'Assigned',
    'Completed',
    'Resolved',
    'Closed',
  ];

  @override
  Widget build(BuildContext context) {
    final societyId = ref.watch(societyIdProvider);

    if (societyId == null) {
      return const Center(child: Text('Society not found'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Complaints'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
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
              stream: _repository.getAllComplaintsStream(societyId),
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

                // Apply category filter
                if (_selectedCategory != null) {
                  complaints = complaints
                      .where((c) => c.category == _selectedCategory)
                      .toList();
                }

                if (complaints.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_outlined,
                          size: 64,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No complaints found',
                          style: Theme.of(context).textTheme.titleMedium,
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
                    return _ComplaintCard(
                      complaint: complaint,
                      onTap: () => _navigateToDetail(complaint, societyId),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAssignWorkerDialog(),
        icon: const Icon(Icons.person_add),
        label: const Text('Assign Worker'),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
  }

  ComplaintStatus _getStatusFromFilter(String filter) {
    switch (filter.toLowerCase()) {
      case 'open': return ComplaintStatus.open;
      case 'in progress': return ComplaintStatus.inProgress;
      case 'assigned': return ComplaintStatus.assigned;
      case 'completed': return ComplaintStatus.completed;
      case 'resolved': return ComplaintStatus.resolved;
      case 'closed': return ComplaintStatus.closed;
      default: return ComplaintStatus.open;
    }
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter by Category'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ComplaintCategory.values.map((category) {
              return RadioListTile<ComplaintCategory?>(
                title: Text(_formatCategory(category)),
                value: category,
                groupValue: _selectedCategory,
                onChanged: (value) {
                  Navigator.pop(context);
                  setState(() => _selectedCategory = value);
                },
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => _selectedCategory = null);
            },
            child: const Text('Clear'),
          ),
        ],
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

  void _navigateToDetail(ComplaintEntity complaint, String societyId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _ComplaintDetailScreen(
          complaint: complaint,
          societyId: societyId,
        ),
      ),
    );
  }

  void _showAssignWorkerDialog() {
    // Show dialog to select worker and assign to complaint
    // This would typically show a list of available workers
  }
}

// Complaint Card Widget
class _ComplaintCard extends StatelessWidget {
  final ComplaintEntity complaint;
  final VoidCallback onTap;

  const _ComplaintCard({
    required this.complaint,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
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
                    child: Text(
                      _formatCategory(complaint.category),
                      style: TextStyle(
                        color: _getCategoryColor(complaint.category),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
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
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(complaint.createdAt),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              if (complaint.assignedTo != null) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Assigned to: ${complaint.assignedToName}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
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

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day}/${date.month}/${date.year}';
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

// Complaint Detail Screen for Admin
class _ComplaintDetailScreen extends StatefulWidget {
  final ComplaintEntity complaint;
  final String societyId;

  const _ComplaintDetailScreen({
    required this.complaint,
    required this.societyId,
  });

  @override
  State<_ComplaintDetailScreen> createState() => _ComplaintDetailScreenState();
}

class _ComplaintDetailScreenState extends State<_ComplaintDetailScreen> {
  final ComplaintRepository _repository = ComplaintRepository();
  final ImagePicker _imagePicker = ImagePicker();
  List<File> _evidencePhotos = [];

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
            _buildUpdatesSection(),
            const SizedBox(height: 24),
            _buildActionButtons(),
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
            Text(
              widget.complaint.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(widget.complaint.description),
            const Divider(height: 24),
            Row(
              children: [
                _buildInfoChip(
                  'Category',
                  _formatCategory(widget.complaint.category),
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  'Priority',
                  _formatPriority(widget.complaint.priority),
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  'Status',
                  _formatStatus(widget.complaint.status),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('Flat: ${widget.complaint.flatNumber}'),
            Text('Raised by: ${widget.complaint.raisedByName}'),
            if (widget.complaint.assignedTo != null) ...[
              const SizedBox(height: 8),
              Text(
                'Assigned to: ${widget.complaint.assignedToName}',
                style: TextStyle(color: AppTheme.primaryColor),
              ),
            ],
            if (widget.complaint.photos != null && widget.complaint.photos!.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Text('Photos:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.complaint.photos!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
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

  Widget _buildInfoChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 10, color: Colors.grey.shade700),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdatesSection() {
    if (widget.complaint.updates == null || widget.complaint.updates!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Updates',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ...widget.complaint.updates!.map((update) => Card(
          child: ListTile(
            title: Text(update.action),
            subtitle: Text(update.comment ?? ''),
            trailing: Text(
              _formatDateTime(update.timestamp),
              style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.complaint.status == ComplaintStatus.open ||
            widget.complaint.status == ComplaintStatus.assigned)
          ElevatedButton.icon(
            onPressed: _assignWorker,
            icon: const Icon(Icons.person_add),
            label: const Text('Assign Worker'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        const SizedBox(height: 12),
        if (widget.complaint.status == ComplaintStatus.assigned ||
            widget.complaint.status == ComplaintStatus.inProgress)
          ElevatedButton.icon(
            onPressed: _markInProgress,
            icon: const Icon(Icons.play_arrow),
            label: const Text('Mark as In Progress'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        const SizedBox(height: 12),
        if (widget.complaint.status == ComplaintStatus.completed)
          ElevatedButton.icon(
            onPressed: _markResolved,
            icon: const Icon(Icons.check_circle),
            label: const Text('Mark as Resolved'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: _addUpdate,
          icon: const Icon(Icons.note_add),
          label: const Text('Add Update'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }

  Future<void> _pickEvidencePhotos() async {
    final pickedFiles = await _imagePicker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _evidencePhotos.addAll(pickedFiles.map((f) => File(f.path)));
      });
    }
  }

  Future<void> _assignWorker() async {
    // Show worker selection dialog
    // For now, just update status
    await _repository.updateComplaintStatus(
      societyId: widget.societyId,
      complaintId: widget.complaint.id,
      status: ComplaintStatus.inProgress,
      updatedBy: 'admin',
      comment: 'Work started',
    );
  }

  Future<void> _markInProgress() async {
    await _repository.updateComplaintStatus(
      societyId: widget.societyId,
      complaintId: widget.complaint.id,
      status: ComplaintStatus.workInProgress,
      updatedBy: 'admin',
    );
  }

  Future<void> _markResolved() async {
    await _repository.updateComplaintStatus(
      societyId: widget.societyId,
      complaintId: widget.complaint.id,
      status: ComplaintStatus.resolved,
      updatedBy: 'admin',
    );
  }

  Future<void> _addUpdate() async {
    // Show dialog to add update/note
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

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }
}
