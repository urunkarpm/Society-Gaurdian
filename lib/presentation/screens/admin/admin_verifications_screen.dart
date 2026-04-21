import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/logger.dart';

/// Admin screen for managing residence verification requests
class AdminVerificationsScreen extends ConsumerStatefulWidget {
  const AdminVerificationsScreen({super.key});

  @override
  ConsumerState<AdminVerificationsScreen> createState() => _AdminVerificationsScreenState();
}

class _AdminVerificationsScreenState extends ConsumerState<AdminVerificationsScreen> {
  String _filterStatus = 'pending'; // pending, approved, rejected, all
  
  Future<void> _approveRequest(String requestId, String userId, String societyId, String flatId) async {
    try {
      final adminUser = FirebaseAuth.instance.currentUser;
      if (adminUser == null) throw Exception('No admin logged in');
      
      // Update verification request
      await FirebaseFirestore.instance
          .collection('residence_verifications')
          .doc(requestId)
          .update({
        'status': 'approved',
        'reviewedAt': FieldValue.serverTimestamp(),
        'reviewedBy': adminUser.email ?? adminUser.uid,
      });
      
      // Update user profile
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({
        'role': 'resident',
        'societyId': societyId,
        'flatId': flatId,
        'verificationStatus': 'approved',
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Request approved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e, stackTrace) {
      Logger.error('Failed to approve request', error: e, stackTrace: stackTrace, tag: 'AdminVerifications');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to approve: ${e.toString()}')),
        );
      }
    }
  }
  
  Future<void> _rejectRequest(String requestId, String userId) async {
    final reasonController = TextEditingController();
    
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reject Request'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please provide a reason for rejection:'),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                hintText: 'Rejection reason',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Reject'),
          ),
        ],
      ),
    );
    
    if (confirmed != true) return;
    
    final reason = reasonController.text.trim();
    if (reason.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please provide a rejection reason')),
        );
      }
      return;
    }
    
    try {
      final adminUser = FirebaseAuth.instance.currentUser;
      if (adminUser == null) throw Exception('No admin logged in');
      
      // Update verification request
      await FirebaseFirestore.instance
          .collection('residence_verifications')
          .doc(requestId)
          .update({
        'status': 'rejected',
        'rejectionReason': reason,
        'reviewedAt': FieldValue.serverTimestamp(),
        'reviewedBy': adminUser.email ?? adminUser.uid,
      });
      
      // Update user profile
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({
        'verificationStatus': 'rejected',
        'updatedAt': FieldValue.serverTimestamp(),
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Request rejected'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e, stackTrace) {
      Logger.error('Failed to reject request', error: e, stackTrace: stackTrace, tag: 'AdminVerifications');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to reject: ${e.toString()}')),
        );
      }
    }
  }
  
  void _showRequestDetails(Map<String, dynamic> request) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Verification Request Details'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('User Email', request['userEmail'] ?? 'N/A'),
              _buildDetailRow('User Name', request['userName'] ?? 'N/A'),
              _buildDetailRow('Society ID', request['societyId'] ?? 'N/A'),
              _buildDetailRow('Building Number', request['buildingNumber'] ?? 'N/A'),
              _buildDetailRow('Wing', request['wing'] ?? 'N/A'),
              _buildDetailRow('Flat Number', request['flatNumber'] ?? 'N/A'),
              _buildDetailRow('Status', request['status'] ?? 'pending'),
              if (request['rejectionReason'] != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Rejection Reason:',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Text(request['rejectionReason']),
              ],
              if (request['reviewedBy'] != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Reviewed By: ${request['reviewedBy']}',
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Residence Verifications'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => setState(() => _filterStatus = value),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'pending', child: Text('Pending')),
              const PopupMenuItem(value: 'approved', child: Text('Approved')),
              const PopupMenuItem(value: 'rejected', child: Text('Rejected')),
              const PopupMenuItem(value: 'all', child: Text('All')),
            ],
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(Icons.filter_list),
                  const SizedBox(width: 8),
                  Text(_filterStatus.toUpperCase()),
                ],
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _filterStatus == 'all'
            ? FirebaseFirestore.instance
                .collection('residence_verifications')
                .orderBy('requestedAt', descending: true)
                .snapshots()
            : FirebaseFirestore.instance
                .collection('residence_verifications')
                .where('status', isEqualTo: _filterStatus)
                .orderBy('requestedAt', descending: true)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          final requests = snapshot.data?.docs ?? [];
          
          if (requests.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.folder_open_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No verification requests found',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _filterStatus == 'pending'
                        ? 'All caught up! No pending requests.'
                        : 'No requests with this status.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }
          
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final doc = requests[index];
              final data = doc.data() as Map<String, dynamic>;
              final requestId = doc.id;
              final userId = data['userId'] ?? '';
              final userEmail = data['userEmail'] ?? 'Unknown';
              final userName = data['userName'] ?? 'Unknown';
              final buildingNumber = data['buildingNumber'] ?? 'N/A';
              final wing = data['wing'] ?? 'N/A';
              final flatNumber = data['flatNumber'] ?? 'N/A';
              final status = data['status'] ?? 'pending';
              final requestedAt = (data['requestedAt'] as Timestamp?)?.toDate();
              
              Color statusColor;
              IconData statusIcon;
              
              switch (status) {
                case 'approved':
                  statusColor = Colors.green;
                  statusIcon = Icons.check_circle;
                  break;
                case 'rejected':
                  statusColor = Colors.red;
                  statusIcon = Icons.cancel;
                  break;
                default:
                  statusColor = Colors.orange;
                  statusIcon = Icons.pending_actions;
              }
              
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: () => _showRequestDetails(data),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(statusIcon, color: statusColor, size: 28),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userName != 'Unknown' ? userName : userEmail,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    userEmail,
                                    style: TextStyle(
                                      color: AppTheme.textSecondary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Chip(
                              label: Text(
                                status.toUpperCase(),
                                style: const TextStyle(fontSize: 12, color: Colors.white),
                              ),
                              backgroundColor: statusColor,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            ),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          children: [
                            const Icon(Icons.home_outlined, size: 18, color: AppTheme.textSecondary),
                            const SizedBox(width: 8),
                            Text(
                              'Building $buildingNumber${wing != 'N/A' && wing != null ? ', Wing $wing' : ''}, Flat $flatNumber',
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        if (requestedAt != null) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 18, color: AppTheme.textSecondary),
                              const SizedBox(width: 8),
                              Text(
                                'Requested: ${requestedAt.day}/${requestedAt.month}/${requestedAt.year}',
                                style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                        if (status == 'pending') ...[
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton.icon(
                                onPressed: () => _rejectRequest(requestId, userId),
                                icon: const Icon(Icons.close),
                                label: const Text('Reject'),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton.icon(
                                onPressed: () {
                                  final societyId = data['societyId'] ?? '';
                                  final flatId = data['flatId'] ?? '';
                                  _approveRequest(requestId, userId, societyId, flatId);
                                },
                                icon: const Icon(Icons.check),
                                label: const Text('Approve'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
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
            },
          );
        },
      ),
    );
  }
}
