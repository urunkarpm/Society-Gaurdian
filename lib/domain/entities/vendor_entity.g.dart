// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorContractEntityImpl _$$VendorContractEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$VendorContractEntityImpl(
      id: json['id'] as String,
      vendorId: json['vendorId'] as String,
      title: json['title'] as String,
      serviceType: json['serviceType'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      monthlyCost: (json['monthlyCost'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'INR',
      lastServiceDate: json['lastServiceDate'] == null
          ? null
          : DateTime.parse(json['lastServiceDate'] as String),
      nextServiceDate: json['nextServiceDate'] == null
          ? null
          : DateTime.parse(json['nextServiceDate'] as String),
      contractDocumentUrl: json['contractDocumentUrl'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String? ?? 'active',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$VendorContractEntityImplToJson(
        _$VendorContractEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendorId': instance.vendorId,
      'title': instance.title,
      'serviceType': instance.serviceType,
      'startDate': instance.startDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'monthlyCost': instance.monthlyCost,
      'currency': instance.currency,
      'lastServiceDate': instance.lastServiceDate?.toIso8601String(),
      'nextServiceDate': instance.nextServiceDate?.toIso8601String(),
      'contractDocumentUrl': instance.contractDocumentUrl,
      'notes': instance.notes,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$VendorBillEntityImpl _$$VendorBillEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$VendorBillEntityImpl(
      id: json['id'] as String,
      vendorId: json['vendorId'] as String,
      contractId: json['contractId'] as String?,
      invoiceNumber: json['invoiceNumber'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'INR',
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: json['status'] as String,
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
      paymentMethod: json['paymentMethod'] as String?,
      transactionId: json['transactionId'] as String?,
      receiptUrl: json['receiptUrl'] as String?,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$VendorBillEntityImplToJson(
        _$VendorBillEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendorId': instance.vendorId,
      'contractId': instance.contractId,
      'invoiceNumber': instance.invoiceNumber,
      'amount': instance.amount,
      'currency': instance.currency,
      'dueDate': instance.dueDate.toIso8601String(),
      'status': instance.status,
      'paidAt': instance.paidAt?.toIso8601String(),
      'paymentMethod': instance.paymentMethod,
      'transactionId': instance.transactionId,
      'receiptUrl': instance.receiptUrl,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$VendorPerformanceEntityImpl _$$VendorPerformanceEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$VendorPerformanceEntityImpl(
      id: json['id'] as String,
      vendorId: json['vendorId'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      loggedBy: json['loggedBy'] as String?,
      loggedByName: json['loggedByName'] as String?,
      linkedComplaintId: json['linkedComplaintId'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$VendorPerformanceEntityImplToJson(
        _$VendorPerformanceEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendorId': instance.vendorId,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'rating': instance.rating,
      'loggedBy': instance.loggedBy,
      'loggedByName': instance.loggedByName,
      'linkedComplaintId': instance.linkedComplaintId,
      'date': instance.date?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$VendorEntityImpl _$$VendorEntityImplFromJson(Map<String, dynamic> json) =>
    _$VendorEntityImpl(
      id: json['id'] as String,
      societyId: json['societyId'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      contactPerson: json['contactPerson'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      gstNumber: json['gstNumber'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
      status: json['status'] as String? ?? 'active',
      contracts: (json['contracts'] as List<dynamic>?)
              ?.map((e) =>
                  VendorContractEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bills: (json['bills'] as List<dynamic>?)
              ?.map((e) => VendorBillEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      performanceLogs: (json['performanceLogs'] as List<dynamic>?)
              ?.map((e) =>
                  VendorPerformanceEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$VendorEntityImplToJson(_$VendorEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societyId': instance.societyId,
      'name': instance.name,
      'category': instance.category,
      'contactPerson': instance.contactPerson,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'gstNumber': instance.gstNumber,
      'rating': instance.rating,
      'status': instance.status,
      'contracts': instance.contracts.map((e) => e.toJson()).toList(),
      'bills': instance.bills.map((e) => e.toJson()).toList(),
      'performanceLogs':
          instance.performanceLogs.map((e) => e.toJson()).toList(),
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
