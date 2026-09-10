import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../providers/auth_provider.dart';

class AdminFlatMembersScreen extends ConsumerStatefulWidget {
  const AdminFlatMembersScreen({super.key});

  @override
  ConsumerState<AdminFlatMembersScreen> createState() => _AdminFlatMembersScreenState();
}

class _AdminFlatMembersScreenState extends ConsumerState<AdminFlatMembersScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String? _selectedBuilding;
  String? _selectedWing;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showAddMemberDialog(String flatId, String flatNumber, String? wing, String buildingNumber) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    String memberType = 'Primary Resident';
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text('Add Member to Flat $flatNumber ${wing != null ? "($wing)" : ""}'),
            content: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (v) => v == null || v.trim().isEmpty ? 'Name required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                      validator: (v) => v == null || v.trim().length < 10 ? 'Valid phone required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: (v) => v == null || !v.contains('@') ? 'Valid email required' : null,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: memberType,
                      decoration: const InputDecoration(
                        labelText: 'Member Type',
                        prefixIcon: Icon(Icons.badge_outlined),
                      ),
                      items: ['Primary Resident', 'Family Member', 'Tenant']
                          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) setDialogState(() => memberType = val);
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
                          final societyId = ref.read(societyIdProvider);
                          final batch = FirebaseFirestore.instance.batch();

                          // Generate new member doc ID
                          final memberRef = FirebaseFirestore.instance
                              .collection(AppConstants.societiesCollection)
                              .doc(societyId)
                              .collection('flat_members')
                              .doc();

                          batch.set(memberRef, {
                            'id': memberRef.id,
                            'flatId': flatId,
                            'flatNumber': flatNumber,
                            'wing': wing,
                            'buildingNumber': buildingNumber,
                            'name': nameController.text.trim(),
                            'phone': phoneController.text.trim(),
                            'email': emailController.text.trim(),
                            'memberType': memberType,
                            'societyId': societyId,
                            'createdAt': FieldValue.serverTimestamp(),
                          });

                          // Update flat document
                          final flatRef = FirebaseFirestore.instance.collection(AppConstants.flatsCollection).doc(flatId);
                          batch.update(flatRef, {
                            'isOccupied': true,
                            'updatedAt': FieldValue.serverTimestamp(),
                          });

                          await batch.commit();

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Member added successfully!'), backgroundColor: Colors.green),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error adding member: $e'), backgroundColor: Colors.red),
                            );
                          }
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: isLoading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Add Member'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _removeMember(String memberId, String memberName, String flatId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Flat Member'),
        content: Text('Are you sure you want to remove $memberName from this flat?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final societyId = ref.read(societyIdProvider);
      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('flat_members')
          .doc(memberId)
          .delete();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Member removed successfully'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error removing member: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final societyId = ref.watch(societyIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flat & Member Management'),
      ),
      body: Column(
        children: [
          // Filter & Search Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by Flat Number or Member Name...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
              ),
              onChanged: (val) => setState(() => _searchQuery = val.toLowerCase().trim()),
            ),
          ),
          // Flats and Members stream
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(AppConstants.flatsCollection)
                  .where('societyId', isEqualTo: societyId)
                  .snapshots(),
              builder: (context, flatSnapshot) {
                if (flatSnapshot.hasError) return Center(child: Text('Error: ${flatSnapshot.error}'));
                if (flatSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final flats = flatSnapshot.data?.docs ?? [];

                if (flats.isEmpty) {
                  return const Center(
                    child: Text('No flats found. Please run the Society Onboarding Wizard.'),
                  );
                }

                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection(AppConstants.societiesCollection)
                      .doc(societyId)
                      .collection('flat_members')
                      .snapshots(),
                  builder: (context, memberSnapshot) {
                    final members = memberSnapshot.data?.docs ?? [];

                    // Group members by flatId
                    final Map<String, List<QueryDocumentSnapshot>> flatMembersMap = {};
                    for (var m in members) {
                      final data = m.data() as Map<String, dynamic>;
                      final fId = data['flatId'] as String?;
                      if (fId != null) {
                        flatMembersMap.putIfAbsent(fId, () => []).add(m);
                      }
                    }

                    // Filter flats
                    final filteredFlats = flats.where((doc) {
                      final data = doc.data() as Map<String, dynamic>;
                      final flatNumber = (data['flatNumber'] ?? '').toString().toLowerCase();
                      final wing = (data['wing'] ?? '').toString().toLowerCase();
                      final bNo = (data['buildingNumber'] ?? '').toString().toLowerCase();
                      final mList = flatMembersMap[doc.id] ?? [];

                      final matchesFlat = flatNumber.contains(_searchQuery) ||
                          wing.contains(_searchQuery) ||
                          bNo.contains(_searchQuery);

                      final matchesMember = mList.any((m) {
                        final mData = m.data() as Map<String, dynamic>;
                        final name = (mData['name'] ?? '').toString().toLowerCase();
                        return name.contains(_searchQuery);
                      });

                      return _searchQuery.isEmpty || matchesFlat || matchesMember;
                    }).toList();

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredFlats.length,
                      itemBuilder: (context, index) {
                        final flatDoc = filteredFlats[index];
                        final flatData = flatDoc.data() as Map<String, dynamic>;
                        final flatId = flatDoc.id;
                        final flatNumber = flatData['flatNumber'] ?? '';
                        final wing = flatData['wing'];
                        final buildingNumber = flatData['buildingNumber'] ?? '1';
                        final floor = flatData['floor'];
                        final isRefuge = flatData['isRefugeArea'] == true;
                        final fMembers = flatMembersMap[flatId] ?? [];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ExpansionTile(
                            leading: CircleAvatar(
                              backgroundColor: isRefuge
                                  ? Colors.amber.shade100
                                  : (fMembers.isNotEmpty
                                      ? Colors.green.shade100
                                      : Colors.grey.shade200),
                              child: Icon(
                                isRefuge
                                    ? Icons.security
                                    : (fMembers.isNotEmpty ? Icons.home : Icons.home_outlined),
                                color: isRefuge
                                    ? Colors.amber.shade800
                                    : (fMembers.isNotEmpty ? Colors.green : Colors.grey),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  'Flat $flatNumber ${wing != null ? "($wing)" : ""}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                if (isRefuge) ...[
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.amber.shade700,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Text(
                                      'REFUGE',
                                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            subtitle: Text('Building $buildingNumber • Floor $floor • ${fMembers.length} Members'),
                            trailing: IconButton(
                              icon: const Icon(Icons.person_add_alt_1, color: Colors.blue),
                              tooltip: 'Add Member',
                              onPressed: () => _showAddMemberDialog(flatId, flatNumber, wing, buildingNumber),
                            ),
                            children: [
                              if (fMembers.isEmpty)
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text('No members added to this flat yet.'),
                                )
                              else
                                ...fMembers.map((m) {
                                  final mData = m.data() as Map<String, dynamic>;
                                  final mName = mData['name'] ?? 'Unknown';
                                  final mPhone = mData['phone'] ?? '';
                                  final mEmail = mData['email'] ?? '';
                                  final mType = mData['memberType'] ?? 'Resident';

                                  return ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                                    leading: const CircleAvatar(
                                      radius: 16,
                                      child: Icon(Icons.person, size: 18),
                                    ),
                                    title: Text(mName, style: const TextStyle(fontWeight: FontWeight.w600)),
                                    subtitle: Text('$mType • $mPhone • $mEmail'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                                      onPressed: () => _removeMember(m.id, mName, flatId),
                                    ),
                                  );
                                }).toList(),
                            ],
                          ),
                        );
                      },
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
}
