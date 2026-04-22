# 🏢 Society Guardian - Residential Society Management App

A production-ready, real-time residential society management solution built with **Flutter 3.x**, **Firebase**, and **Material 3**. Designed for modern housing societies to automate visitor tracking, manage residence verification, handle inventory management, and ensure community security.

## 🚀 Key Features

### 🔐 Multi-Role Authentication
- **Residents**: Secure Google Sign-In with profile management
- **Security Guards**: Email/Password authentication (credentials assigned by Admin)
- **Admins**: Full dashboard access with comprehensive management capabilities
- **Owners**: Property owner role with ability to toggle into admin mode for oversight
- **Vendors**: Service provider access with restricted permissions
- **Custom Claims**: Server-side role verification via Firebase Auth

### 👮 Security Guard Interface
- **Visitor Registration**: Manual entry form with name, phone, purpose, flat number, and vehicle details
- **QR Code Scanning**: Mobile camera integration for scanning visitor QR codes using `mobile_scanner`
- **Photo Capture**: Image picker integration for capturing visitor photos
- **Visitor History**: Real-time log of all visitors with status tracking (pending, entered, exited)
- **Gate Selection**: Multiple gate support for large societies
- **Visitor Types**: Categorization as Guest, Delivery, Service, or Other
- **Status Updates**: Mark visitor entry and exit with timestamps

### 🏠 Resident Portal
- **Society Selection**: Browse and select from available residential societies
- **Flat Selection**: Choose building number, wing, and specific flat
- **Residence Verification**: Submit verification requests for admin approval
- **Waiting Approval Screen**: Track verification request status with rejection reasons
- **Visitor Notifications**: Receive real-time alerts when visitors arrive (via Cloud Functions)
- **Profile Management**: Update contact information and preferences

### 👑 Admin Command Center
- **Security Guards Management**: Add, manage, and assign security personnel
- **Residence Verifications**: Review and approve/reject resident verification requests with reasons
  - View pending, approved, and rejected requests
  - Assign society and flat upon approval
  - Provide rejection feedback to users
- **Inventory Management**: Complete inventory control system
  - Track consumables (bulbs, cleaning supplies) and durables (tools, equipment)
  - Categorize items (Electrical, Tools, Cleaning, Plumbing, Safety, Office Supplies)
  - Record transactions with quantity changes and evidence photos
  - Set minimum quantity alerts for consumables
  - View complete transaction history with audit trail
- **Residents Management**: Oversee society residents and their assignments
- **Society Overview**: Dashboard with society statistics and metrics
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
- **Flutter 3.x** / **Dart 3+** (Sealed classes, Records, Pattern matching)
- **Riverpod** - State management with `StateNotifierProvider` for role toggling
- **GoRouter** - Navigation with deep linking and role-based route guards
- **Freezed** - Code generation for immutable entities and models
- **Material 3** - UI components with custom theme
- **mobile_scanner** - QR code scanning for visitor check-in
- **image_picker** - Photo capture for visitor records and inventory evidence
- **firebase_core** - Firebase initialization
- **firebase_auth** - Authentication (Google Sign-In, Email/Password)
- **cloud_firestore** - Real-time database
- **firebase_storage** - File storage for photos and documents
- **google_sign_in** - Google authentication integration

### Backend
- **Firebase Authentication**: Multi-provider auth with custom claims
- **Cloud Firestore**: NoSQL database with real-time listeners
- **Cloud Functions**: Serverless backend logic (Node.js/TypeScript)
- **Firebase Storage**: Image and document storage
- **Firebase Cloud Messaging**: Push notifications (configured via Cloud Functions)

### Local Storage
- **Hive**: Lightweight local database for offline sync queue

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

### Visitor Registration Flow
1. **Guard Entry**: Security guard opens app and navigates to visitor registration tab.
2. **Manual Entry or Scan**: Guard enters visitor details manually or scans QR code using mobile camera.
3. **Photo Capture**: Optional photo capture using image picker for visitor record.
4. **Firestore Write**: App writes visitor document to Firestore `visitors` collection with status "pending".
5. **Status Tracking**: Guard can view all visitors in history tab with real-time status updates.
6. **Entry/Exit Logging**: Guard marks visitor entry and exit timestamps.

