# Firebase Configuration Guide - Fix White Blank Screen

## Problem
The app shows a white blank screen on startup because the Firebase configuration contains placeholder values that need to be replaced with your actual Firebase project credentials.

## Solution

### Option 1: Automatic Configuration (Recommended)

1. **Install FlutterFire CLI** (if not already installed):
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. **Run FlutterFire configuration**:
   ```bash
   cd /workspace
   flutterfire configure
   ```

3. **Follow the prompts**:
   - Select your Firebase project (or create a new one)
   - Select platforms you want to configure (Android, iOS, etc.)
   - This will automatically update `lib/firebase_options.dart`

4. **For Android**: Download `google-services.json` from Firebase Console and place it in `android/app/`

5. **For iOS**: Download `GoogleService-Info.plist` from Firebase Console and place it in `ios/Runner/`

### Option 2: Manual Configuration

1. **Go to Firebase Console**: https://console.firebase.google.com/

2. **Create or select your project**

3. **Register your Android app**:
   - Go to Project Settings > General
   - Click "Add app" > Android
   - Enter package name: `com.example.society_guardian` (or your actual package name)
   - Download `google-services.json`
   - Place it in `android/app/google-services.json`

4. **Get Firebase configuration values**:
   - In Firebase Console, go to Project Settings > General
   - Scroll to "Your apps" section
   - Copy the configuration values

5. **Update `lib/firebase_options.dart`**:
   Replace the placeholder values with your actual Firebase credentials:
   - `apiKey`
   - `appId`
   - `messagingSenderId`
   - `projectId`
   - `storageBucket`
   - `authDomain` (for web)

6. **Enable required Firebase services**:
   - Authentication (Email/Password, Google Sign-In)
   - Cloud Firestore
   - Cloud Messaging (for notifications)
   - Storage (for file uploads)
   - App Check (optional but recommended)

## Verify Configuration

After configuring Firebase, run the app:

```bash
flutter run
```

You should see:
- The splash screen with the app logo
- Navigation to login screen (if not authenticated)
- Or navigation to the appropriate home screen (if already logged in)

## Troubleshooting

### Still seeing white screen?

1. **Check console logs**:
   ```bash
   flutter run --verbose
   ```

2. **Verify Firebase initialization**:
   Look for error messages in the console about Firebase initialization

3. **Check if google-services.json exists**:
   ```bash
   ls -la android/app/google-services.json
   ```

4. **Verify package name matches**:
   - In `android/app/build.gradle`, check `applicationId`
   - In Firebase Console, verify the Android app is registered with the same package name

5. **Clean and rebuild**:
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

## Required Firebase Services

Make sure these Firebase services are enabled in your Firebase Console:

- ✅ **Authentication**: For user sign-in
- ✅ **Cloud Firestore**: For database
- ✅ **Cloud Messaging**: For push notifications
- ✅ **Storage**: For file uploads
- ✅ **App Check**: For security (optional in debug mode)

## Security Rules

Don't forget to deploy Firebase security rules:

```bash
firebase deploy --only firestore:rules
firebase deploy --only storage:rules
```

Or use the provided rule files:
- `firestore.rules`
- `storage.rules`
