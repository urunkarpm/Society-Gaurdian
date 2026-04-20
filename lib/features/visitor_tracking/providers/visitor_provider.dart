import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../core/constants/app_constants.dart';
import '../../../domain/entities/user_entity.dart';

part 'visitor_provider.g.dart';

/// Visitor state
class VisitorState {
  final bool isLoading;
  final bool isSubmitting;
  final String? error;
  final List<VisitorEntity> visitors;
  final VisitorEntity? currentVisitor;

  const VisitorState({
    this.isLoading = false,
    this.isSubmitting = false,
    this.error,
    this.visitors = const [],
    this.currentVisitor,
  });

  VisitorState copyWith({
    bool? isLoading,
    bool? isSubmitting,
    String? error,
    List<VisitorEntity>? visitors,
    VisitorEntity? currentVisitor,
  }) {
    return VisitorState(
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error ?? this.error,
      visitors: visitors ?? this.visitors,
      currentVisitor: currentVisitor ?? this.currentVisitor,
    );
  }
}

/// Visitor provider
@riverpod
class Visitor extends _$Visitor {
  late final FirebaseFirestore _firestore;

  @override
  VisitorState build() {
    _firestore = FirebaseFirestore.instance;
    return const VisitorState();
  }

  /// Create a new visitor entry
  Future<Either<String, String>> createVisitor(VisitorEntity visitor) async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      // Write visitor to Firestore
      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(visitor.societyId)
          .collection(AppConstants.visitorsCollection)
          .doc(visitor.id)
          .set(visitor.toJson());

      // Fetch flat members to send notifications
      final flatDoc = await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(visitor.societyId)
          .collection(AppConstants.flatsCollection)
          .doc(visitor.hostFlatId)
          .get();

      if (flatDoc.exists) {
        final flatData = flatDoc.data()!;
        final memberUids = List<String>.from(flatData['memberUids'] ?? []);

        // Send FCM notifications to all flat members
        await _sendVisitorNotifications(visitor, memberUids);
      }

      state = state.copyWith(isSubmitting: false);
      return const Right(visitor.id);
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: 'Failed to create visitor: ${e.toString()}',
      );
      return Left('Failed to create visitor: ${e.toString()}');
    }
  }

  /// Send FCM notifications to flat members
  Future<void> _sendVisitorNotifications(
    VisitorEntity visitor,
    List<String> memberUids,
  ) async {
    // Get FCM tokens for all members
    final tokens = <String>[];

    for (final uid in memberUids) {
      final userDoc = await _firestore
          .collection(AppConstants.usersCollection)
          .doc(uid)
          .get();

      if (userDoc.exists) {
        final userData = userDoc.data()!;
        final fcmTokens = List<String>.from(userData['fcmTokens'] ?? []);
        tokens.addAll(fcmTokens);
      }
    }

    if (tokens.isEmpty) return;

    // Prepare notification payload
    final message = {
      'registration_ids': tokens,
      'notification': {
        'title': 'New Visitor Alert',
        'body': '${visitor.visitorName} is at ${visitor.gateNumber}',
        'sound': 'default',
        'badge': '1',
      },
      'data': {
        'type': AppConstants.notificationTypeVisitor,
        'visitorId': visitor.id,
        'visitorName': visitor.visitorName,
        'purpose': visitor.purpose,
        'gateNumber': visitor.gateNumber,
        'photoUrl': visitor.visitorPhotoUrl ?? '',
        'flatId': visitor.hostFlatId,
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'deepLink': '/visitor/approve/${visitor.id}',
      },
      'android': {
        'priority': 'high',
        'notification': {
          'channel_id': 'visitors',
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        },
      },
      'apns': {
        'payload': {
          'aps': {
            'content-available': 1,
            'sound': 'default',
          },
        },
        'headers': {
          'apns-priority': '10',
        },
      },
    };

    // Send via FCM HTTP v1 API (in production, use Cloud Function)
    // For now, we'll rely on Cloud Function trigger on visitor creation
    // This is a fallback for immediate notification
  }

  /// Stream visitors for a society
  Stream<List<VisitorEntity>> streamVisitors(String societyId) {
    return _firestore
        .collection(AppConstants.societiesCollection)
        .doc(societyId)
        .collection(AppConstants.visitorsCollection)
        .orderBy('taggedAt', descending: true)
        .limit(50)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => VisitorEntity.fromJson(doc.data()))
            .toList());
  }

  /// Update visitor status
  Future<Either<String, void>> updateVisitorStatus({
    required String societyId,
    required String visitorId,
    required String status,
    String? notes,
  }) async {
    try {
      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .doc(visitorId)
          .update({
        'status': status,
        if (notes != null) 'securityNotes': notes,
        if (status == AppConstants.visitorStatusCheckedIn)
          'actualArrivalTime': FieldValue.serverTimestamp(),
        if (status == AppConstants.visitorStatusCheckedOut)
          'actualDepartureTime': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return const Right(null);
    } catch (e) {
      return Left('Failed to update status: ${e.toString()}');
    }
  }

  /// Approve visitor
  Future<Either<String, void>> approveVisitor({
    required String societyId,
    required String visitorId,
    required String approvedBy,
  }) async {
    try {
      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .doc(visitorId)
          .update({
        'status': AppConstants.visitorStatusApproved,
        'approvedBy': approvedBy,
        'approvedAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return const Right(null);
    } catch (e) {
      return Left('Failed to approve visitor: ${e.toString()}');
    }
  }

  /// Reject visitor
  Future<Either<String, void>> rejectVisitor({
    required String societyId,
    required String visitorId,
    required String rejectedBy,
    required String reason,
  }) async {
    try {
      await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .doc(visitorId)
          .update({
        'status': AppConstants.visitorStatusRejected,
        'rejectedBy': rejectedBy,
        'rejectionReason': reason,
        'rejectedAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return const Right(null);
    } catch (e) {
      return Left('Failed to reject visitor: ${e.toString()}');
    }
  }

  /// Get visitor by ID
  Future<VisitorEntity?> getVisitorById(String societyId, String visitorId) async {
    try {
      final doc = await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .doc(visitorId)
          .get();

      if (doc.exists) {
        return VisitorEntity.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Load recent visitors
  Future<void> loadRecentVisitors(String societyId) async {
    state = state.copyWith(isLoading: true);

    try {
      final snapshot = await _firestore
          .collection(AppConstants.societiesCollection)
          .doc(societyId)
          .collection(AppConstants.visitorsCollection)
          .orderBy('taggedAt', descending: true)
          .limit(20)
          .get();

      final visitors = snapshot.docs
          .map((doc) => VisitorEntity.fromJson(doc.data()))
          .toList();

      state = state.copyWith(isLoading: false, visitors: visitors);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load visitors: ${e.toString()}',
      );
    }
  }
}

/// Current visitor provider
@riverpod
VisitorEntity? currentVisitor(CurrentVisitorRef ref) {
  final state = ref.watch(visitorProvider);
  return state.currentVisitor;
}

/// Visitors stream provider
@riverpod
Stream<List<VisitorEntity>> visitorsStream(VisitorsStreamRef ref, String societyId) {
  return ref.read(visitorProvider.notifier).streamVisitors(societyId);
}
