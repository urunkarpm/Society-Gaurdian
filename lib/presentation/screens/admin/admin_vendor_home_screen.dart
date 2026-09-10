import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/vendor_entity.dart';
import '../../providers/auth_provider.dart';
import '../../providers/vendor_provider.dart';

class AdminVendorHomeScreen extends ConsumerStatefulWidget {
  const AdminVendorHomeScreen({super.key});

  @override
  ConsumerState<AdminVendorHomeScreen> createState() => _AdminVendorHomeScreenState();
}

class _AdminVendorHomeScreenState extends ConsumerState<AdminVendorHomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final societyId = ref.watch(societyIdProvider);
    final vendorsAsync = ref.watch(vendorsStreamProvider(societyId ?? ''));
    final vendorService = ref.watch(vendorServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendor Management'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.contacts), text: 'Vendor Directory'),
            Tab(icon: Icon(Icons.handyman), text: 'AMC & Contracts'),
            Tab(icon: Icon(Icons.receipt_long), text: 'Bills & Payments'),
            Tab(icon: Icon(Icons.star_rate), text: 'Performance & Complaints'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_alt_1),
            tooltip: 'Add Vendor',
            onPressed: () => _showAddVendorDialog(context, ref, societyId ?? ''),
          ),
        ],
      ),
      body: vendorsAsync.when(
        data: (vendors) {
          final expiringContracts = vendorService.getExpiringContracts(vendors, daysThreshold: 30);

          return Column(
            children: [
              // AMC Expiry Notification Banner
              if (expiringContracts.isNotEmpty)
                Container(
                  color: Colors.amber.shade100,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '⚠️ ${expiringContracts.length} AMC/Contract(s) expiring within 30 days:',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              expiringContracts.map((e) => '${e.contract.title} (${e.vendor.name}) - ${e.daysRemaining} days left').join('\n'),
                              style: const TextStyle(fontSize: 12, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => _tabController.animateTo(1),
                        child: const Text('View Contracts'),
                      ),
                    ],
                  ),
                ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _VendorDirectoryTab(vendors: vendors, societyId: societyId ?? ''),
                    _VendorContractsTab(vendors: vendors, societyId: societyId ?? ''),
                    _VendorBillsTab(vendors: vendors, societyId: societyId ?? ''),
                    _VendorPerformanceTab(vendors: vendors, societyId: societyId ?? ''),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error loading vendors: $e')),
      ),
    );
  }

  void _showAddVendorDialog(BuildContext context, WidgetRef ref, String societyId) {
    final nameCtrl = TextEditingController();
    final categoryCtrl = TextEditingController(text: 'Elevator');
    final contactPersonCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final gstCtrl = TextEditingController();
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add New Vendor'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: categoryCtrl.text,
                  decoration: const InputDecoration(labelText: 'Category', prefixIcon: Icon(Icons.category)),
                  items: ['Elevator', 'Electrical', 'Plumbing', 'Security', 'Cleaning', 'Landscaping', 'General']
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) {
                    if (v != null) setDialogState(() => categoryCtrl.text = v);
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Vendor / Company Name *', prefixIcon: Icon(Icons.business)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: contactPersonCtrl,
                  decoration: const InputDecoration(labelText: 'Contact Person *', prefixIcon: Icon(Icons.person)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Phone Number *', prefixIcon: Icon(Icons.phone)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: addressCtrl,
                  decoration: const InputDecoration(labelText: 'Address', prefixIcon: Icon(Icons.location_on)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: gstCtrl,
                  decoration: const InputDecoration(labelText: 'GST Number', prefixIcon: Icon(Icons.receipt)),
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
                      if (nameCtrl.text.trim().isEmpty ||
                          contactPersonCtrl.text.trim().isEmpty ||
                          phoneCtrl.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill required fields (Name, Contact, Phone)')),
                        );
                        return;
                      }

                      setDialogState(() => isLoading = true);
                      try {
                        final vendor = VendorEntity(
                          id: '',
                          societyId: societyId,
                          name: nameCtrl.text.trim(),
                          category: categoryCtrl.text.trim(),
                          contactPerson: contactPersonCtrl.text.trim(),
                          phone: phoneCtrl.text.trim(),
                          email: emailCtrl.text.trim().isEmpty ? null : emailCtrl.text.trim(),
                          address: addressCtrl.text.trim().isEmpty ? null : addressCtrl.text.trim(),
                          gstNumber: gstCtrl.text.trim().isEmpty ? null : gstCtrl.text.trim(),
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                        );

                        await ref.read(vendorServiceProvider).saveVendor(vendor);

                        if (context.mounted) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Vendor added successfully!'), backgroundColor: Colors.green),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error adding vendor: $e')));
                        }
                      } finally {
                        if (context.mounted) setDialogState(() => isLoading = false);
                      }
                    },
              child: isLoading
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Save Vendor'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Vendor Directory Tab
class _VendorDirectoryTab extends ConsumerWidget {
  final List<VendorEntity> vendors;
  final String societyId;

