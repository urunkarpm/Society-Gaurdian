# 🏢 Society Guardian - Residential Society Management App

A production-ready, real-time residential society management solution built with **Flutter 3.x**, **Firebase**, and **Material 3**. Designed for modern housing societies to automate visitor tracking, manage amenities, handle billing, and ensure community security.

## 🚀 Key Features

### 🔐 Multi-Role Authentication
- **Residents**: Secure Google Sign-In with biometric fallback
- **Security Guards**: Email/Password auth (credentials assigned by Admin)
- **Admins**: Full dashboard access with custom claims
- **Vendors**: Scoped access for service providers

### 👮 Automated Visitor Management
- **Real-Time Tracking**: Guards scan QR/NFC or enter visitor details manually
- **Instant Notifications**: Residents receive FCM push notifications immediately upon visitor arrival
- **Pre-Approval System**: Residents generate shareable QR codes for expected guests
- **Delivery Tracking**: Package handoff confirmation with photo proof
- **Auto-Expiry**: Cloud Functions automatically expire pending visitors after set duration

### 🏠 Resident Portal
- **Visitor History**: View all past and current visitors
- **Amenity Booking**: Real-time slot booking for gym, pool, clubhouse (atomic transactions prevent double-booking)
- **Billing & Payments**: View invoices, pay via Stripe/Razorpay, auto-pay scheduling
- **Complaints**: Raise tickets with photo/video evidence, track status in real-time
- **Notice Board**: Society-wide announcements with read receipts
- **Emergency SOS**: One-tap alert to security and admins with location

### 🛡️ Security Dashboard (Guard Interface)
- **Quick Tagging**: Scan license plates, IDs, or QR codes
- **Offline Mode**: Queue writes locally when network drops, sync automatically
- **Patrol Logs**: Digital check-in/check-out with timestamps
- **Visitor Directory**: Search and verify visitor details instantly

### 👑 Admin Command Center
- **User Management**: Add/Remove security guards, assign roles, manage residents
- **Real-Time Analytics**: Live metrics on occupancy, visitor traffic, revenue
- **Financial Oversight**: Track collections, pending dues, expense reports
- **Society Configuration**: Manage buildings, flats, amenities, and rules
- **Audit Logs**: Complete history of critical actions

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

### Tech Stack
- **Frontend**: Flutter 3.x / Dart 3 (Sealed classes, Records, Pattern matching)
- **State Management**: Riverpod + `freezed` for immutable states
- **Routing**: GoRouter with deep linking and role-based guards
- **Backend**: Firebase (Auth, Firestore, Functions, Storage, FCM)
- **Local DB**: Hive for offline sync queue
- **Design**: Material 3 with custom theme

## ⚙️ Firebase Infrastructure

### Collections Structure
- `/societies/{id}` - Society configuration
- `/flats/{id}` - Flat details and member links
- `/visitors/{id}` - Visitor logs with TTL
- `/users/{id}` - User profiles with custom claims
- `/bookings/{id}` - Amenity reservations
- `/invoices/{id}` - Billing records
- `/complaints/{id}` - Work order tickets

### Cloud Functions (Node.js/TypeScript)
- `onVisitorCreate`: Triggers FCM to residents upon visitor tag
- `expirePendingVisitors`: Scheduled cleanup of old requests
- `processPaymentWebhook`: Handles Stripe/Razorpay callbacks
- `assignUserRole`: Admin tool to promote/demote users

### Security Rules
- Role-Based Access Control (RBAC) enforced at database level
- Input validation and data sanitization
- Field-level permissions (e.g., only admins can write to `securityStaff`)

## 📱 How It Works

### Visitor Flow
1. **Arrival**: Guard scans visitor ID or enters details in app.
2. **Trigger**: App writes to Firestore `visitors` collection.
3. **Notification**: Cloud Function detects write, resolves flat owner's FCM token, sends push notification.
4. **Action**: Resident receives alert with photo/name, can approve/reject or call guard.
5. **Entry**: Guard marks "Entered", system logs timestamp.

### Admin Managing Guards
1. Admin logs into **Admin Dashboard**.
2. Navigates to **Security Management**.
3. Clicks "Add Guard", enters email and assigns device.
4. System creates user with `role: security` claim.
5. Guard receives credentials, logs in via Email/Password.

## 🛠️ Setup Instructions

### Prerequisites
- Flutter SDK >= 3.10.0
- Dart SDK >= 3.0.0
- Node.js >= 18.x
- Firebase CLI
- Firebase project with Blaze Plan (for Cloud Functions)
- Android Studio / VS Code

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
# Enable Authentication providers: Google, Email/Password
# Create Firestore Database in production mode
# Create Storage bucket

# Configure FlutterFire
flutterfire configure --project=YOUR_PROJECT_ID

# Download google-services.json and place in android/app/

# IMPORTANT: Enable Google Sign-In
# 1. Go to Firebase Console > Authentication > Sign-in method
# 2. Enable "Google" provider
# 3. Add your SHA-1 fingerprint:
cd android && ./gradlew signingReport
# Copy SHA-1 to Project Settings in Firebase Console

