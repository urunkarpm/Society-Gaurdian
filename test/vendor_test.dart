import 'package:flutter_test/flutter_test.dart';
import 'package:society_guardian/domain/entities/vendor_entity.dart';
import 'package:society_guardian/presentation/providers/vendor_provider.dart';

void main() {
  group('Vendor Entities & VendorService Tests', () {
    final now = DateTime.now();

    final testContractExpiringSoon = VendorContractEntity(
      id: 'c1',
      vendorId: 'v1',
      title: 'Lift AMC Block A',
      serviceType: 'Elevator',
      startDate: now.subtract(const Duration(days: 330)),
      expiryDate: now.add(const Duration(days: 15)), // Expiring in 15 days
      monthlyCost: 18500.0,
      lastServiceDate: now.subtract(const Duration(days: 20)),
      nextServiceDate: now.add(const Duration(days: 10)),
    );

    final testContractNotExpiring = VendorContractEntity(
      id: 'c2',
      vendorId: 'v1',
      title: 'Lift AMC Block B',
      serviceType: 'Elevator',
      startDate: now,
      expiryDate: now.add(const Duration(days: 200)), // Expiring in 200 days
      monthlyCost: 18500.0,
    );

    final testVendor = VendorEntity(
      id: 'v1',
      societyId: 'soc123',
      name: 'XYZ Elevators',
      category: 'Elevator',
      contactPerson: 'John Doe',
      phone: '+919876543210',
      contracts: [testContractExpiringSoon, testContractNotExpiring],
      bills: [
        VendorBillEntity(
          id: 'b1',
          vendorId: 'v1',
          invoiceNumber: 'INV-001',
          amount: 18500.0,
          dueDate: now.add(const Duration(days: 5)),
          status: 'pending',
        ),
      ],
      performanceLogs: [
        VendorPerformanceEntity(
          id: 'p1',
          vendorId: 'v1',
          type: 'review',
          title: 'Good service',
          description: 'Timely maintenance done',
          rating: 4.5,
        ),
      ],
    );

    test('VendorEntity JSON serialization and deserialization', () {
      final json = testVendor.toJson();
      expect(json['id'], 'v1');
      expect(json['name'], 'XYZ Elevators');
      expect(json['category'], 'Elevator');

      final deserialized = VendorEntity.fromJson(json);
      expect(deserialized.name, testVendor.name);
      expect(deserialized.contracts.length, 2);
      expect(deserialized.bills.length, 1);
      expect(deserialized.performanceLogs.length, 1);
    });

    test('getExpiringContracts returns contracts expiring within 30 days', () {
      final vendorService = VendorService();
      final expiring = vendorService.getExpiringContracts([testVendor], daysThreshold: 30);

      expect(expiring.length, 1);
      expect(expiring.first.contract.title, 'Lift AMC Block A');
      expect(expiring.first.vendor.name, 'XYZ Elevators');
      expect(expiring.first.daysRemaining, inInclusiveRange(14, 15));
    });
  });
}
