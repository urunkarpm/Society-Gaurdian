# Complaint Management Feature Documentation

## Overview
The Complaint Management feature allows residents to raise complaints for various maintenance works (electrical, plumbing, tiles, etc.), admins to view and assign workers to those complaints, and workers to complete the work with evidence upload. All data is saved for future reference.

## Features

### 1. For Residents
- **Raise Complaints**: Submit complaints with:
  - Category selection (Electrical, Plumbing, Tiles, Carpentry, Painting, Cleaning, Security, Elevator, Water Supply, Gardening, Other)
  - Priority levels (Low, Medium, High, Urgent)
  - Title and detailed description
  - Photo uploads (optional)
  - Anonymous submission option
  
- **View My Complaints**: Track all submitted complaints with their current status

### 2. For Admins
- **View All Complaints**: See all complaints raised in the society
- **Filter & Search**: Filter by status (Open, In Progress, Assigned, Completed, Resolved, Closed) and category
- **Assign Workers**: Assign complaints to specific workers
- **Update Status**: Change complaint status throughout the workflow
- **Track History**: View complete history of updates and actions on each complaint

### 3. For Workers
- **View Assigned Complaints**: See all complaints assigned to them
- **Update Status**: Mark work as started/in progress
- **Upload Evidence**: Upload photos of completed work
- **Add Notes**: Provide completion notes describing the work done
- **Mark Complete**: Finalize the complaint with evidence

## Data Model

### Complaint Entity
```dart
ComplaintEntity {
  id: String
  societyId: String
  raisedBy: String (user ID)
  raisedByName: String
  flatId: String
  flatNumber: String
  category: ComplaintCategory (enum)
  title: String
  description: String
  status: ComplaintStatus (enum)
  priority: ComplaintPriority (enum)
  photos: List<String> (URLs)
  assignedTo: String? (worker ID)
  assignedToName: String?
  assignedBy: String?
  assignedAt: DateTime?
  estimatedCompletionDate: DateTime?
  completedAt: DateTime?
  completionNotes: String?
  evidencePhotos: List<String> (URLs)
  updates: List<ComplaintUpdate>
  isAnonymous: bool
  createdAt: DateTime
  updatedAt: DateTime
}
```

### Complaint Categories
- Electrical
- Plumbing
- Tiles
- Carpentry
- Painting
- Cleaning
- Security
- Elevator
- Water Supply
- Gardening
- Other

### Complaint Status Flow
1. **Open** - Initial state when complaint is raised
2. **Assigned** - Admin assigns a worker
3. **In Progress** - Worker starts the work
4. **Completed** - Worker marks work as done with evidence
5. **Resolved** - Admin verifies and resolves
6. **Closed** - Final closure

### Complaint Update/History
```dart
ComplaintUpdate {
  updatedBy: String
  updatedByName: String
  action: String
  timestamp: DateTime
  comment: String?
  photos: List<String>?
  previousStatus: ComplaintStatus?
  newStatus: ComplaintStatus?
  assignedTo: String?
  assignedToName: String?
}
```

## File Structure

```
lib/
├── domain/
│   └── entities/
│       └── complaint_entity.dart          # Data models
│       └── complaint_entity.freezed.dart  # Generated code
├── data/
│   └── repositories/
│       └── complaint_repository.dart      # Data operations
└── presentation/
    └── screens/
        ├── resident/
        │   └── raise_complaint_screen.dart    # Raise new complaint
        │   └── my_complaints_screen.dart      # View own complaints
        ├── admin/
        │   └── admin_complaints_screen.dart   # Manage all complaints
        └── worker/
            └── worker_complaints_screen.dart  # Worker assignments
```

## Firestore Schema

### Collection Path
`societies/{societyId}/complaints/{complaintId}`

### Document Structure
```javascript
{
  id: "complaint_123",
  societyId: "society_456",
  raisedBy: "user_789",
  raisedByName: "John Doe",
  flatId: "flat_abc",
  flatNumber: "A-101",
  category: "electrical",
  title: "Fan not working",
  description: "Ceiling fan in bedroom is not working",
  status: "open",
  priority: "medium",
  photos: ["https://..."],
  assignedTo: "worker_xyz",
  assignedToName: "Electrician Joe",
  assignedBy: "admin_123",
  assignedAt: Timestamp,
  completedAt: Timestamp,
  completionNotes: "Replaced capacitor",
  evidencePhotos: ["https://..."],
  updates: [
    {
      updatedBy: "admin_123",
      updatedByName: "Admin",
      action: "assigned",
      timestamp: Timestamp,
      comment: "Assigned to Joe",
      newStatus: "assigned",
      assignedTo: "worker_xyz",
      assignedToName: "Electrician Joe"
    }
  ],
  isAnonymous: false,
  createdAt: Timestamp,
  updatedAt: Timestamp
}
```

