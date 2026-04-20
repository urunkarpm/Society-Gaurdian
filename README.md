# Society Guardian - Residential Society Management App

A production-ready Flutter + Firebase application for modern residential society management.

## 🚀 Features

### For Residents
- **Visitor Management**: Receive real-time notifications when visitors arrive
- **Complaints & Maintenance**: Raise and track maintenance requests
- **Amenity Booking**: Book clubhouse, gym, pool, etc.
- **Payments**: View and pay maintenance bills
- **Announcements**: Stay updated with society notices
- **Emergency SOS**: Quick access to emergency services

### For Security Personnel
- **Visitor Registration**: QR/NFC scanning or manual entry
- **Photo Capture**: Visitor photos with automatic upload
- **History Tracking**: Complete visitor logs
- **Patrol Management**: Digital patrol logging

### For Admins
- **User Management**: Role-based access control
- **Announcements**: Broadcast notices to residents
- **Reports & Analytics**: Visitor statistics, payment reports
- **Payment Management**: Generate and track invoices

## 🏗️ Architecture

```
lib/
├── core/                    # Shared utilities, constants, theme
│   ├── constants/           # App-wide constants
│   ├── theme/               # Material 3 theme configuration
│   ├── utils/               # Helper functions
│   └── errors/              # Custom error classes
├── domain/                  # Business logic layer
│   ├── entities/            # Freezed data models
│   ├── repositories/        # Repository interfaces
│   └── usecases/            # Business use cases
├── data/                    # Data layer
│   ├── datasources/         # Remote/local data sources
│   ├── models/              # Serializable models
│   └── repositories/        # Repository implementations
└── presentation/            # UI layer
    ├── providers/           # Riverpod state management
    ├── routers/             # GoRouter configuration
    └── screens/             # Feature screens
```

## 📦 Tech Stack

### Frontend
- **Flutter 3.x** / **Dart 3+**
- **Riverpod** - State management
- **GoRouter** - Navigation
- **Freezed** - Code generation
- **Material 3** - UI components

### Backend (Firebase)
- **Authentication** - Phone OTP, Email/Password
- **Firestore** - NoSQL database with offline support
- **Cloud Functions** - Server-side logic (Gen 2)
- **FCM** - Push notifications
- **Storage** - File uploads
- **App Check** - Device attestation

## 🛠️ Setup Instructions

### Prerequisites
- Flutter SDK >= 3.10.0
- Dart SDK >= 3.0.0
- Node.js >= 18.x
- Firebase CLI
- Firebase project

### 1. Clone & Install Dependencies

```bash
# Install Flutter dependencies
flutter pub get

# Generate code (Freezed/Riverpod)
flutter pub run build_runner build --delete-conflicting-outputs

# Install Cloud Functions dependencies
cd functions && npm install
```

### 2. Firebase Configuration

```bash
# Create Firebase project at console.firebase.google.com

# Configure FlutterFire
flutterfire configure --project=YOUR_PROJECT_ID

# Deploy security rules
firebase deploy --only firestore:rules,storage:rules

# Deploy indexes
firebase deploy --only firestore:indexes

# Deploy Cloud Functions
cd functions && npm run deploy
```

### 3. Environment Setup

Update `lib/main.dart` with your Firebase config:

```dart
await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: 'YOUR_API_KEY',
    appId: 'YOUR_APP_ID',
    messagingSenderId: 'YOUR_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    storageBucket: 'YOUR_STORAGE_BUCKET',
  ),
);
```

### 4. Run the App

```bash
flutter run
```

## 🔐 Security Features

- **Role-Based Access Control (RBAC)**: Resident, Security, Admin, Vendor roles
- **Firestore Security Rules**: Comprehensive read/write permissions
- **Firebase App Check**: Device attestation
- **Custom Claims**: Server-side role verification
- **Audit Logging**: Track all critical actions

## 📱 Key Screens

### Security Guard Interface
- **Scan Tab**: QR/NFC scanner for pre-approved visitors
- **Manual Entry Tab**: Form-based visitor registration
- **History Tab**: Real-time visitor log with status chips

### Resident Interface
- **Home Dashboard**: Quick actions and notifications
- **Visitors**: Pre-approve and track visitors
- **Complaints**: Raise and track maintenance requests
- **Bookings**: Reserve amenities
- **Payments**: View and pay invoices

## ☁️ Cloud Functions

| Function | Trigger | Description |
|----------|---------|-------------|
| `onVisitorCreate` | Firestore onCreate | Sends FCM to residents |
| `expirePendingVisitors` | Pub/Sub (hourly) | Auto-expires old visitors |
| `sendScheduledNotifications` | Pub/Sub (daily) | Booking reminders |
| `processPaymentWebhook` | HTTPS Callable | Payment gateway integration |
| `assignUserRole` | HTTPS Callable | Admin role assignment |

## 📊 Firestore Collections

```
/societies/{societyId}
  /flats/{flatId}
  /visitors/{visitorId}
  /notifications/{notificationId}
  /complaints/{complaintId}
  /bookings/{bookingId}
  /announcements/{announcementId}
  /payments/{paymentId}
  /amenities/{amenityId}
  /patrol_logs/{logId}

/users/{userId}
/audit_logs/{logId}
```

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Test Cloud Functions locally
cd functions && npm run serve
```

## 📄 License

MIT License - See LICENSE file for details

## 👥 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📞 Support

For issues and questions, please create an issue on GitHub.