  const _VendorDirectoryTab({required this.vendors, required this.societyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (vendors.isEmpty) {
      return const Center(child: Text('No vendors added yet. Tap top right + to add a vendor.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: vendors.length,
      itemBuilder: (context, index) {
        final vendor = vendors[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        vendor.name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Chip(
                      label: Text(vendor.category),
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.person, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('${vendor.contactPerson} • ${vendor.phone}'),
                  ],
                ),
                if (vendor.email != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.email, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(vendor.email!),
                    ],
                  ),
                ],
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text('${vendor.rating.toStringAsFixed(1)} / 5.0'),
                    const SizedBox(width: 16),
                    Text('${vendor.contracts.length} Contracts'),
                    const SizedBox(width: 16),
                    Text('${vendor.bills.length} Bills'),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      tooltip: 'Delete Vendor',
                      onPressed: () => _confirmDeleteVendor(context, ref, vendor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _confirmDeleteVendor(BuildContext context, WidgetRef ref, VendorEntity vendor) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${vendor.name}?'),
        content: const Text('Are you sure you want to delete this vendor and all associated records?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await ref.read(vendorServiceProvider).deleteVendor(societyId, vendor.id);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

/// Vendor Contracts & AMC Tab
class _VendorContractsTab extends ConsumerWidget {
  final List<VendorEntity> vendors;
  final String societyId;

  const _VendorContractsTab({required this.vendors, required this.societyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat dateFormat = DateFormat('dd MMM yyyy');

    final allContracts = <({VendorEntity vendor, VendorContractEntity contract})>[];
    for (final v in vendors) {
      for (final c in v.contracts) {
        allContracts.add((vendor: v, contract: c));
      }
    }

    return Scaffold(
      floatingActionButton: vendors.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () => _showAddContractDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('Add Contract / AMC'),
            )
          : null,
      body: allContracts.isEmpty
          ? const Center(child: Text('No active contracts or AMCs found.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: allContracts.length,
              itemBuilder: (context, index) {
                final item = allContracts[index];
                final contract = item.contract;
                final vendor = item.vendor;
                final daysRemaining = contract.expiryDate.difference(DateTime.now()).inDays;
                final isExpiringSoon = daysRemaining >= 0 && daysRemaining <= 30;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: isExpiringSoon
                      ? RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.orange, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              contract.title,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            if (isExpiringSoon)
                              Chip(
                                label: Text('⚠️ Expires in $daysRemaining days'),
                                backgroundColor: Colors.amber.shade200,
                              )
                            else
                              Chip(
                                label: Text(contract.status.toUpperCase()),
                                backgroundColor: Colors.green.shade100,
                              ),
                          ],
                        ),
                        Text('Vendor: ${vendor.name} (${vendor.contactPerson})', style: const TextStyle(fontWeight: FontWeight.w500)),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Monthly: ₹${contract.monthlyCost.toStringAsFixed(2)}'),
                            Text('Expires: ${dateFormat.format(contract.expiryDate)}'),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Last Service: ${contract.lastServiceDate != null ? dateFormat.format(contract.lastServiceDate!) : "N/A"}'),
                            Text('Next Service: ${contract.nextServiceDate != null ? dateFormat.format(contract.nextServiceDate!) : "N/A"}'),
                          ],
                        ),
                        if (contract.contractDocumentUrl != null && contract.contractDocumentUrl!.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Text('Document URL: ${contract.contractDocumentUrl}', style: const TextStyle(color: Colors.blue, fontSize: 12)),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _showAddContractDialog(BuildContext context, WidgetRef ref) {
    if (vendors.isEmpty) return;

    String selectedVendorId = vendors.first.id;
    final titleCtrl = TextEditingController();
    final serviceTypeCtrl = TextEditingController(text: 'Elevator Maintenance');
    final monthlyCostCtrl = TextEditingController();
    final docUrlCtrl = TextEditingController();
    final notesCtrl = TextEditingController();

    DateTime startDate = DateTime.now();
    DateTime expiryDate = DateTime.now().add(const Duration(days: 365));
    DateTime? lastServiceDate = DateTime.now().subtract(const Duration(days: 30));
    DateTime? nextServiceDate = DateTime.now().add(const Duration(days: 30));
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add Contract / AMC'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedVendorId,
                  decoration: const InputDecoration(labelText: 'Select Vendor', prefixIcon: Icon(Icons.business)),
                  items: vendors.map((v) => DropdownMenuItem(value: v.id, child: Text(v.name))).toList(),
                  onChanged: (v) {
                    if (v != null) setDialogState(() => selectedVendorId = v);
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: 'Contract Title *', hintText: 'e.g. Lift AMC Block A'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: serviceTypeCtrl,
                  decoration: const InputDecoration(labelText: 'Service Type', hintText: 'e.g. Elevator'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: monthlyCostCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Monthly Cost (₹) *', prefixText: '₹ '),
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: Text('Start Date: ${DateFormat('dd MMM yyyy').format(startDate)}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final picked = await showDatePicker(context: context, initialDate: startDate, firstDate: DateTime(2020), lastDate: DateTime(2035));
                    if (picked != null) setDialogState(() => startDate = picked);
                  },
                ),
                ListTile(
                  title: Text('Expiry Date: ${DateFormat('dd MMM yyyy').format(expiryDate)}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final picked = await showDatePicker(context: context, initialDate: expiryDate, firstDate: DateTime(2020), lastDate: DateTime(2035));
                    if (picked != null) setDialogState(() => expiryDate = picked);
                  },
                ),
                ListTile(
                  title: Text('Last Service: ${lastServiceDate != null ? DateFormat('dd MMM yyyy').format(lastServiceDate!) : "Select"}'),
                  trailing: const Icon(Icons.build_circle_outlined),
                  onTap: () async {
                    final picked = await showDatePicker(context: context, initialDate: lastServiceDate ?? DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2035));
                    if (picked != null) setDialogState(() => lastServiceDate = picked);
                  },
                ),
                ListTile(
                  title: Text('Next Service: ${nextServiceDate != null ? DateFormat('dd MMM yyyy').format(nextServiceDate!) : "Select"}'),
                  trailing: const Icon(Icons.event),
                  onTap: () async {
                    final picked = await showDatePicker(context: context, initialDate: nextServiceDate ?? DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2035));
                    if (picked != null) setDialogState(() => nextServiceDate = picked);
                  },
                ),
                TextField(
                  controller: docUrlCtrl,
                  decoration: const InputDecoration(labelText: 'Document / Receipt Link', prefixIcon: Icon(Icons.attach_file)),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: isLoading ? null : () => Navigator.pop(context), child: const Text('Cancel')),
            FilledButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      if (titleCtrl.text.trim().isEmpty || monthlyCostCtrl.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill title and monthly cost.')),
                        );
                        return;
                      }

                      setDialogState(() => isLoading = true);
                      try {
                        final contract = VendorContractEntity(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          vendorId: selectedVendorId,
                          title: titleCtrl.text.trim(),
                          serviceType: serviceTypeCtrl.text.trim(),
                          startDate: startDate,
                          expiryDate: expiryDate,
                          monthlyCost: double.tryParse(monthlyCostCtrl.text) ?? 0.0,
                          lastServiceDate: lastServiceDate,
                          nextServiceDate: nextServiceDate,
                          contractDocumentUrl: docUrlCtrl.text.trim().isEmpty ? null : docUrlCtrl.text.trim(),
                          notes: notesCtrl.text.trim().isEmpty ? null : notesCtrl.text.trim(),
                        );

                        await ref.read(vendorServiceProvider).addContract(societyId, selectedVendorId, contract);

                        if (context.mounted) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Contract added successfully!'), backgroundColor: Colors.green),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error adding contract: $e')));
                        }
                      } finally {
                        if (context.mounted) setDialogState(() => isLoading = false);
                      }
                    },
              child: isLoading
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Save Contract'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Vendor Bills & Payments Tab
class _VendorBillsTab extends ConsumerWidget {
  final List<VendorEntity> vendors;
  final String societyId;

  const _VendorBillsTab({required this.vendors, required this.societyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat dateFormat = DateFormat('dd MMM yyyy');

    final allBills = <({VendorEntity vendor, VendorBillEntity bill})>[];
    for (final v in vendors) {
      for (final b in v.bills) {
        allBills.add((vendor: v, bill: b));
      }
    }

    return Scaffold(
      floatingActionButton: vendors.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () => _showAddBillDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('Add Bill'),
            )
          : null,
      body: allBills.isEmpty
          ? const Center(child: Text('No bills or payments logged yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: allBills.length,
              itemBuilder: (context, index) {
                final item = allBills[index];
                final bill = item.bill;
                final vendor = item.vendor;

                Color statusColor = Colors.orange;
                if (bill.status.toLowerCase() == 'paid') {
                  statusColor = Colors.green;
                } else if (bill.status.toLowerCase() == 'overdue') {
                  statusColor = Colors.red;
                }

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: statusColor.withValues(alpha: 0.2),
                      child: Icon(Icons.receipt, color: statusColor),
                    ),
                    title: Text('Invoice: ${bill.invoiceNumber} • ₹${bill.amount.toStringAsFixed(2)}'),
                    subtitle: Text('Vendor: ${vendor.name}\nDue: ${dateFormat.format(bill.dueDate)} • Status: ${bill.status.toUpperCase()}'),
                    trailing: bill.status.toLowerCase() == 'paid'
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : TextButton(
                            onPressed: () => _markBillAsPaid(context, ref, vendor, bill),
                            child: const Text('Mark Paid'),
                          ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }

  void _showAddBillDialog(BuildContext context, WidgetRef ref) {
    if (vendors.isEmpty) return;

    String selectedVendorId = vendors.first.id;
    final invoiceCtrl = TextEditingController();
    final amountCtrl = TextEditingController();
    final notesCtrl = TextEditingController();
    DateTime dueDate = DateTime.now().add(const Duration(days: 15));
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add Vendor Bill'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedVendorId,
                  decoration: const InputDecoration(labelText: 'Select Vendor', prefixIcon: Icon(Icons.business)),
                  items: vendors.map((v) => DropdownMenuItem(value: v.id, child: Text(v.name))).toList(),
                  onChanged: (v) {
                    if (v != null) setDialogState(() => selectedVendorId = v);
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: invoiceCtrl,
                  decoration: const InputDecoration(labelText: 'Invoice Number *', prefixIcon: Icon(Icons.numbers)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: amountCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Amount (₹) *', prefixIcon: Icon(Icons.attach_money)),
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: Text('Due Date: ${DateFormat('dd MMM yyyy').format(dueDate)}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final picked = await showDatePicker(context: context, initialDate: dueDate, firstDate: DateTime(2020), lastDate: DateTime(2035));
                    if (picked != null) setDialogState(() => dueDate = picked);
                  },
                ),
                TextField(
                  controller: notesCtrl,
                  decoration: const InputDecoration(labelText: 'Notes', prefixIcon: Icon(Icons.note)),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: isLoading ? null : () => Navigator.pop(context), child: const Text('Cancel')),
            FilledButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      if (invoiceCtrl.text.trim().isEmpty || amountCtrl.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter invoice number and amount.')),
                        );
                        return;
                      }

                      setDialogState(() => isLoading = true);
                      try {
                        final bill = VendorBillEntity(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          vendorId: selectedVendorId,
                          invoiceNumber: invoiceCtrl.text.trim(),
                          amount: double.tryParse(amountCtrl.text) ?? 0.0,
                          dueDate: dueDate,
                          status: 'pending',
                          notes: notesCtrl.text.trim().isEmpty ? null : notesCtrl.text.trim(),
                          createdAt: DateTime.now(),
                        );

                        await ref.read(vendorServiceProvider).addBill(societyId, selectedVendorId, bill);

                        if (context.mounted) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Bill added successfully!'), backgroundColor: Colors.green),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error adding bill: $e')));
                        }
                      } finally {
                        if (context.mounted) setDialogState(() => isLoading = false);
                      }
                    },
              child: isLoading
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Save Bill'),
            ),
          ],
        ),
      ),
    );
  }

  void _markBillAsPaid(BuildContext context, WidgetRef ref, VendorEntity vendor, VendorBillEntity bill) async {
    final updatedBills = vendor.bills.map((b) {
      if (b.id == bill.id) {
        return b.copyWith(status: 'paid', paidAt: DateTime.now());
      }
      return b;
    }).toList();

    final updatedVendor = vendor.copyWith(bills: updatedBills);
    await ref.read(vendorServiceProvider).saveVendor(updatedVendor);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invoice ${bill.invoiceNumber} marked as Paid!'), backgroundColor: Colors.green),
      );
    }
  }
}

