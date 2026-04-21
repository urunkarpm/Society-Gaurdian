import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/logger.dart';
import '../../providers/auth_provider.dart';

/// Waiting for Approval Screen - Shown after resident submits society selection
class WaitingApprovalScreen extends ConsumerStatefulWidget {
  const WaitingApprovalScreen({super.key});

  @override
  ConsumerState<WaitingApprovalScreen> createState() => _WaitingApprovalScreenState();
}

class _WaitingApprovalScreenState extends ConsumerState<WaitingApprovalScreen> {
  Map<String, dynamic>? _verificationRequest;
  bool _isLoading = true;
  String? _rejectionReason;
  
  @override
  void initState() {
    super.initState();
    _loadVerificationStatus();
  }
  
  Future<void> _loadVerificationStatus() async {
    setState(() => _isLoading = true);
    
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('No user logged in');
      
      // Get the latest verification request for this user
      final snapshot = await FirebaseFirestore.instance
          .collection('residence_verifications')
          .where('userId', isEqualTo: user.uid)
          .orderBy('requestedAt', descending: true)
          .limit(1)
          .get();
      
      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        setState(() {
          _verificationRequest = {...doc.data(), 'id': doc.id};
          _rejectionReason = _verificationRequest?['rejectionReason'];
          _isLoading = false;
        });
        
        // Check if approved and redirect
        if (_verificationRequest?['status'] == 'approved') {
          // Update user role to resident if not already set
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({
            'role': 'resident',
            'verificationStatus': 'approved',
          });
          
          if (mounted) {
            context.go('/resident/home');
          }
        }
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e, stackTrace) {
      Logger.error('Failed to load verification status', error: e, stackTrace: stackTrace, tag: 'WaitingApproval');
      setState(() => _isLoading = false);
    }
  }
  
  Future<void> _resubmitRequest() async {
    // Delete the rejected request and allow resubmission
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('No user logged in');
      
      // Delete the rejected request
      if (_verificationRequest != null) {
        await FirebaseFirestore.instance
            .collection('residence_verifications')
            .doc(_verificationRequest!['id'])
            .delete();
      }
      
      // Reset verification status
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'verificationStatus': null,
        'societyId': null,
        'flatId': null,
      });
      
      if (mounted) {
        context.go('/select-residence');
      }
    } catch (e, stackTrace) {
      Logger.error('Failed to resubmit request', error: e, stackTrace: stackTrace, tag: 'WaitingApproval');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to resubmit: ${e.toString()}')),
        );
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Status'),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadVerificationStatus,
            tooltip: 'Refresh Status',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _verificationRequest == null
              ? _buildNoRequestState()
              : _buildVerificationStatus(),
    );
  }
  
  Widget _buildNoRequestState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.help_outline,
              size: 80,
              color: AppTheme.textHint,
            ),
            const SizedBox(height: 24),
            Text(
              'No Verification Request Found',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'It seems you haven\'t submitted a residence verification request yet.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.go('/select-residence'),
              icon: const Icon(Icons.home_outlined),
              label: const Text('Submit Request'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildVerificationStatus() {
    final status = _verificationRequest?['status'] ?? 'pending';
    final requestedAt = (_verificationRequest?['requestedAt'] as Timestamp?)?.toDate();
    final reviewedAt = (_verificationRequest?['reviewedAt'] as Timestamp?)?.toDate();
    final reviewedBy = _verificationRequest?['reviewedBy'];
    
    IconData statusIcon;
    Color statusColor;
    String statusText;
    String statusMessage;
    
    switch (status) {
      case 'approved':
        statusIcon = Icons.check_circle_outline;
        statusColor = Colors.green;
        statusText = 'Approved!';
        statusMessage = 'Your residence verification has been approved. You now have access to all resident features.';
        break;
      case 'rejected':
        statusIcon = Icons.cancel_outlined;
        statusColor = Colors.red;
        statusText = 'Rejected';
        statusMessage = 'Your residence verification was rejected. Please review the reason and resubmit if needed.';
        break;
      default:
        statusIcon = Icons.pending_actions_outlined;
        statusColor = Colors.orange;
        statusText = 'Pending Review';
        statusMessage = 'Your request is being reviewed by the admin. Please wait for approval.';
    }
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          
          // Status Icon
          Icon(
            statusIcon,
            size: 80,
            color: statusColor,
          ),
          const SizedBox(height: 24),
          
          // Status Title
          Text(
            statusText,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: statusColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          
          // Status Message
          Text(
            statusMessage,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          
          // Request Details Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Request Details',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  _buildDetailRow('Society', _verificationRequest?['societyId'] ?? 'N/A'),
                  _buildDetailRow('Building', _verificationRequest?['buildingNumber'] ?? 'N/A'),
                  _buildDetailRow('Wing', _verificationRequest?['wing'] ?? 'N/A'),
                  _buildDetailRow('Flat Number', _verificationRequest?['flatNumber'] ?? 'N/A'),
                  _buildDetailRow(
                    'Submitted On',
                    requestedAt != null
                        ? '${requestedAt.day}/${requestedAt.month}/${requestedAt.year}'
                        : 'N/A',
                  ),
                  if (reviewedAt != null) ...[
                    _buildDetailRow(
                      'Reviewed On',
                      '${reviewedAt.day}/${reviewedAt.month}/${reviewedAt.year}',
                    ),
                  ],
                  if (reviewedBy != null) ...[
                    _buildDetailRow('Reviewed By', reviewedBy),
                  ],
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Rejection Reason (if rejected)
          if (status == 'rejected' && _rejectionReason != null) ...[
            Card(
              color: Colors.red.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.error_outline, color: Colors.red.shade700),
                        const SizedBox(width: 8),
                        Text(
                          'Rejection Reason',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _rejectionReason!,
                      style: TextStyle(color: Colors.red.shade700),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Resubmit Button
            ElevatedButton.icon(
              onPressed: _resubmitRequest,
              icon: const Icon(Icons.refresh),
              label: const Text('Resubmit Request'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ] else if (status == 'pending') ...[
            // Pending Actions
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue.shade700),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'You can continue to check this page for updates. You will be automatically redirected once approved.',
                        style: TextStyle(color: Colors.blue.shade700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Cancel Button
            OutlinedButton.icon(
              onPressed: _resubmitRequest,
              icon: const Icon(Icons.edit),
              label: const Text('Edit Request'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ] else if (status == 'approved') ...[
            // Approved - Go to Home
            ElevatedButton.icon(
              onPressed: () => context.go('/resident/home'),
              icon: const Icon(Icons.home),
              label: const Text('Go to Home'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
          
          const SizedBox(height: 24),
          
          // Contact Admin
          Card(
            color: AppTheme.primaryColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.contact_support, color: AppTheme.primaryColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Need help? Contact your society administrator.',
                      style: TextStyle(color: AppTheme.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
}
