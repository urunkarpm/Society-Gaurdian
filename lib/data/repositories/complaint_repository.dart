import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

import '../../domain/entities/complaint_entity.dart';
import '../../core/constants/app_constants.dart';

/// Repository for managing complaints data operations
class ComplaintRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  ComplaintRepository({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance,
        _storage = storage ?? FirebaseStorage.instance;

  String? get currentUserId => _auth.currentUser?.uid;

  /// Get reference to complaints collection for a society
  CollectionReference _complaintsCollection(String societyId) {
    return _firestore
        .collection(AppConstants.societiesCollection)
        .doc(societyId)
        .collection('complaints');
  }

  /// Create a new complaint
  Future<ComplaintEntity> createComplaint({
    required String societyId,
    required String flatId,
    required String flatNumber,
    required ComplaintCategory category,
    required String title,
    required String description,
    required ComplaintPriority priority,
    List<File>? photos,
    bool isAnonymous = false,
  }) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('User not authenticated');

    // Upload photos if any
    List<String> photoUrls = [];
    if (photos != null && photos.isNotEmpty) {
      photoUrls = await _uploadPhotos(societyId, photos);
    }

    // Get user display name
    String displayName = user.displayName ?? user.email ?? 'Anonymous';

    final complaintData = {
      'id': '', // Will be set after creation
      'societyId': societyId,
      'raisedBy': user.uid,
      'raisedByName': displayName,
      'flatId': flatId,
      'flatNumber': flatNumber,
      'category': category.name,
      'title': title,
      'description': description,
      'status': ComplaintStatus.open.name,
      'priority': priority.name,
      'photos': photoUrls,
      'isAnonymous': isAnonymous,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };

    final docRef = await _complaintsCollection(societyId).add(complaintData);
    
    final complaint = ComplaintEntity(
      id: docRef.id,
      societyId: societyId,
      raisedBy: user.uid,
      raisedByName: displayName,
      flatId: flatId,
      flatNumber: flatNumber,
      category: category,
      title: title,
      description: description,
      status: ComplaintStatus.open,
      priority: priority,
      photos: photoUrls,
      isAnonymous: isAnonymous,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Update the document with the ID
    await docRef.update({'id': docRef.id});

    return complaint;
  }

  /// Stream of all complaints for a society (for admin)
  Stream<List<ComplaintEntity>> getAllComplaintsStream(String societyId) {
    return _complaintsCollection(societyId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => _complaintFromDoc(doc))
            .toList());
  }

  /// Stream of complaints for a specific resident
  Stream<List<ComplaintEntity>> getResidentComplaintsStream(
      String societyId, String userId) {
    return _complaintsCollection(societyId)
        .where('raisedBy', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => _complaintFromDoc(doc))
            .toList());
  }

  /// Stream of complaints assigned to a worker
  Stream<List<ComplaintEntity>> getWorkerComplaintsStream(
      String societyId, String workerId) {
    return _complaintsCollection(societyId)
        .where('assignedTo', isEqualTo: workerId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => _complaintFromDoc(doc))
            .toList());
  }

  /// Get single complaint by ID
  Future<ComplaintEntity?> getComplaintById(
      String societyId, String complaintId) async {
    final doc = await _complaintsCollection(societyId).doc(complaintId).get();
    if (!doc.exists) return null;
    return _complaintFromDoc(doc);
  }

  /// Assign worker to a complaint
  Future<void> assignWorker({
    required String societyId,
    required String complaintId,
    required String workerId,
    required String workerName,
    required String assignedBy,
  }) async {
    final update = ComplaintUpdate(
      updatedBy: assignedBy,
      updatedByName: assignedBy,
      action: 'assigned',
      timestamp: DateTime.now(),
      comment: 'Assigned to $workerName',
      previousStatus: null,
      newStatus: ComplaintStatus.assigned,
      assignedTo: workerId,
      assignedToName: workerName,
    );

    await _complaintsCollection(societyId).doc(complaintId).update({
      'assignedTo': workerId,
      'assignedToName': workerName,
      'assignedBy': assignedBy,
      'assignedAt': FieldValue.serverTimestamp(),
      'status': ComplaintStatus.assigned.name,
      'updatedAt': FieldValue.serverTimestamp(),
      'updates': FieldValue.arrayUnion([update.toJson()]),
    });
  }

  /// Update complaint status
  Future<void> updateComplaintStatus({
    required String societyId,
    required String complaintId,
    required ComplaintStatus status,
    required String updatedBy,
    String? comment,
    List<File>? evidencePhotos,
  }) async {
    List<String> evidenceUrls = [];
    if (evidencePhotos != null && evidencePhotos.isNotEmpty) {
      evidenceUrls = await _uploadPhotos(societyId, evidencePhotos);
    }

    final update = ComplaintUpdate(
      updatedBy: updatedBy,
      updatedByName: updatedBy,
      action: 'status_change',
      timestamp: DateTime.now(),
      comment: comment,
      photos: evidenceUrls.isEmpty ? null : evidenceUrls,
      previousStatus: null, // Will be populated from existing data
      newStatus: status,
    );

    Map<String, dynamic> updateData = {
      'status': status.name,
      'updatedAt': FieldValue.serverTimestamp(),
      'updates': FieldValue.arrayUnion([update.toJson()]),
    };

    if (status == ComplaintStatus.completed || 
        status == ComplaintStatus.resolved) {
      updateData['completedAt'] = FieldValue.serverTimestamp();
      updateData['evidencePhotos'] = evidenceUrls;
    }

    await _complaintsCollection(societyId).doc(complaintId).update(updateData);
  }

  /// Mark complaint as completed with evidence
  Future<void> completeComplaint({
    required String societyId,
    required String complaintId,
    required String workerId,
    String? completionNotes,
    List<File>? evidencePhotos,
  }) async {
    List<String> evidenceUrls = [];
    if (evidencePhotos != null && evidencePhotos.isNotEmpty) {
      evidenceUrls = await _uploadPhotos(societyId, evidencePhotos);
    }

    final update = ComplaintUpdate(
      updatedBy: workerId,
      updatedByName: workerId,
      action: 'completed',
      timestamp: DateTime.now(),
      comment: completionNotes,
      photos: evidenceUrls,
      previousStatus: ComplaintStatus.workInProgress,
      newStatus: ComplaintStatus.completed,
    );

    await _complaintsCollection(societyId).doc(complaintId).update({
      'status': ComplaintStatus.completed.name,
      'completedAt': FieldValue.serverTimestamp(),
      'completionNotes': completionNotes,
      'evidencePhotos': evidenceUrls,
      'updatedAt': FieldValue.serverTimestamp(),
      'updates': FieldValue.arrayUnion([update.toJson()]),
    });
  }

  /// Add update/note to complaint
  Future<void> addComplaintUpdate({
    required String societyId,
    required String complaintId,
    required String action,
    required String updatedBy,
    String? comment,
    List<File>? photos,
  }) async {
    List<String> photoUrls = [];
    if (photos != null && photos.isNotEmpty) {
      photoUrls = await _uploadPhotos(societyId, photos);
    }

    final update = ComplaintUpdate(
      updatedBy: updatedBy,
      updatedByName: updatedBy,
      action: action,
      timestamp: DateTime.now(),
      comment: comment,
      photos: photoUrls.isEmpty ? null : photoUrls,
    );

    await _complaintsCollection(societyId).doc(complaintId).update({
      'updates': FieldValue.arrayUnion([update.toJson()]),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Delete a complaint
  Future<void> deleteComplaint(String societyId, String complaintId) async {
    await _complaintsCollection(societyId).doc(complaintId).delete();
  }

  /// Upload photos to Firebase Storage
  Future<List<String>> _uploadPhotos(String societyId, List<File> photos) async {
    List<String> urls = [];
    for (var photo in photos) {
      try {
        final path = '${AppConstants.complaintPhotosPath}/$societyId/${DateTime.now().millisecondsSinceEpoch}_${photo.path.split('/').last}';
        final ref = _storage.ref().child(path);
        final uploadTask = ref.putFile(photo);
        final snapshot = await uploadTask;
        final url = await snapshot.ref.getDownloadURL();
        urls.add(url);
      } catch (e) {
        print('Error uploading photo: $e');
      }
    }
    return urls;
  }

  /// Helper to convert DocumentSnapshot to ComplaintEntity
  ComplaintEntity _complaintFromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ComplaintEntity(
      id: data['id'] ?? doc.id,
      societyId: data['societyId'] ?? '',
      raisedBy: data['raisedBy'] ?? '',
      raisedByName: data['raisedByName'] ?? '',
      flatId: data['flatId'] ?? '',
      flatNumber: data['flatNumber'] ?? '',
      category: ComplaintCategory.values.firstWhere(
        (e) => e.name == data['category'],
        orElse: () => ComplaintCategory.other,
      ),
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      status: ComplaintStatus.values.firstWhere(
        (e) => e.name == data['status'],
        orElse: () => ComplaintStatus.open,
      ),
      priority: ComplaintPriority.values.firstWhere(
        (e) => e.name == data['priority'],
        orElse: () => ComplaintPriority.medium,
      ),
      photos: data['photos'] != null ? List<String>.from(data['photos']) : null,
      assignedTo: data['assignedTo'],
      assignedToName: data['assignedToName'],
      assignedBy: data['assignedBy'],
      assignedAt: (data['assignedAt'] as Timestamp?)?.toDate(),
      estimatedCompletionDate: (data['estimatedCompletionDate'] as Timestamp?)?.toDate(),
      completedAt: (data['completedAt'] as Timestamp?)?.toDate(),
      completionNotes: data['completionNotes'],
      evidencePhotos: data['evidencePhotos'] != null 
          ? List<String>.from(data['evidencePhotos']) 
          : null,
      updates: data['updates'] != null
          ? (data['updates'] as List)
              .map((u) => ComplaintUpdate.fromJson(u as Map<String, dynamic>))
              .toList()
          : null,
      metadata: data['metadata'],
      isAnonymous: data['isAnonymous'] ?? false,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }
}