## Firestore Rules

```javascript
match /societies/{societyId}/complaints/{complaintId} {
  // Anyone authenticated can read
  allow read: if isAuthenticated();
  
  // Only residents can create
  allow create: if isResident();
  
  // Creator, security, or admin can update
  allow update: if (resource.data.raisedBy == request.auth.uid) || 
                   isSecurity() || 
                   isAdmin();
  
  // Only admin can delete
  allow delete: if isAdmin();
}
```

## API Methods

### ComplaintRepository

#### Create Complaint
```dart
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
})
```

#### Get Complaint Streams
```dart
// For Admin - all complaints
Stream<List<ComplaintEntity>> getAllComplaintsStream(String societyId)

// For Resident - own complaints
Stream<List<ComplaintEntity>> getResidentComplaintsStream(
  String societyId, String userId)

// For Worker - assigned complaints
Stream<List<ComplaintEntity>> getWorkerComplaintsStream(
  String societyId, String workerId)
```

#### Assign Worker
```dart
Future<void> assignWorker({
  required String societyId,
  required String complaintId,
  required String workerId,
  required String workerName,
  required String assignedBy,
})
```

#### Update Status
```dart
Future<void> updateComplaintStatus({
  required String societyId,
  required String complaintId,
  required ComplaintStatus status,
  required String updatedBy,
  String? comment,
  List<File>? evidencePhotos,
})
```

#### Complete Complaint
```dart
Future<void> completeComplaint({
  required String societyId,
  required String complaintId,
  required String workerId,
  String? completionNotes,
  List<File>? evidencePhotos,
})
```

## Usage Examples

### Resident Raising a Complaint
```dart
final repository = ComplaintRepository();

await repository.createComplaint(
  societyId: 'society_123',
  flatId: 'flat_456',
  flatNumber: 'A-101',
  category: ComplaintCategory.plumbing,
  title: 'Leaking tap',
  description: 'Kitchen tap is leaking continuously',
  priority: ComplaintPriority.high,
  photos: [imageFile1, imageFile2],
);
```

### Admin Assigning Worker
```dart
await repository.assignWorker(
  societyId: 'society_123',
  complaintId: 'complaint_789',
  workerId: 'worker_abc',
  workerName: 'Plumber Bob',
  assignedBy: 'admin_123',
);
```

### Worker Completing Work
```dart
await repository.completeComplaint(
  societyId: 'society_123',
  complaintId: 'complaint_789',
  workerId: 'worker_abc',
  completionNotes: 'Replaced washer and fixed O-ring',
  evidencePhotos: [afterPhoto1, afterPhoto2],
);
```

## Future Enhancements

1. **Worker Management**
   - Dedicated worker profiles
   - Skills/certifications tracking
   - Performance ratings
   - Availability status

2. **Notifications**
   - Push notifications for status changes
   - Email notifications
   - SMS alerts for urgent complaints

3. **Analytics**
   - Complaint statistics dashboard
   - Average resolution time
   - Worker performance metrics
   - Category-wise trends

4. **Advanced Features**
   - SLA management
   - Escalation workflows
   - Recurring complaints detection
   - Inventory integration for parts used
   - Cost tracking and billing

5. **Communication**
   - In-app chat between resident and worker
   - Comments/discussion thread on complaints
   - Rating and feedback system

## Security Considerations

1. **Authentication**: All operations require authenticated users
2. **Authorization**: Role-based access control (Resident/Admin/Worker)
3. **Data Validation**: Input validation on all fields
4. **File Upload Limits**: Size restrictions on photo uploads
5. **Audit Trail**: Complete history of all actions stored

## Testing Checklist

- [ ] Resident can raise complaint with all categories
- [ ] Photo upload works correctly
- [ ] Anonymous complaints hide user identity
- [ ] Admin sees all complaints in society
- [ ] Filtering by status works
- [ ] Filtering by category works
- [ ] Worker assignment updates status correctly
- [ ] Worker sees only assigned complaints
- [ ] Evidence photo upload works
- [ ] Completion notes are saved
- [ ] Status flow is enforced correctly
- [ ] History/updates are recorded properly
- [ ] Firestore rules prevent unauthorized access