# Deploy security rules
firebase deploy --only firestore:rules,storage:rules

# Deploy indexes
firebase deploy --only firestore:indexes

# Deploy Cloud Functions
cd functions && npm install && npm run deploy
```

### 3. Run the App

```bash
# Get dependencies
flutter pub get

# Generate code (Freezed/Riverpod)
flutter pub run build_runner build --delete-conflicting-outputs

# Run on Android emulator or device
flutter run
```

## 🔐 Security Features

- **Role-Based Access Control (RBAC)**: Resident, Security, Admin, Vendor roles
- **Firestore Security Rules**: Comprehensive read/write permissions with field-level validation
- **Firebase App Check**: Device attestation for security guards
- **Custom Claims**: Server-side role verification via Cloud Functions
- **Google Sign-In**: OAuth 2.0 authentication for residents
- **Audit Logging**: Track all critical actions in `audit_logs` collection
- **Data Encryption**: TLS in transit, Firebase default encryption at rest

## 📱 Key Screens

### Security Guard Interface
- **Scan Tab**: QR/NFC scanner for pre-approved visitors with camera integration
- **Manual Entry Tab**: Form-based visitor registration with photo capture
- **History Tab**: Real-time visitor log with status chips and search
- **Patrol Logs**: Digital check-in/check-out with timestamps

### Resident Interface
- **Home Dashboard**: Quick actions, recent notifications, and visitor alerts
- **Visitors**: Pre-approve guests, view history, generate shareable QR codes
- **Complaints**: Raise and track maintenance requests with photo evidence
- **Bookings**: Reserve amenities with real-time availability
- **Payments**: View invoices, pay via Stripe/Razorpay, download receipts
- **Profile**: Manage family members, update contact info

### Admin Dashboard
- **Overview**: Real-time analytics on occupancy, visitor traffic, revenue
- **Security Management**: Add/remove guards, assign roles, view patrol logs
- **User Management**: Manage residents, vendors, and staff accounts
- **Financial Reports**: Track collections, pending dues, expense reports
- **Society Settings**: Configure buildings, flats, amenities, rules
- **Audit Logs**: Complete history of critical system actions

## ☁️ Cloud Functions

| Function | Trigger | Description |
|----------|---------|-------------|
| `onVisitorCreate` | Firestore onCreate | Sends FCM push notification to flat residents when visitor arrives |
| `expirePendingVisitors` | Pub/Sub (hourly) | Auto-expires pending visitors after 24 hours |
| `sendScheduledNotifications` | Pub/Sub (daily 8 AM) | Sends booking reminders and payment due alerts |
| `processPaymentWebhook` | HTTPS POST | Handles Stripe/Razorpay payment callbacks |
| `assignUserRole` | Callable | Admin-only function to assign/change user roles |
| `createSocietyData` | Callable | Initializes society structure with buildings/flats |

## 📊 Firestore Collections

```
/societies/{societyId}
  /buildings/{buildingId}
  /flats/{flatId}              # Flat number, members[], fcmTokens[]
  /visitors/{visitorId}        # Name, photo, purpose, hostFlatId, status, timestamps
  /notifications/{notificationId}
  /complaints/{complaintId}
  /bookings/{bookingId}
  /announcements/{announcementId}
  /payments/{paymentId}
  /amenities/{amenityId}
  /patrol_logs/{logId}
  /audit_logs/{logId}

/users/{userId}                # Profile, role, custom claims
/security_staff/{staffId}      # Guard credentials assigned by admin
```

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widgets/

# Run integration tests (requires emulator)
flutter test integration_test/

# Test Cloud Functions locally
cd functions && npm run serve

# Test Firestore rules with emulator
firebase emulators:start --only firestore
```

## 🚀 Deployment & CI/CD

### GitHub Actions Workflow
- Automated testing on PR
- Build Android APK/AAB on merge to main
- Deploy Cloud Functions on backend changes
- Firebase App Distribution for QA builds

### Store Submission Checklist
- [ ] Generate signed APK/AAB
- [ ] Add app icons and screenshots
- [ ] Configure privacy policy URL
- [ ] Set up Firebase App Check for production
- [ ] Enable Crashlytics for monitoring
- [ ] Test on multiple device sizes

## 🛡️ Compliance & Best Practices

- **GDPR Ready**: Data retention policies via scheduled functions
- **Data Minimization**: Only collect essential visitor information
- **Consent Management**: Opt-in for notifications and directory listing
- **Accessibility**: Material 3 components with screen reader support
- **Performance**: Lazy loading, image compression, efficient queries
- **Scalability**: Composite indexes, data sharding for large societies

## 📄 License

MIT License - See LICENSE file for details

## 👥 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📞 Support

For issues and questions:
- Create an issue on GitHub
- Check existing documentation
- Review Firebase Console logs for backend errors

---

**Built with ❤️ for safer, smarter communities.**
