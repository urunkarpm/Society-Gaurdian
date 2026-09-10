import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/parking_slot_entity.dart';
import '../../providers/auth_provider.dart';

class AdminParkingScreen extends ConsumerStatefulWidget {
  const AdminParkingScreen({super.key});

  @override
  ConsumerState<AdminParkingScreen> createState() => _AdminParkingScreenState();
}

class _AdminParkingScreenState extends ConsumerState<AdminParkingScreen> {
  void _showAddEditParkingSlotDialog(BuildContext context, {DocumentSnapshot? docToEdit}) {
    final isEditing = docToEdit != null;
    final data = isEditing ? docToEdit.data() as Map<String, dynamic> : null;

    final slotNumberController = TextEditingController(text: data?['slotNumber'] ?? '');
    final floorZoneController = TextEditingController(text: data?['floorZone'] ?? 'Ground');
    final flatNumberController = TextEditingController(text: data?['assignedFlatNumber'] ?? '');

    ParkingType selectedType = ParkingType.values.firstWhere(
      (e) => e.name == data?['type'],
      orElse: () => ParkingType.visitor,
    );

    ParkingCategory selectedCategory = ParkingCategory.values.firstWhere(
      (e) => e.name == data?['category'],
      orElse: () => ParkingCategory.standard,
    );

    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: Text(isEditing ? 'Edit Parking Slot' : 'Add Parking Slot'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: slotNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Slot Number / Name',
                      hintText: 'e.g. B2-147 or V-32',
                      prefixIcon: Icon(Icons.local_parking),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<ParkingType>(
                    initialValue: selectedType,
                    decoration: const InputDecoration(
                      labelText: 'Parking Type',
                      prefixIcon: Icon(Icons.merge_type),
                    ),
                    items: ParkingType.values.map((t) {
                      return DropdownMenuItem(
                        value: t,
                        child: Text(t.name.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) setDialogState(() => selectedType = val);
                    },
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<ParkingCategory>(
                    initialValue: selectedCategory,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      prefixIcon: Icon(Icons.category),
                    ),
                    items: ParkingCategory.values.map((c) {
                      return DropdownMenuItem(
                        value: c,
                        child: Text(c.name.toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) setDialogState(() => selectedCategory = val);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: floorZoneController,
                    decoration: const InputDecoration(
                      labelText: 'Floor / Zone',
                      hintText: 'e.g. Basement 1, Ground, Gate 1',
                      prefixIcon: Icon(Icons.layers),
                    ),
                  ),
                  if (selectedType == ParkingType.resident) ...[
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: flatNumberController,
                      decoration: const InputDecoration(
                        labelText: 'Assigned Flat Number (Optional)',
                        hintText: 'e.g. B-1204',
                        prefixIcon: Icon(Icons.home),
                      ),
                    ),
                  ],
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
                        final slotNum = slotNumberController.text.trim();
                        if (slotNum.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Slot number is required')),
                          );
                          return;
                        }

                        setDialogState(() => isLoading = true);
                        try {
                          final societyId = ref.read(societyIdProvider);
                          final collectionRef = FirebaseFirestore.instance
                              .collection('societies')
                              .doc(societyId)
                              .collection('parking_slots');

                          final slotData = {
                            'slotNumber': slotNum,
                            'type': selectedType.name,
                            'category': selectedCategory.name,
                            'floorZone': floorZoneController.text.trim().isEmpty
                                ? 'Ground'
                                : floorZoneController.text.trim(),
                            'assignedFlatNumber': selectedType == ParkingType.resident
                                ? flatNumberController.text.trim()
                                : null,
                            'updatedAt': FieldValue.serverTimestamp(),
                          };

                          if (isEditing) {
                            await docToEdit.reference.update(slotData);
                          } else {
                            slotData['societyId'] = societyId ?? '';
                            slotData['isOccupied'] = false;
                            slotData['createdAt'] = FieldValue.serverTimestamp();
                            await collectionRef.add(slotData);
                          }

                          if (context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(isEditing
                                    ? 'Slot updated successfully!'
                                    : 'Slot created successfully!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: $e')),
                            );
                          }
                        } finally {
                          if (context.mounted) setDialogState(() => isLoading = false);
                        }
                      },
                child: Text(isEditing ? 'Update Slot' : 'Add Slot'),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final societyId = ref.watch(societyIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Setup & Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_location_alt),
            onPressed: () => _showAddEditParkingSlotDialog(context),
            tooltip: 'Add Parking Slot',
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('societies')
            .doc(societyId)
            .collection('parking_slots')
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
                  Icon(Icons.directions_car_filled_outlined, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  const Text('No parking slots configured yet.'),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () => _showAddEditParkingSlotDialog(context),
                    icon: const Icon(Icons.add),
                    label: const Text('Configure First Parking Slot'),
                  ),
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
              final slotNumber = data['slotNumber'] ?? 'N/A';
              final type = data['type'] ?? 'visitor';
              final category = data['category'] ?? 'standard';
              final floorZone = data['floorZone'] ?? 'Ground';
              final isOccupied = data['isOccupied'] == true;
              final flatNumber = data['assignedFlatNumber'] ?? '';

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: type == 'visitor' ? Colors.amber.shade100 : Colors.blue.shade100,
                    child: Icon(
                      category == 'ev' ? Icons.electric_car : Icons.local_parking,
                      color: type == 'visitor' ? Colors.amber.shade900 : Colors.blue.shade900,
                    ),
                  ),
                  title: Row(
                    children: [
                      Text(
                        'Slot $slotNumber',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text(
                          type.toUpperCase(),
                          style: const TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        backgroundColor: type == 'visitor' ? Colors.orange : Colors.blue,
                        visualDensity: VisualDensity.compact,
                      ),
                      if (category == 'ev') ...[
                        const SizedBox(width: 4),
                        Chip(
                          label: const Text('EV', style: TextStyle(fontSize: 10, color: Colors.white)),
                          backgroundColor: Colors.green,
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
                    ],
                  ),
                  subtitle: Text(
                    'Floor/Zone: $floorZone' +
                        (flatNumber.isNotEmpty ? ' • Flat: $flatNumber' : '') +
                        ' • Status: ${isOccupied ? "Occupied" : "Empty"}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _showAddEditParkingSlotDialog(context, docToEdit: doc),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text('Delete Slot'),
                              content: Text('Are you sure you want to delete slot $slotNumber?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, true),
                                  child: const Text('Delete', style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          );
                          if (confirm == true) {
                            await doc.reference.delete();
                          }
                        },
                      ),
                    ],
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
