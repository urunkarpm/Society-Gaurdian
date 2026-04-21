# 🏢 Society Guardian - Residential Society Management App

A production-ready, real-time residential society management solution built with **Flutter 3.x**, **Firebase**, and **Material 3**. Designed for modern housing societies to automate visitor tracking, manage inventory, handle residence verification, and ensure community security.

## 🚀 Key Features

### 🔐 Multi-Role Authentication
- **Residents**: Secure Google Sign-In with biometric fallback
- **Security Guards**: Email/Password auth (credentials assigned by Admin)
- **Admins**: Full dashboard access with custom claims, role toggle support for owners
- **Owners**: Special role with ability to toggle into admin mode for oversight

### 👮 Automated Visitor Management
- **Real-Time Tracking**: Guards scan QR/NFC or enter visitor details manually
- **Instant Notifications**: Residents and admins receive FCM push notifications immediately upon visitor arrival
- **Pre-Approval System**: Residents generate shareable QR codes for expected guests
- **Dual Notification System**: Separate notification streams for residents and admin/owners
- **Auto-Expiry**: Cloud Functions automatically expire pending visitors after set duration

### 🏠 Resident Portal
- **Visitor History**: View all past and current visitors
- **Residence Verification**: Submit documents for verification, track approval status
- **Society Selection**: Join or request access to residential societies
- **Waiting Approval**: Screen for users awaiting admin verification
- **Notice Board**: Society-wide announcements with read receipts
- **Emergency SOS**: One-tap alert to security and admins with location

### 🛡️ Security Dashboard (Guard Interface)
- **Quick Tagging**: Scan license plates, IDs, or QR codes
- **Offline Mode**: Queue writes locally when network drops, sync automatically
- **Patrol Logs**: Digital check-in/check-out with timestamps
- **Visitor Directory**: Search and verify visitor details instantly
- **History Tracking**: Real-time visitor log with status chips and search

### 👑 Admin Command Center
- **User Management**: Add/Remove security guards, assign roles, manage residents
- **Residence Verifications**: Review and approve/reject resident verification requests with reasons
- **Inventory Management**: Full control over society inventory with categories, transactions, and photo evidence
- **Real-Time Analytics**: Live metrics on occupancy, visitor traffic, revenue
- **Financial Oversight**: Track collections, pending dues, expense reports
- **Society Configuration**: Manage buildings, flats, amenities, and rules
- **Audit Logs**: Complete history of critical actions
- **Role Toggle**: Admin/Owner users can switch between roles seamlessly

## 🏗️ Architecture

```
lib/
├── core/                    # Shared utilities, constants, theme
│   ├── constants/           # App-wide constants
│   ├── theme/               # Material 3 theme configuration
│   ├── utils/               # Helper functions (logger, etc.)
│   └── errors/              # Custom error classes
├── domain/                  # Business logic layer
│   ├── entities/            # Freezed data models (User, Flat, Visitor, Notification, InventoryItem)
│   ├── repositories/        # Repository interfaces
│   └── usecases/            # Business use cases
├── data/                    # Data layer
│   ├── datasources/         # Remote/local data sources
│   ├── models/              # Serializable models
│   └── repositories/        # Repository implementations
└── presentation/            # UI layer
    ├── providers/           # Riverpod state management (auth, notifications, role toggle)
    ├── routers/             # GoRouter configuration with role-based guards
    └── screens/             # Feature screens (Admin, Guard, Resident, Auth)
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
3. **Notification**: Cloud Function detects write, resolves flat owner's and admin/owner FCM tokens, sends push notifications.
4. **Action**: Resident receives alert with photo/name, can approve/reject or call guard.
5. **Entry**: Guard marks "Entered", system logs timestamp.

### Admin Managing Guards
1. Admin logs into **Admin Dashboard**.
2. Navigates to **Security Management**.
3. Clicks "Add Guard", enters email and assigns device.
4. System creates user with `role: security` claim.
5. Guard receives credentials, logs in via Email/Password.

### Residence Verification Flow
1. **Registration**: User signs up and submits verification request with documents (ownership proof, ID, etc.).
2. **Review**: Admin receives notification and reviews request in **Residence Verifications** screen.
3. **Decision**: Admin approves (assigns flat/society) or rejects with reason.
4. **Access**: Upon approval, user gains resident access to society features.

### Inventory Management Flow
1. **Track Items**: Admin adds inventory items (consumables like bulbs, durables like tools).
2. **Record Usage**: When item is used, admin logs transaction with quantity, location, and photos.
3. **Alerts**: System alerts when consumables reach minimum threshold.
4. **History**: Complete audit trail of all inventory movements.

### Role Toggle (Admin/Owner)
1. **Eligibility**: Users with both admin and owner roles can toggle.
2. **Switch Mode**: Click swap icon in navigation rail to switch between admin and owner modes.
3. **Notifications**: In admin mode, receive visitor notifications for oversight.
4. **Badge**: Red notification badge shows unread visitor alerts count.

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
- **Society Selection**: Choose or request access to residential societies
- **Waiting Approval**: Screen for users awaiting residence verification
- **Profile**: Manage family members, update contact info

### Admin Dashboard
- **Overview**: Real-time analytics on occupancy, visitor traffic, revenue
- **Security Management**: Add/remove guards, assign roles, view patrol logs
- **User Management**: Manage residents, vendors, and staff accounts
- **Residence Verifications**: Review and approve/reject resident verification requests
- **Inventory Management**: Track consumables and durable items with transaction history
- **Financial Reports**: Track collections, pending dues, expense reports
- **Society Settings**: Configure buildings, flats, amenities, rules
- **Audit Logs**: Complete history of critical system actions
- **Role Toggle**: Switch between admin and owner modes (for eligible users)

## ☁️ Cloud Functions

| Function | Trigger | Description |
|----------|---------|-------------|
| `onVisitorCreate` | Firestore onCreate | Sends FCM push notification to flat residents and admins/owners when visitor arrives |
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
  /inventory_items/{itemId}    # Name, category, type, quantity, status, photos
  /inventory_transactions/{txId} # Item changes with evidence photos and reasons
  /residence_verifications/{id} # Verification requests with documents and status

/users/{userId}                # Profile, role, custom claims, isOwner, isAdminMode
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
