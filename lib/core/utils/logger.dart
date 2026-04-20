import 'package:flutter/foundation.dart';

/// Utility class for logging with environment-aware behavior
class Logger {
  Logger._();

  static bool _isLoggingEnabled = kDebugMode;

  /// Enable or disable logging
  static void setLoggingEnabled(bool enabled) {
    _isLoggingEnabled = enabled;
  }

  /// Log info message
  static void log(String message, {String? tag}) {
    if (_isLoggingEnabled) {
      debugPrint('[${tag ?? 'INFO'}] $message');
    }
  }

  /// Log error message
  static void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    if (_isLoggingEnabled) {
      debugPrint('[${tag ?? 'ERROR'}] $message');
      if (error != null) {
        debugPrint('Error: $error');
      }
      if (stackTrace != null) {
        debugPrint('StackTrace: $stackTrace');
      }
    }
  }

  /// Log warning message
  static void warning(String message, {String? tag}) {
    if (_isLoggingEnabled) {
      debugPrint('[${tag ?? 'WARNING'}] $message');
    }
  }

  /// Log debug message
  static void debug(String message, {String? tag}) {
    if (_isLoggingEnabled) {
      debugPrint('[${tag ?? 'DEBUG'}] $message');
    }
  }

  /// Log verbose message
  static void verbose(String message, {String? tag}) {
    if (_isLoggingEnabled) {
      debugPrint('[${tag ?? 'VERBOSE'}] $message');
    }
  }

  /// Log network request
  static void network(String method, String url, {String? body, int? statusCode}) {
    if (_isLoggingEnabled) {
      debugPrint('[NETWORK] $method $url - Status: ${statusCode ?? 'N/A'}');
      if (body != null && kDebugMode) {
        debugPrint('Body: $body');
      }
    }
  }

  /// Log Firestore operation
  static void firestore(String operation, String collection, {String? docId, Map<String, dynamic>? data}) {
    if (_isLoggingEnabled) {
      debugPrint('[FIRESTORE] $operation on $collection${docId != null ? '/$docId' : ''}');
      if (data != null && kDebugMode) {
        debugPrint('Data: $data');
      }
    }
  }

  /// Log authentication event
  static void auth(String event, {String? userId, String? provider}) {
    if (_isLoggingEnabled) {
      debugPrint('[AUTH] $event - User: ${userId ?? 'N/A'}, Provider: ${provider ?? 'N/A'}');
    }
  }

  /// Log notification event
  static void notification(String event, {String? type, String? title}) {
    if (_isLoggingEnabled) {
      debugPrint('[NOTIFICATION] $event - Type: ${type ?? 'N/A'}, Title: ${title ?? 'N/A'}');
    }
  }

  /// Log offline sync event
  static void sync(String event, {int? pendingCount, String? operation}) {
    if (_isLoggingEnabled) {
      debugPrint('[SYNC] $event - Pending: $pendingCount, Operation: ${operation ?? 'N/A'}');
    }
  }
}
