import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'presentation/routers/app_router.dart';
import 'core/utils/logger.dart';

import 'core/services/firebase_config_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive for local caching & settings
  try {
    await Hive.initFlutter();
    await Hive.openBox('sync_queue');
    await Hive.openBox('cache');
    await Hive.openBox('settings');
  } catch (e) {
    print('⚠️  Hive initialization warning: $e');
  }

  // Initialize Firebase with dynamic or default options
  try {
    final firebaseOptions = await FirebaseConfigService.getOptions();
    await Firebase.initializeApp(
      options: firebaseOptions,
    );
    
    // Enable Firestore offline persistence
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
    
    // Initialize Firebase App Check
    try {
      await FirebaseAppCheck.instance.activate(
        androidProvider: kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
        appleProvider: AppleProvider.appAttest,
      );
    } catch (e) {
      Logger.warning('App Check activation failed: $e', tag: 'Main');
    }
  } catch (e) {
    // Firebase initialization failed - likely due to invalid credentials
    print('❌ Firebase initialization failed: $e');
    print('⚠️  Make sure you have configured Firebase correctly:');
    print('   1. Run: flutterfire configure');
    print('   2. Or manually update lib/firebase_options.dart with your Firebase credentials');
    print('   3. For Android, also add google-services.json to android/app/');
  }
  
  
  // Initialize Crashlytics and Analytics in debug mode
  if (kDebugMode) {
    Logger.log('App initialized in debug mode');
  }
  
  runApp(
    const ProviderScope(
      child: SocietyGuardianApp(),
    ),
  );
}

class SocietyGuardianApp extends ConsumerWidget {
  const SocietyGuardianApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}
