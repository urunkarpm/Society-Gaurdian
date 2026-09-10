import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../../core/utils/logger.dart';
import '../../domain/entities/vendor_entity.dart';

/// Vendor collection name
const String vendorsCollection = 'vendors';

/// Vendor service provider
final vendorServiceProvider = Provider<VendorService>((ref) {
  return VendorService();
});

/// Vendor list stream provider for a society
final vendorsStreamProvider = StreamProvider.family<List<VendorEntity>, String>((ref, societyId) {
  final vendorService = ref.watch(vendorServiceProvider);
  return vendorService.getVendorsStream(societyId);
});

/// Vendor Service to handle CRUD and notifications for vendors
class VendorService {
  final FirebaseFirestore? _firestoreOverride;

  VendorService({FirebaseFirestore? firestore}) : _firestoreOverride = firestore;

  FirebaseFirestore get _firestore => _firestoreOverride ?? FirebaseFirestore.instance;

  /// Get stream of all vendors for a given society
  Stream<List<VendorEntity>> getVendorsStream(String societyId) {
    return _firestore
        .collection(AppConstants.societiesCollection)
        .doc(societyId)
        .collection(vendorsCollection)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return VendorEntity.fromJson(data);
      }).toList();
    });
  }

  /// Create or update vendor
  Future<void> saveVendor(VendorEntity vendor) async {
    try {
      final docRef = _firestore
          .collection(AppConstants.societiesCollection)
          .doc(vendor.societyId)
          .collection(vendorsCollection)
          .doc(vendor.id.isEmpty ? null : vendor.id);

      final now = DateTime.now();
      final data = vendor.toJson();
      data['updatedAt'] = now.toIso8601String();
      if (vendor.id.isEmpty) {
        data['id'] = docRef.id;
        data['createdAt'] = now.toIso8601String();
      }

      await docRef.set(data, SetOptions(merge: true));
      Logger.firestore('save', vendorsCollection, docId: docRef.id);
    } catch (e, stackTrace) {
      Logger.error('Failed to save vendor', error: e, stackTrace: stackTrace, tag: 'VendorService');
      rethrow;
    }
  }

  /// Delete vendor
  Future<void> deleteVendor(String societyId, String vendorId) async {
    try {
      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(vendorsCollection)
          .doc(vendorId)
          .delete();
      Logger.firestore('delete', vendorsCollection, docId: vendorId);
    } catch (e, stackTrace) {
      Logger.error('Failed to delete vendor', error: e, stackTrace: stackTrace, tag: 'VendorService');
      rethrow;
    }
  }

  /// Add contract to vendor
  Future<void> addContract(String societyId, String vendorId, VendorContractEntity contract) async {
    try {
      final vendorDoc = await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(vendorsCollection)
          .doc(vendorId)
          .get();

      if (!vendorDoc.exists) return;
      final vendor = VendorEntity.fromJson(vendorDoc.data()!);
      final updatedContracts = [...vendor.contracts, contract];

      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(vendorsCollection)
          .doc(vendorId)
          .update({
        'contracts': updatedContracts.map((c) => c.toJson()).toList(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e, stackTrace) {
      Logger.error('Failed to add contract', error: e, stackTrace: stackTrace, tag: 'VendorService');
      rethrow;
    }
  }

  /// Add bill to vendor
  Future<void> addBill(String societyId, String vendorId, VendorBillEntity bill) async {
    try {
      final vendorDoc = await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(vendorsCollection)
          .doc(vendorId)
          .get();

      if (!vendorDoc.exists) return;
      final vendor = VendorEntity.fromJson(vendorDoc.data()!);
      final updatedBills = [...vendor.bills, bill];

      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(vendorsCollection)
          .doc(vendorId)
          .update({
        'bills': updatedBills.map((b) => b.toJson()).toList(),
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e, stackTrace) {
      Logger.error('Failed to add bill', error: e, stackTrace: stackTrace, tag: 'VendorService');
      rethrow;
    }
  }

  /// Add performance log or complaint to vendor
  Future<void> addPerformanceLog(String societyId, String vendorId, VendorPerformanceEntity log) async {
    try {
      final vendorDoc = await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(vendorsCollection)
          .doc(vendorId)
          .get();

      if (!vendorDoc.exists) return;
      final vendor = VendorEntity.fromJson(vendorDoc.data()!);
      final updatedLogs = [...vendor.performanceLogs, log];

      // Calculate average rating if ratings exist
      final ratings = updatedLogs.map((l) => l.rating).whereType<double>().toList();
      final avgRating = ratings.isNotEmpty
          ? (ratings.reduce((a, b) => a + b) / ratings.length)
          : vendor.rating;

      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(vendorsCollection)
          .doc(vendorId)
          .update({
        'performanceLogs': updatedLogs.map((l) => l.toJson()).toList(),
        'rating': avgRating,
        'updatedAt': DateTime.now().toIso8601String(),
      });
    } catch (e, stackTrace) {
      Logger.error('Failed to add performance log', error: e, stackTrace: stackTrace, tag: 'VendorService');
      rethrow;
    }
  }

  /// Helper to filter contracts expiring within given days (default 30)
  List<({VendorEntity vendor, VendorContractEntity contract, int daysRemaining})> getExpiringContracts(
      List<VendorEntity> vendors, {int daysThreshold = 30}) {
    final now = DateTime.now();
    final result = <({VendorEntity vendor, VendorContractEntity contract, int daysRemaining})>[];

    for (final vendor in vendors) {
      for (final contract in vendor.contracts) {
        final diff = contract.expiryDate.difference(now).inDays;
        if (diff >= 0 && diff <= daysThreshold && contract.status == 'active') {
          result.add((vendor: vendor, contract: contract, daysRemaining: diff));
        }
      }
    }
    return result;
  }
}
