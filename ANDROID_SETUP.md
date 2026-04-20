# Society Guardian - Android Setup Guide

## Prerequisites

1. **Install Flutter SDK** (3.x+)
   - Download from https://docs.flutter.dev/get-started/install
   - Add Flutter to your PATH
   - Run `flutter doctor` to verify installation

2. **Install Android Studio**
   - Install Android Studio with Android SDK
   - Set up Android SDK API level 33+
   - Configure ANDROID_HOME environment variable

3. **Create Firebase Project**
   - Go to https://console.firebase.google.com
   - Create a new project named "Society Guardian"
   - Enable Authentication (Phone, Email/Password)
   - Enable Firestore Database
   - Enable Cloud Storage
   - Enable Cloud Messaging (FCM)
   - Enable Cloud Functions (Blaze plan required)

## Setup Steps

### 1. Register Android App in Firebase

1. In Firebase Console, click "Add app" → Android
2. Enter package name: `com.example.society_guardian`
3. Download `google-services.json`
4. Place it in: `android/app/google-services.json`

### 2. Configure Firebase Services

#### Authentication
- Enable Phone authentication for residents
- Enable Email/Password for security staff
- Set up reCAPTCHA verification in Android settings

#### Firestore
- Deploy security rules:
```bash
firebase deploy --only firestore:rules
```

#### Storage
- Deploy storage rules:
```bash
firebase deploy --only storage:rules
```

#### Cloud Functions
```bash
cd functions
npm install
npm run deploy
```

### 3. Update local.properties

Edit `android/local.properties`:
```properties
flutter.sdk=/absolute/path/to/flutter/sdk
flutter.buildMode=debug
```

### 4. Get Dependencies

```bash
cd /workspace
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### 5. Build and Run

#### Debug Mode
```bash
flutter run
```

#### Release APK
```bash
flutter build apk --release
```

#### Release App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

## Required Permissions

The app requests these permissions:
- **CAMERA** - For QR scanning and visitor photos
- **LOCATION** - For patrol tracking and emergency SOS
- **NOTIFICATIONS** - For FCM push notifications
- **BIOMETRIC** - For secure resident authentication
- **STORAGE** - For caching visitor photos offline

## Testing

### Emulator Setup
```bash
flutter emulators --launch <emulator_id>
```

### Physical Device
1. Enable Developer Options on Android device
2. Enable USB Debugging
3. Connect via USB
4. Run `flutter devices` to verify
5. Run `flutter run`

## Troubleshooting

### Common Issues

1. **Flutter not found**
   ```bash
   export PATH="$PATH:/path/to/flutter/bin"
   ```

2. **Android SDK not found**
   ```bash
   export ANDROID_HOME=/path/to/android/sdk
   export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
   ```

3. **Build fails with Gradle error**
   ```bash
   cd android
   ./gradlew clean
   cd ..
   flutter clean
   flutter pub get
   flutter run
   ```

4. **Firebase connection issues**
   - Verify `google-services.json` is in `android/app/`
   - Check package name matches in Firebase Console
   - Ensure SHA-1 fingerprint is added to Firebase

### Get SHA-1 Fingerprint
```bash
cd android
./gradlew signingReport
```
Copy the SHA-1 and add it to Firebase Console → Project Settings → Your apps

## Next Steps

1. Test visitor tagging flow with security account
2. Test resident notifications with resident account
3. Configure production signing keys
4. Set up CI/CD pipeline
5. Submit to Google Play Store

## Support

For issues, check:
- Flutter docs: https://docs.flutter.dev
- Firebase docs: https://firebase.google.com/docs
- Package documentation in pubspec.yaml
