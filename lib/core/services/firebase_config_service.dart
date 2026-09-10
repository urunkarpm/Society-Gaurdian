import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../firebase_options.dart';
import '../utils/logger.dart';

class FirebaseConfigService {
  static const String _boxName = 'settings';
  static const String _keyApiKey = 'fb_apiKey';
  static const String _keyProjectId = 'fb_projectId';
  static const String _keyAppId = 'fb_appId';
  static const String _keyMessagingSenderId = 'fb_messagingSenderId';
  static const String _keyStorageBucket = 'fb_storageBucket';
  static const String _keyAuthDomain = 'fb_authDomain';

  /// Save dynamic Firebase options to Hive local storage
  static Future<void> saveCustomConfig({
    required String apiKey,
    required String projectId,
    required String appId,
    required String messagingSenderId,
    String? storageBucket,
    String? authDomain,
  }) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_keyApiKey, apiKey.trim());
    await box.put(_keyProjectId, projectId.trim());
    await box.put(_keyAppId, appId.trim());
    await box.put(_keyMessagingSenderId, messagingSenderId.trim());

    final bucket = storageBucket?.trim().isNotEmpty == true
        ? storageBucket!.trim()
        : '${projectId.trim()}.appspot.com';
    await box.put(_keyStorageBucket, bucket);

    final domain = authDomain?.trim().isNotEmpty == true
        ? authDomain!.trim()
        : '${projectId.trim()}.firebaseapp.com';
    await box.put(_keyAuthDomain, domain);

    Logger.log('Saved custom Firebase credentials to local storage', tag: 'FirebaseConfigService');
  }

  /// Check if custom Firebase options exist in storage
  static Future<bool> hasCustomConfig() async {
    final box = await Hive.openBox(_boxName);
    final apiKey = box.get(_keyApiKey) as String?;
    final projectId = box.get(_keyProjectId) as String?;
    final appId = box.get(_keyAppId) as String?;

    return apiKey != null && apiKey.isNotEmpty &&
           projectId != null && projectId.isNotEmpty &&
           appId != null && appId.isNotEmpty;
  }

  /// Get active FirebaseOptions (either custom stored or default platform options)
  static Future<FirebaseOptions> getOptions() async {
    final box = await Hive.openBox(_boxName);
    final apiKey = box.get(_keyApiKey) as String?;
    final projectId = box.get(_keyProjectId) as String?;
    final appId = box.get(_keyAppId) as String?;
    final messagingSenderId = box.get(_keyMessagingSenderId) as String?;
    final storageBucket = box.get(_keyStorageBucket) as String?;
    final authDomain = box.get(_keyAuthDomain) as String?;

    if (apiKey != null && apiKey.isNotEmpty &&
        projectId != null && projectId.isNotEmpty &&
        appId != null && appId.isNotEmpty) {
      Logger.log('Using custom configured Firebase options', tag: 'FirebaseConfigService');
      return FirebaseOptions(
        apiKey: apiKey,
        projectId: projectId,
        appId: appId,
        messagingSenderId: messagingSenderId ?? '',
        storageBucket: storageBucket ?? '$projectId.appspot.com',
        authDomain: authDomain ?? '$projectId.firebaseapp.com',
      );
    }

    Logger.log('Using default platform Firebase options', tag: 'FirebaseConfigService');
    return DefaultFirebaseOptions.currentPlatform;
  }

  /// Clear stored custom config
  static Future<void> clearCustomConfig() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_keyApiKey);
    await box.delete(_keyProjectId);
    await box.delete(_keyAppId);
    await box.delete(_keyMessagingSenderId);
    await box.delete(_keyStorageBucket);
    await box.delete(_keyAuthDomain);
    Logger.log('Cleared custom Firebase credentials', tag: 'FirebaseConfigService');
  }
}
