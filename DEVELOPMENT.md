# Society Guardian - Development Guide

## Project Overview
Society Guardian is a modern Residential Society Management App built with Flutter 3.x+ and Firebase, featuring automated visitor tracking and real-time notifications.

## Architecture

### Clean Architecture Layers
```
lib/
├── core/                    # Core utilities, constants, theme
│   ├── constants/
│   ├── errors/
│   ├── utils/
│   └── theme/
├── data/                    # Data layer
│   ├── datasources/        # Remote & local data sources
│   ├── models/             # DTOs and mappers
│   └── repositories/       # Repository implementations
├── domain/                  # Business logic layer
│   ├── entities/           # Core business entities
│   ├── usecases/           # Business use cases
│   └── repositories/       # Repository interfaces
└── presentation/            # UI layer
    ├── providers/          # Riverpod state management
    ├── routers/            # GoRouter configuration
    ├── screens/            # Screen widgets
    └── widgets/            # Reusable widgets
```

### Feature Modules
```
lib/features/
├── visitor_tracking/       # Visitor management (core feature)
├── notifications/          # Push notifications
├── complaints/             # Work orders & complaints
├── amenity_booking/        # Facility reservations
├── announcements/          # Notices & updates
├── billing/                # Maintenance & payments
├── security/               # Emergency & SOS
└── community/              # Community hub
```

## Tech Stack

### Dependencies (pubspec.yaml)
- **Firebase**: firebase_core, firebase_auth, cloud_firestore, firebase_messaging, firebase_storage, firebase_app_check
- **State Management**: flutter_riverpod, riverpod_annotation, freezed_annotation
- **Routing**: go_router
- **Local Storage**: hive_flutter, isar_flutter_libs, flutter_secure_storage
- **Camera/Scanning**: mobile_scanner, camera, image_picker, flutter_image_compress
- **Notifications**: flutter_local_notifications
- **Utilities**: dartz, equatable, uuid, intl, connectivity_plus

### Firebase Setup

1. **Create Firebase Project**
   ```bash
   firebase login
   firebase projects:create society-guardian
   ```

2. **Install FlutterFire CLI**
   ```bash
   dart pub global activate flutterfire_cli
   ```

3. **Configure Firebase**
   ```bash
   flutterfire configure --project=society-guardian
   ```

4. **Deploy Security Rules**
   ```bash
   firebase deploy --only firestore:rules
   ```

5. **Enable Authentication Methods**
   - Phone (for residents)
   - Email/Password (for security personnel)

6. **Create Firestore Indexes**
   ```json
   {
     "indexes": [
       {
         "collectionGroup": "visitors",
         "queryScope": "COLLECTION",
         "fields": [
           {"fieldPath": "societyId", "order": "ASCENDING"},
           {"fieldPath": "taggedAt", "order": "DESCENDING"}
         ]
       },
       {
         "collectionGroup": "visitors",
         "queryScope": "COLLECTION",
         "fields": [
           {"fieldPath": "hostFlatId", "order": "ASCENDING"},
           {"fieldPath": "status", "order": "ASCENDING"},
           {"fieldPath": "taggedAt", "order": "DESCENDING"}
         ]
       }
     ]
   }
   ```

## Cloud Functions Setup

### Install Dependencies
```bash
cd functions
npm install
```

### Deploy Functions
```bash
firebase deploy --only functions
```

### Key Functions
- `onVisitorCreate`: Triggers FCM notification when visitor is tagged
- `onVisitorExpire`: Auto-expires pending visitors after timeout
- `sendScheduledNotifications`: Daily reminders for pending approvals
- `processPaymentWebhook`: Handle Stripe/Razorpay webhooks

## Development Workflow

### Code Generation
```bash
# Generate Freezed models and Riverpod providers
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode
flutter pub run build_runner watch
```

### Running the App
```bash
# Debug mode
flutter run

# Release mode
flutter run --release

# Specific device
flutter run -d <device_id>
```

### Testing
```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget_tests/

# Integration tests
flutter test integration_test/

# Coverage
flutter test --coverage
```

## Key Implementation Patterns

### Visitor Tracking Flow
1. Guard scans QR/NFC or enters visitor details manually
2. App captures photo and optional license plate
3. Writes to Firestore `/societies/{id}/visitors/{id}`
4. Cloud Function triggers on create
5. Function resolves flat members and sends FCM
6. Residents receive push with deep link
7. Resident approves/rejects via app

### Offline Strategy
- Firestore offline persistence enabled
- Hive queue for guard operations when offline
- Background sync when connection restored
- Idempotent writes with UUID-based deduplication

### Security Best Practices
- Firebase App Check for device attestation
- Custom claims for role-based access
- Firestore Security Rules with RBAC
- Secure token storage with flutter_secure_storage
- Input validation at all layers

## Environment Configuration

### Development
```dart
EnvConfig.current = Environment.development;
```

### Production
```dart
EnvConfig.current = Environment.production;
```

## CI/CD Pipeline

### GitHub Actions Workflow
```yaml
name: Build & Deploy
on:
  push:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      - run: flutter build apk --release
      - uses: wzieba/Firebase-Distribution-Github-Action@v1
```

## Next Steps

1. **Run code generation**: `flutter pub run build_runner build`
2. **Add Firebase config files**: 
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
   - `lib/firebase_options.dart` (auto-generated)
3. **Configure platform-specific settings**:
   - Android: Update `AndroidManifest.xml` with permissions
   - iOS: Update `Info.plist` with camera/microphone usage
4. **Set up Cloud Functions** in `functions/` directory
5. **Deploy security rules**: `firebase deploy --only firestore:rules`

## API Documentation

See individual provider files for available methods:
- `auth_provider.dart`: Authentication flows
- `visitor_provider.dart`: Visitor CRUD operations
- `notification_service.dart`: Push notification handling

## Support

For issues and questions, refer to:
- Firebase Console: https://console.firebase.google.com
- Flutter Docs: https://docs.flutter.dev
- Riverpod Docs: https://riverpod.dev