/// Vendor Performance & Complaints Tab
class _VendorPerformanceTab extends ConsumerWidget {
  final List<VendorEntity> vendors;
  final String societyId;

  const _VendorPerformanceTab({required this.vendors, required this.societyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat dateFormat = DateFormat('dd MMM yyyy');

    final allLogs = <({VendorEntity vendor, VendorPerformanceEntity log})>[];
    for (final v in vendors) {
      for (final l in v.performanceLogs) {
        allLogs.add((vendor: v, log: l));
      }
    }

    return Scaffold(
      floatingActionButton: vendors.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () => _showAddLogDialog(context, ref),
              icon: const Icon(Icons.rate_review),
              label: const Text('Log Review / Complaint'),
            )
          : null,
      body: allLogs.isEmpty
          ? const Center(child: Text('No performance ratings or complaints logged yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: allLogs.length,
              itemBuilder: (context, index) {
                final item = allLogs[index];
                final log = item.log;
                final vendor = item.vendor;

                final isComplaint = log.type.toLowerCase() == 'complaint';

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isComplaint ? Colors.red.shade100 : Colors.amber.shade100,
                      child: Icon(
                        isComplaint ? Icons.report_problem : Icons.star,
                        color: isComplaint ? Colors.red : Colors.amber.shade800,
                      ),
                    ),
                    title: Text('${log.title} (${vendor.name})'),
                    subtitle: Text('${log.description}\nType: ${log.type.toUpperCase()} • Rating: ${log.rating ?? "N/A"} ⭐ • Date: ${log.date != null ? dateFormat.format(log.date!) : "N/A"}'),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }

  void _showAddLogDialog(BuildContext context, WidgetRef ref) {
    if (vendors.isEmpty) return;

    String selectedVendorId = vendors.first.id;
    String type = 'review'; // review, complaint, service_log
    double rating = 5.0;
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Log Rating / Complaint'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedVendorId,
                  decoration: const InputDecoration(labelText: 'Select Vendor', prefixIcon: Icon(Icons.business)),
                  items: vendors.map((v) => DropdownMenuItem(value: v.id, child: Text(v.name))).toList(),
                  onChanged: (v) {
                    if (v != null) setDialogState(() => selectedVendorId = v);
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  initialValue: type,
                  decoration: const InputDecoration(labelText: 'Type', prefixIcon: Icon(Icons.category)),
                  items: const [
                    DropdownMenuItem(value: 'review', child: Text('Performance Review')),
                    DropdownMenuItem(value: 'complaint', child: Text('Vendor Complaint')),
                    DropdownMenuItem(value: 'service_log', child: Text('Service Log')),
                  ],
                  onChanged: (v) {
                    if (v != null) setDialogState(() => type = v);
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text('Rating: '),
                    Expanded(
                      child: Slider(
                        value: rating,
                        min: 1.0,
                        max: 5.0,
                        divisions: 8,
                        label: rating.toStringAsFixed(1),
                        onChanged: (v) => setDialogState(() => rating = v),
                      ),
                    ),
                    Text('${rating.toStringAsFixed(1)} ⭐'),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: 'Title *', prefixIcon: Icon(Icons.title)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descCtrl,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: 'Description', prefixIcon: Icon(Icons.description)),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: isLoading ? null : () => Navigator.pop(context), child: const Text('Cancel')),
            FilledButton(
              onPressed: isLoading
                  ? null
                  : () async {
                      if (titleCtrl.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill title.')),
                        );
                        return;
                      }

                      setDialogState(() => isLoading = true);
                      try {
                        final log = VendorPerformanceEntity(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          vendorId: selectedVendorId,
                          type: type,
                          title: titleCtrl.text.trim(),
                          description: descCtrl.text.trim(),
                          rating: rating,
                          date: DateTime.now(),
                          createdAt: DateTime.now(),
                        );

                        await ref.read(vendorServiceProvider).addPerformanceLog(societyId, selectedVendorId, log);

                        if (context.mounted) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Log added successfully!'), backgroundColor: Colors.green),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error adding log: $e')));
                        }
                      } finally {
                        if (context.mounted) setDialogState(() => isLoading = false);
                      }
                    },
              child: isLoading
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Save Log'),
            ),
          ],
        ),
      ),
    );
  }
}