### Residence Verification Flow
1. **Registration**: User signs up via Google Sign-In and navigates to society selection screen.
2. **Society & Flat Selection**: User browses available societies, selects building number, wing, and flat.
3. **Submit Request**: User submits verification request which is stored in `residence_verifications` collection.
4. **Waiting Approval**: User sees waiting approval screen with request status.
5. **Admin Review**: Admin receives notification and reviews request in **Residence Verifications** screen.
6. **Decision**: 
   - **Approve**: Admin assigns society/flat, user role updated to "resident", access granted.
   - **Reject**: Admin provides rejection reason, user can resubmit with corrections.
7. **Access Granted**: Upon approval, user gains full resident access to society features.

### Inventory Management Flow
1. **Add Item**: Admin adds inventory item with name, category, type (consumable/durable), quantity, and location.
2. **Categorization**: Items organized by categories (Electrical, Tools, Cleaning, Plumbing, Safety, Office Supplies).
3. **Transaction Recording**: When item is used or added, admin logs transaction with:
   - Quantity change (positive for addition, negative for usage)
   - Reason and description
   - Evidence photos showing installation/location
   - Timestamp and performer details
4. **Alert System**: System tracks minimum quantity thresholds for consumables.
5. **Audit Trail**: Complete history of all inventory movements with searchable transaction log.

### Role Toggle (Admin/Owner)
1. **Eligibility**: Users with both admin and owner roles can toggle between modes.
2. **Switch Mode**: Click swap icon in navigation rail to switch between admin and owner modes.
3. **Dashboard Access**: Same dashboard interface adapts based on active role.
4. **Seamless Transition**: No re-authentication required, instant role switching.

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

- **Role-Based Access Control (RBAC)**: Resident, Security, Admin, Vendor, Owner roles with granular permissions
- **Firestore Security Rules**: Comprehensive read/write permissions with field-level validation and data sanitization
- **Firebase App Check**: Device attestation for security guards to prevent unauthorized access
- **Custom Claims**: Server-side role verification via Cloud Functions for sensitive operations
- **Google Sign-In**: OAuth 2.0 authentication for residents with secure token handling
- **Email/Password Authentication**: Secure credential-based login for security personnel
- **Audit Logging**: Complete history of critical actions in `audit_logs` collection with timestamps and user tracking
- **Data Encryption**: TLS in transit, Firebase default encryption at rest
- **Input Validation**: Client and server-side validation for all user inputs
- **Session Management**: Automatic token refresh and secure session handling

## 📱 Key Screens

### Security Guard Interface
- **Manual Entry Tab**: Form-based visitor registration with fields for name, phone, purpose, flat number, vehicle number
- **QR Scanner Tab**: Mobile camera integration using `mobile_scanner` for scanning visitor QR codes
- **Photo Capture**: Image picker integration for capturing visitor photos during registration
- **History Tab**: Real-time visitor log with status chips (pending, entered, exited), search functionality, and filtering
- **Gate Selection**: Dropdown to select entry gate for large societies with multiple entry points
- **Visitor Type Selection**: Categorize visitors as Guest, Delivery, Service, or Other

### Resident Interface
- **Society Selection Screen**: Browse available societies with search and filter capabilities
- **Flat Selection Form**: Hierarchical selection of building number → wing → flat number
- **Waiting Approval Screen**: Display verification request status with rejection reasons and resubmission option
- **Home Dashboard**: Quick actions, recent notifications, and society updates
- **Profile Management**: Update contact information, preferences, and family member details

### Admin Dashboard
- **Security Guards Tab**: Manage security personnel assignments and credentials
- **Verifications Tab**: Review residence verification requests with approve/reject actions and reason input
  - Filter by status: pending, approved, rejected, all
  - View user-submitted details and documents
  - Assign society and flat upon approval
  - Provide detailed rejection feedback
- **Residents Tab**: Overview and management of society residents
- **Inventory Tab**: Complete inventory management system
  - Add/edit/delete inventory items with categories and types
  - Record transactions with quantity changes and evidence photos
  - View transaction history with search and filter
  - Set minimum quantity alerts for consumables
  - Track item location and status
- **Society Overview Tab**: Dashboard with society statistics, occupancy metrics, and quick insights
- **Navigation Rail**: Role toggle button for admin/owner users with visual role indicator

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
