import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../providers/auth_provider.dart';

class ResidentHomeScreen extends ConsumerStatefulWidget {
  const ResidentHomeScreen({super.key});

  @override
  ConsumerState<ResidentHomeScreen> createState() => _ResidentHomeScreenState();
}

class _ResidentHomeScreenState extends ConsumerState<ResidentHomeScreen> {
  void _showNewRequestDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descController = TextEditingController();
    String category = 'Plumbing';
    String urgency = 'Normal';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Raise Service Request'),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      value: category,
                      decoration: const InputDecoration(
                        labelText: 'Service Needed',
                        prefixIcon: Icon(Icons.build),
                      ),
                      items: ['Plumbing', 'Electrical', 'Carpenter', 'Pest Control', 'General']
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setDialogState(() => category = val);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title / Issue',
                        hintText: 'e.g. Tap leaking in kitchen',
                        prefixIcon: Icon(Icons.title),
                      ),
                      validator: (v) => v == null || v.trim().isEmpty ? 'Title required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: descController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Description & Details',
                        hintText: 'Describe the issue...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: urgency,
                      decoration: const InputDecoration(
                        labelText: 'Urgency',
                        prefixIcon: Icon(Icons.priority_high),
                      ),
                      items: ['Low', 'Normal', 'Urgent', 'Emergency']
                          .map((u) => DropdownMenuItem(value: u, child: Text(u)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setDialogState(() => urgency = val);
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: isLoading ? null : () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (!formKey.currentState!.validate()) return;
                        setDialogState(() => isLoading = true);

                        try {
                          final user = FirebaseAuth.instance.currentUser;
                          final currentUserEntity = ref.read(currentUserProvider);
                          final societyId = ref.read(societyIdProvider);

                          final reqRef = FirebaseFirestore.instance
                              .collection(AppConstants.societiesCollection)
                              .doc(societyId)
                              .collection('service_requests')
                              .doc();

                          await reqRef.set({
                            'id': reqRef.id,
                            'societyId': societyId,
                            'residentId': user?.uid,
                            'residentName': user?.displayName ?? user?.email ?? 'Resident',
                            'flatNumber': currentUserEntity?.flatId ?? 'Unassigned',
                            'category': category,
                            'title': titleController.text.trim(),
                            'description': descController.text.trim(),
                            'urgency': urgency,
                            'status': 'Open',
                            'createdAt': FieldValue.serverTimestamp(),
                            'updatedAt': FieldValue.serverTimestamp(),
                            'workLogs': [
                              {
                                'status': 'Open',
                                'notes': 'Request created by resident.',
                                'updatedBy': user?.displayName ?? 'Resident',
                                'timestamp': DateTime.now().toIso8601String(),
                              }
                            ],
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Service request submitted!'), backgroundColor: Colors.green),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
                            );
                          }
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Submit Request'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resident Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) context.go('/login');
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showNewRequestDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('Raise Service Request'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final societyId = ref.watch(societyIdProvider);
          final user = FirebaseAuth.instance.currentUser;

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(AppConstants.societiesCollection)
                .doc(societyId)
                .collection('service_requests')
                .where('residentId', isEqualTo: user?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final docs = snapshot.data?.docs ?? [];

              if (docs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.handyman_outlined, size: 64, color: Colors.grey.shade400),
                      const SizedBox(height: 16),
                      const Text('No service requests raised yet.'),
                      const SizedBox(height: 8),
                      const Text('Tap "Raise Service Request" below to request help.'),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];
                  final data = doc.data() as Map<String, dynamic>;
                  final category = data['category'] ?? 'General';
                  final title = data['title'] ?? 'Request';
                  final status = data['status'] ?? 'Open';
                  final urgency = data['urgency'] ?? 'Normal';
                  final workLogs = (data['workLogs'] as List<dynamic>?) ?? [];

                  Color statusColor = Colors.blue;
                  if (status == 'Completed') statusColor = Colors.green;
                  if (status == 'Waiting for Part') statusColor = Colors.orange;
                  if (status == 'In Progress') statusColor = Colors.purple;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ExpansionTile(
                      leading: CircleAvatar(
                        backgroundColor: statusColor.withOpacity(0.15),
                        child: Icon(
                          category == 'Plumbing'
                              ? Icons.plumbing
                              : (category == 'Electrical' ? Icons.electrical_services : Icons.build),
                          color: statusColor,
                        ),
                      ),
                      title: Text('$category: $title', style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Urgency: $urgency • Status: $status'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Real-time Updates & Logs:', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              ...workLogs.map((log) {
                                final lMap = log as Map<String, dynamic>;
                                final lStatus = lMap['status'] ?? '';
                                final lNotes = lMap['notes'] ?? '';
                                final lBy = lMap['updatedBy'] ?? 'Staff';

                                return Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        lStatus == 'Completed'
                                            ? Icons.check_circle
                                            : Icons.info_outline,
                                        size: 16,
                                        color: lStatus == 'Completed' ? Colors.green : Colors.blue,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text('[$lStatus] $lNotes ($lBy)'),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
