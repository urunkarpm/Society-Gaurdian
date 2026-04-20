import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'presentation/routers/app_router.dart';
import 'presentation/providers/auth_provider.dart';
import 'features/notifications/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Initialize Hive for local caching
  await Hive.initFlutter();
  await Hive.openBox('sync_queue');
  await Hive.openBox('user_preferences');
  
  // Enable Firestore offline persistence
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  
  // Initialize Firebase App Check
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider(AppConstants.webRecaptchaKey),
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.deviceCheck,
  );
  
  // Setup FCM
  await NotificationService.initialize();
  
  // Set up auth state listener
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      // Update FCM token in Firestore
      NotificationService.updateFCMToken(user.uid);
    }
  });
  
  runApp(const ProviderScope(child: SocietyGuardianApp()));
}

class SocietyGuardianApp extends ConsumerWidget {
  const SocietyGuardianApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final theme = AppTheme.lightTheme;
    
    return MaterialApp.router(
      title: 'Society Guardian',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: router,
    );
  }
}
