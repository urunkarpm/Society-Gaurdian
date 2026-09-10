import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/services/firebase_config_service.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/logger.dart';

class FirebaseConfigScreen extends StatefulWidget {
  const FirebaseConfigScreen({super.key});

  @override
  State<FirebaseConfigScreen> createState() => _FirebaseConfigScreenState();
}

class _FirebaseConfigScreenState extends State<FirebaseConfigScreen> {
  final _formKey = GlobalKey<FormState>();
  final _apiKeyController = TextEditingController();
  final _projectIdController = TextEditingController();
  final _appIdController = TextEditingController();
  final _messagingSenderIdController = TextEditingController();
  final _storageBucketController = TextEditingController();

  bool _isSaving = false;

  @override
  void dispose() {
    _apiKeyController.dispose();
    _projectIdController.dispose();
    _appIdController.dispose();
    _messagingSenderIdController.dispose();
    _storageBucketController.dispose();
    super.dispose();
  }

  Future<void> _saveConfiguration() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      await FirebaseConfigService.saveCustomConfig(
        apiKey: _apiKeyController.text,
        projectId: _projectIdController.text,
        appId: _appIdController.text,
        messagingSenderId: _messagingSenderIdController.text,
        storageBucket: _storageBucketController.text.isNotEmpty ? _storageBucketController.text : null,
      );

      // Re-initialize Firebase with newly saved credentials
      try {
        if (Firebase.apps.isNotEmpty) {
          await Firebase.app().delete();
        }
        final options = await FirebaseConfigService.getOptions();
        await Firebase.initializeApp(options: options);
      } catch (e) {
        Logger.warning('Firebase re-initialization note: $e', tag: 'FirebaseConfigScreen');
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Firebase project configured successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        context.go('/login');
      }
    } catch (e) {
      Logger.error('Failed to save Firebase configuration', error: e, tag: 'FirebaseConfigScreen');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save configuration: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configure Firebase Project'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.settings_suggest_outlined,
                  size: 64,
                  color: AppTheme.primaryColor,
                ),
                const SizedBox(height: 16),
                Text(
                  'Society Firebase Setup',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your society\'s Firebase project configuration details below. These are stored locally on your device.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _projectIdController,
                  decoration: const InputDecoration(
                    labelText: 'Firebase Project ID',
                    hintText: 'e.g. my-society-app',
                    prefixIcon: Icon(Icons.corporate_fare),
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Project ID is required';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _apiKeyController,
                  decoration: const InputDecoration(
                    labelText: 'API Key',
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'API Key is required';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _appIdController,
                  decoration: const InputDecoration(
                    labelText: 'App ID',
                    hintText: '1:123456789:android:abcd1234',
                    prefixIcon: Icon(Icons.phonelink),
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'App ID is required';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _messagingSenderIdController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Messaging Sender ID',
                    prefixIcon: Icon(Icons.send),
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Messaging Sender ID is required';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _storageBucketController,
                  decoration: const InputDecoration(
                    labelText: 'Storage Bucket (Optional)',
                    hintText: 'e.g. my-society-app.appspot.com',
                    prefixIcon: Icon(Icons.cloud_upload_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: _isSaving ? null : _saveConfiguration,
                  icon: _isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.save),
                  label: Text(_isSaving ? 'Saving Configuration...' : 'Save & Continue'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () => context.go('/login'),
                  child: const Text('Back to Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
