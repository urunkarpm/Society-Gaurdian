import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../../../domain/entities/inventory_item_entity.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/auth_provider.dart';

/// Admin Inventory Management Screen - Full inventory control for admins
class AdminInventoryScreen extends ConsumerStatefulWidget {
  const AdminInventoryScreen({super.key});

  @override
  ConsumerState<AdminInventoryScreen> createState() => _AdminInventoryScreenState();
}

class _AdminInventoryScreenState extends ConsumerState<AdminInventoryScreen> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final ImagePicker _imagePicker = ImagePicker();

  // Categories for filtering
  final List<String> _categories = [
    'All',
    'Electrical',
    'Tools',
    'Cleaning',
    'Plumbing',
    'Safety',
    'Office Supplies',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    final societyId = ref.watch(societyIdProvider);
    
    if (societyId == null) {
      return const Center(child: Text('Society not found'));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddItemDialog(),
            tooltip: 'Add Item',
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => _showTransactionHistory(),
            tooltip: 'Transaction History',
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter Chips
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = category == _selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() => _selectedCategory = category);
                    },
                    avatar: isSelected
                        ? Icon(Icons.check, size: 18, color: Theme.of(context).colorScheme.onPrimary)
                        : null,
                  ),
                );
              },
            ),
          ),
          
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search inventory...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
              ),
              onChanged: (value) => setState(() => _searchQuery = value.toLowerCase()),
            ),
          ),
          
          // Inventory List
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(AppConstants.societiesCollection)
                  .doc(societyId)
                  .collection('inventory')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                var items = snapshot.data?.docs ?? [];
                
                // Filter by category
                if (_selectedCategory != 'All') {
                  items = items.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return (data['category'] ?? '') == _selectedCategory;
                  }).toList();
                }
                
                // Filter by search query
                if (_searchQuery.isNotEmpty) {
                  items = items.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    final name = (data['name'] ?? '').toString().toLowerCase();
                    final description = (data['description'] ?? '').toString().toLowerCase();
                    return name.contains(_searchQuery) || description.contains(_searchQuery);
                  }).toList();
                }

                if (items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 64,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No inventory items',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap + to add your first item',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final doc = items[index];
                    final data = doc.data() as Map<String, dynamic>;
                    return _InventoryItemCard(
                      itemData: data,
                      itemId: doc.id,
                      onUpdateQuantity: _updateQuantity,
                      onEditItem: _editItem,
                      onDeleteItem: _deleteItem,
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

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => _AddInventoryItemDialog(),
    );
  }

  void _showTransactionHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const _InventoryHistoryScreen(),
      ),
    );
  }

  Future<void> _updateQuantity(String itemId, int change, {String? reason, List<String>? photos}) async {
    final societyId = ref.read(societyIdProvider);
    if (societyId == null) return;

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('User not authenticated');

      // Get current item
      final itemDoc = await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('inventory')
          .doc(itemId)
          .get();

      if (!itemDoc.exists) throw Exception('Item not found');

      final currentData = itemDoc.data()!;
      final currentQuantity = currentData['quantity'] as int;
      final newQuantity = currentQuantity + change;

      if (newQuantity < 0) {
        throw Exception('Insufficient quantity');
      }

      // Update item quantity
      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('inventory')
          .doc(itemId)
          .update({
        'quantity': newQuantity,
        'updatedAt': FieldValue.serverTimestamp(),
        'updatedBy': user.uid,
      });

      // Create transaction record
      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('inventory_transactions')
          .add({
        'itemId': itemId,
        'quantityChange': change,
        'transactionType': change > 0 ? 'add' : 'use',
        'reason': reason ?? (change > 0 ? 'Stock added' : 'Item used'),
        'evidencePhotos': photos ?? [],
        'timestamp': FieldValue.serverTimestamp(),
        'performedBy': user.uid,
        'performedByName': user.displayName ?? user.email,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(change > 0 ? 'Stock added successfully' : 'Usage recorded'),
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

  Future<void> _editItem(String itemId, Map<String, dynamic> updatedData) async {
    final societyId = ref.read(societyIdProvider);
    if (societyId == null) return;

    try {
      final user = FirebaseAuth.instance.currentUser;
      
      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('inventory')
          .doc(itemId)
          .update({
        ...updatedData,
        'updatedAt': FieldValue.serverTimestamp(),
        'updatedBy': user?.uid,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item updated successfully'),
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

  Future<void> _deleteItem(String itemId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Item'),
        content: const Text('Are you sure you want to delete this item? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final societyId = ref.read(societyIdProvider);
    if (societyId == null) return;

    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('inventory')
          .doc(itemId)
          .delete();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item deleted successfully'),
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
}

// Inventory Item Card Widget
class _InventoryItemCard extends StatelessWidget {
  final Map<String, dynamic> itemData;
  final String itemId;
  final Function(String itemId, int change, {String? reason, List<String>? photos}) onUpdateQuantity;
  final Function(String itemId, Map<String, dynamic> data) onEditItem;
  final Function(String itemId) onDeleteItem;

  const _InventoryItemCard({
    required this.itemData,
    required this.itemId,
    required this.onUpdateQuantity,
    required this.onEditItem,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    final name = itemData['name'] ?? 'Unknown';
    final category = itemData['category'] ?? 'Uncategorized';
    final type = InventoryItemType.values.firstWhere(
      (e) => e.name == itemData['type'],
      orElse: () => InventoryItemType.durable,
    );
    final quantity = itemData['quantity'] as int? ?? 0;
    final unit = itemData['unit'] ?? 'pieces';
    final minQuantity = itemData['minQuantity'] as int?;
    final location = itemData['location'] as String?;
    final isLowStock = minQuantity != null && quantity <= minQuantity;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: type == InventoryItemType.consumable
              ? Colors.orange.shade100
              : Colors.blue.shade100,
          child: Icon(
            type == InventoryItemType.consumable ? Icons.bolt : Icons.tools,
            color: type == InventoryItemType.consumable ? Colors.orange : Colors.blue,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$category • ${type.name.toUpperCase()}'),
            if (location != null) Text('📍 $location'),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLowStock)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Low Stock',
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
                Text(
                  '$quantity $unit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isLowStock ? Colors.red : null,
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (type == InventoryItemType.consumable) ...[
                  const Text('Quick Actions:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _showUseItemDialog(context),
                          icon: const Icon(Icons.remove),
                          label: const Text('Use (-1)'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _showAddStockDialog(context),
                          icon: const Icon(Icons.add),
                          label: const Text('Add (+1)'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () => _showEditDialog(context),
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () => onDeleteItem(itemId),
                        icon: const Icon(Icons.delete, color: Colors.red),
                        label: const Text('Delete', style: TextStyle(color: Colors.red)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showUseItemDialog(BuildContext context) {
    final reasonController = TextEditingController();
    List<String> evidencePhotos = [];

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Use Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: reasonController,
                  decoration: const InputDecoration(
                    labelText: 'Reason/Location of use',
                    hintText: 'e.g., Replaced tubelight in Lobby Floor 1',
                    prefixIcon: Icon(Icons.note),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                if (evidencePhotos.isNotEmpty) ...[
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: evidencePhotos.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            evidencePhotos[index],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                ElevatedButton.icon(
                  onPressed: () async {
                    // In a real app, implement photo upload here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Photo upload feature coming soon')),
                    );
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Add Evidence Photo'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                onUpdateQuantity(itemId, -1, reason: reasonController.text, photos: evidencePhotos);
                Navigator.pop(dialogContext);
              },
              child: const Text('Confirm Use'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddStockDialog(BuildContext context) {
    final quantityController = TextEditingController(text: '1');
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Stock'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                prefixIcon: Icon(Icons.add_shopping_cart),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              decoration: const InputDecoration(
                labelText: 'Source/Notes',
                hintText: 'e.g., Purchased from store',
                prefixIcon: Icon(Icons.note),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final qty = int.tryParse(quantityController.text) ?? 1;
              onUpdateQuantity(itemId, qty, reason: reasonController.text);
              Navigator.pop(dialogContext);
            },
            child: const Text('Add Stock'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final nameController = TextEditingController(text: itemData['name'] ?? '');
    final categoryController = TextEditingController(text: itemData['category'] ?? '');
    final unitController = TextEditingController(text: itemData['unit'] ?? 'pieces');
    final locationController = TextEditingController(text: itemData['location'] ?? '');
    final minQuantityController = TextEditingController(
      text: (itemData['minQuantity'] ?? '').toString(),
    );

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Item'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: unitController,
                decoration: const InputDecoration(labelText: 'Unit (e.g., pieces, boxes)'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Storage Location'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: minQuantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Minimum Quantity Alert'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              onEditItem(itemId, {
                'name': nameController.text,
                'category': categoryController.text,
                'unit': unitController.text,
                'location': locationController.text,
                'minQuantity': int.tryParse(minQuantityController.text),
              });
              Navigator.pop(dialogContext);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

// Add New Inventory Item Dialog
class _AddInventoryItemDialog extends StatefulWidget {
  @override
  State<_AddInventoryItemDialog> createState() => _AddInventoryItemDialogState();
}

class _AddInventoryItemDialogState extends State<_AddInventoryItemDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController(text: 'Electrical');
  final _unitController = TextEditingController(text: 'pieces');
  final _quantityController = TextEditingController(text: '0');
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _minQuantityController = TextEditingController();
  
  InventoryItemType _selectedType = InventoryItemType.consumable;
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _unitController.dispose();
    _quantityController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _minQuantityController.dispose();
    super.dispose();
  }

  Future<void> _saveItem() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final societyId = context.read<societyIdProvider>();
      if (societyId == null) throw Exception('Society ID not found');

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('User not authenticated');

      final newItem = {
        'name': _nameController.text.trim(),
        'category': _categoryController.text.trim(),
        'type': _selectedType.name,
        'quantity': int.tryParse(_quantityController.text) ?? 0,
        'unit': _unitController.text.trim(),
        'status': 'available',
        'location': _locationController.text.trim(),
        'description': _descriptionController.text.trim(),
        'minQuantity': int.tryParse(_minQuantityController.text),
        'createdAt': FieldValue.serverTimestamp(),
        'createdBy': user.uid,
      };

      await FirebaseFirestore.instance
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection('inventory')
          .add(newItem);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item added successfully'),
            backgroundColor: AppTheme.successColor,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Inventory Item'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                  prefixIcon: Icon(Icons.inventory_2),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Name is required';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<InventoryItemType>(
                value: _selectedType,
                decoration: const InputDecoration(
                  labelText: 'Type',
                  prefixIcon: Icon(Icons.category),
                ),
                items: InventoryItemType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedType = value!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  prefixIcon: Icon(Icons.folder),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Initial Qty',
                        prefixIcon: Icon(Icons.add_shopping_cart),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _unitController,
                      decoration: const InputDecoration(
                        labelText: 'Unit',
                        prefixIcon: Icon(Icons.straighten),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Storage Location',
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _minQuantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Min Quantity Alert',
                  helperText: 'Alert when stock falls below this level',
                  prefixIcon: Icon(Icons.warning),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _isSaving ? null : _saveItem,
          child: _isSaving
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Add Item'),
        ),
      ],
    );
  }
}

// Inventory Transaction History Screen
class _InventoryHistoryScreen extends ConsumerWidget {
  const _InventoryHistoryScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final societyId = ref.watch(societyIdProvider);
    
    if (societyId == null) {
      return const Scaffold(
        body: Center(child: Text('Society not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(AppConstants.societiesCollection)
            .doc(societyId)
            .collection('inventory_transactions')
            .orderBy('timestamp', descending: true)
            .limit(100)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final transactions = snapshot.data?.docs ?? [];

          if (transactions.isEmpty) {
            return const Center(
              child: Text('No transaction history'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final data = transactions[index].data() as Map<String, dynamic>;
              final quantityChange = data['quantityChange'] as int;
              final timestamp = (data['timestamp'] as Timestamp?)?.toDate();
              final isAddition = quantityChange > 0;

              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: isAddition ? Colors.green.shade100 : Colors.red.shade100,
                    child: Icon(
                      isAddition ? Icons.add : Icons.remove,
                      color: isAddition ? Colors.green : Colors.red,
                    ),
                  ),
                  title: Text(
                    '${isAddition ? '+' : ''}$quantityChange items',
                    style: TextStyle(
                      color: isAddition ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['reason'] ?? 'No reason provided'),
                      Text(
                        'By: ${data['performedByName'] ?? 'Unknown'}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      if (timestamp != null)
                        Text(
                          timestamp.toString(),
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                    ],
                  ),
                  trailing: data['evidencePhotos'] != null && 
                          (data['evidencePhotos'] as List).isNotEmpty
                      ? const Icon(Icons.photo, color: Colors.blue)
                      : null,
                  onTap: () {
                    if (data['evidencePhotos'] != null && 
                        (data['evidencePhotos'] as List).isNotEmpty) {
                      _showEvidencePhotos(context, data['evidencePhotos'] as List<String>);
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showEvidencePhotos(BuildContext context, List<String> photos) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Evidence Photos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: photos.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      photos[index],
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
