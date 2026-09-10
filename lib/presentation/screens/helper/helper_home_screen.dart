import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../providers/auth_provider.dart';

class HelperHomeScreen extends ConsumerStatefulWidget {
  const HelperHomeScreen({super.key});

  @override
  ConsumerState<HelperHomeScreen> createState() => _HelperHomeScreenState();
}

class _HelperHomeScreenState extends ConsumerState<HelperHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const _HelperRequestsList(),
      const _HelperInventoryView(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Assigned Work Queue' : 'Society Inventory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                context.go('/login');
              }
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (idx) => setState(() => _currentIndex = idx),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.handyman_outlined),
            selectedIcon: Icon(Icons.handyman),
            label: 'Service Requests',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Inventory',
          ),
        ],
      ),
    );
  }
}

class _HelperRequestsList extends ConsumerWidget {
  const _HelperRequestsList();

  void _showUpdateStatusDialog(BuildContext context, WidgetRef ref, String docId, String currentStatus) {
    final notesController = TextEditingController();
    String selectedStatus = currentStatus;
    bool isLoading = false;

    final statuses = [
      'Acknowledged',
      'In Progress',
      'Waiting for Part',
      'Completed',
    ];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Update Work Status'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    value: statuses.contains(selectedStatus) ? selectedStatus : 'In Progress',
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      prefixIcon: Icon(Icons.star_outline),
                    ),
                    items: statuses.map((st) => DropdownMenuItem(value: st, child: Text(st))).toList(),
                    onChanged: (val) {
                      if (val != null) setDialogState(() => selectedStatus = val);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: notesController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Work Done / Notes / Parts Needed',
                      hintText: 'e.g., Replaced 2 light bulbs, waiting for faucet part...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
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
                        setDialogState(() => isLoading = true);
                        try {
                          final user = FirebaseAuth.instance.currentUser;
                          final societyId = ref.read(societyIdProvider);

                          await FirebaseFirestore.instance
                              .collection(AppConstants.societiesCollection)
                              .doc(societyId)
                              .collection('service_requests')
                              .doc(docId)
                              .update({
                            'status': selectedStatus,
                            'lastUpdatedBy': user?.displayName ?? user?.email ?? 'Helper',
                            'lastUpdatedById': user?.uid,
                            'updatedAt': FieldValue.serverTimestamp(),
                            'workLogs': FieldValue.arrayUnion([
                              {
                                'status': selectedStatus,
                                'notes': notesController.text.trim(),
                                'updatedBy': user?.displayName ?? user?.email ?? 'Helper',
                                'timestamp': DateTime.now().toIso8601String(),
                              }
                            ]),
                          });

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Status updated successfully!'), backgroundColor: Colors.green),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error updating status: $e'), backgroundColor: Colors.red),
                            );
                          }
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Update Status'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyId = ref.watch(societyIdProvider);

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('service_requests')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data?.docs ?? [];

        if (docs.isEmpty) {
          return const Center(
            child: Text('No service requests available in queue.'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[index];
            final data = doc.data() as Map<String, dynamic>;
            final docId = doc.id;
            final category = data['category'] ?? 'General';
            final title = data['title'] ?? 'Service Request';
            final description = data['description'] ?? '';
            final flatNumber = data['flatNumber'] ?? 'Unknown Flat';
            final residentName = data['residentName'] ?? 'Resident';
            final status = data['status'] ?? 'Open';
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
                subtitle: Text('Flat: $flatNumber ($residentName)\nStatus: $status'),
                trailing: ElevatedButton(
                  onPressed: () => _showUpdateStatusDialog(context, ref, docId, status),
                  child: const Text('Update'),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (description.isNotEmpty) ...[
                          const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(description),
                          const SizedBox(height: 12),
                        ],
                        const Text('Work History / Logs:', style: TextStyle(fontWeight: FontWeight.bold)),
                        if (workLogs.isEmpty)
                          const Text('No updates logged yet.')
                        else
                          ...workLogs.map((log) {
                            final lMap = log as Map<String, dynamic>;
                            final lStatus = lMap['status'] ?? '';
                            final lNotes = lMap['notes'] ?? '';
                            final lBy = lMap['updatedBy'] ?? 'Helper';

                            return Container(
                              margin: const EdgeInsets.only(top: 6),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(lStatus, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text(lBy, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
                                  ),
                                  if (lNotes.isNotEmpty) Text(lNotes),
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
  }
}

class _HelperInventoryView extends ConsumerWidget {
  const _HelperInventoryView();

  void _showMarkInventoryDialog(BuildContext context, WidgetRef ref, String itemId, String itemName, int currentQty, bool isUsing) {
    final qtyController = TextEditingController(text: '1');
    final reasonController = TextEditingController();
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text(isUsing ? 'Mark Item as Used' : 'Return / Mark as Unused'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Item: $itemName (Available: $currentQty)'),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: qtyController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      prefixIcon: Icon(Icons.numbers),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: reasonController,
                    decoration: const InputDecoration(
                      labelText: 'Reason / Flat / Service Request',
                      hintText: 'e.g. Used for Flat 204 plumbing repair',
                    ),
                  ),
                ],
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
                        final changeQty = int.tryParse(qtyController.text) ?? 1;
                        if (isUsing && changeQty > currentQty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Cannot use more than available quantity')),
                          );
                          return;
                        }

                        setDialogState(() => isLoading = true);
                        try {
                          final user = FirebaseAuth.instance.currentUser;
                          final societyId = ref.read(societyIdProvider);
                          final batch = FirebaseFirestore.instance.batch();

                          final newQty = isUsing ? (currentQty - changeQty) : (currentQty + changeQty);

                          final itemRef = FirebaseFirestore.instance
                              .collection(AppConstants.societiesCollection)
                              .doc(societyId)
                              .collection('inventory_items')
                              .doc(itemId);

                          batch.update(itemRef, {
                            'quantity': newQty,
                            'updatedAt': FieldValue.serverTimestamp(),
                          });

                          final txRef = FirebaseFirestore.instance
                              .collection(AppConstants.societiesCollection)
                              .doc(societyId)
                              .collection('inventory_transactions')
                              .doc();

                          batch.set(txRef, {
                            'id': txRef.id,
                            'itemId': itemId,
                            'itemName': itemName,
                            'quantityChange': isUsing ? -changeQty : changeQty,
                            'performedBy': user?.displayName ?? user?.email ?? 'Helper',
                            'performedById': user?.uid,
                            'reason': reasonController.text.trim(),
                            'type': isUsing ? 'usage' : 'return',
                            'timestamp': FieldValue.serverTimestamp(),
                          });

                          await batch.commit();

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Inventory updated successfully!'), backgroundColor: Colors.green),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error updating inventory: $e'), backgroundColor: Colors.red),
                            );
                          }
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : Text(isUsing ? 'Mark as Used' : 'Mark as Unused'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyId = ref.watch(societyIdProvider);

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('inventory_items')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final items = snapshot.data?.docs ?? [];

        if (items.isEmpty) {
          return const Center(
            child: Text('No inventory items found.'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final doc = items[index];
            final data = doc.data() as Map<String, dynamic>;
            final itemId = doc.id;
            final name = data['name'] ?? 'Item';
            final category = data['category'] ?? 'General';
            final quantity = (data['quantity'] as num?)?.toInt() ?? 0;
            final minQuantity = (data['minQuantity'] as num?)?.toInt() ?? 0;

            final isLow = quantity <= minQuantity;

            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: isLow ? Colors.red.shade100 : Colors.blue.shade100,
                  child: Icon(
                    Icons.inventory_2,
                    color: isLow ? Colors.red : Colors.blue,
                  ),
                ),
                title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Category: $category • Stock: $quantity'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton(
                      onPressed: () => _showMarkInventoryDialog(context, ref, itemId, name, quantity, true),
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text('Use'),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () => _showMarkInventoryDialog(context, ref, itemId, name, quantity, false),
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
                      child: const Text('Return'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
