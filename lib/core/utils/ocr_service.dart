import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constants/app_constants.dart';
import 'logger.dart';

/// Service for Optical Character Recognition (OCR) using Google ML Kit
class OcrService {
  final TextRecognizer _textRecognizer = TextRecognizer();
  final ImagePicker _imagePicker = ImagePicker();

  OcrService._internal();
  static final OcrService _instance = OcrService._internal();
  factory OcrService() => _instance;

  /// Capture image from camera and perform OCR
  Future<OcrResult> captureAndRecognize({
    required String societyName,
    int maxRetries = 3,
  }) async {
    try {
      // Capture image from camera
      final XFile? photo = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 90,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (photo == null) {
        return OcrResult(
          success: false,
          error: 'No image captured',
        );
      }

      // Perform OCR with retry logic
      for (int attempt = 1; attempt <= maxRetries; attempt++) {
        final result = await _processImage(
          imagePath: photo.path,
          societyName: societyName,
        );

        if (result.success || attempt == maxRetries) {
          return result;
        }

        // If no text detected, prompt for retake
        Logger.log('Attempt $attempt: No text detected, retrying...', 
            tag: 'OcrService');
      }

      return OcrResult(
        success: false,
        error: 'Failed to detect text after $maxRetries attempts',
      );
    } catch (e, stackTrace) {
      Logger.error('OCR capture failed', 
          error: e, stackTrace: stackTrace, tag: 'OcrService');
      return OcrResult(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Process image file and extract text
  Future<OcrResult> _processImage({
    required String imagePath,
    required String societyName,
  }) async {
    try {
      final inputImage = InputImage.fromFilePath(imagePath);
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);

      if (recognizedText.text.isEmpty) {
        return OcrResult(
          success: false,
          error: 'No text detected in image',
        );
      }

      // Parse the extracted text to find address components
      final addressInfo = _parseAddress(recognizedText.text, societyName);

      Logger.log('OCR Result: ${addressInfo.detectedText}', tag: 'OcrService');

      return OcrResult(
        success: true,
        detectedText: recognizedText.text,
        societyNameFound: addressInfo.societyNameFound,
        matchedSocietyName: addressInfo.matchedSocietyName,
        fullAddress: addressInfo.fullAddress,
        pincode: addressInfo.pincode,
        confidence: addressInfo.confidence,
        blocks: recognizedText.blocks.map((block) => OcrTextBlock(
          text: block.text,
          confidence: block.confidence ?? 0.0,
          lines: block.lines.map((line) => OcrTextLine(
            text: line.text,
            confidence: line.confidence ?? 0.0,
          )).toList(),
        )).toList(),
      );
    } catch (e, stackTrace) {
      Logger.error('OCR processing failed', 
          error: e, stackTrace: stackTrace, tag: 'OcrService');
      return OcrResult(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Parse extracted text to identify address components
  AddressInfo _parseAddress(String text, String societyName) {
    final lines = text.split('\n').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    
    // Normalize society name for comparison
    final normalizedSocietyName = societyName.toLowerCase().trim();
    final societyKeywords = [
      normalizedSocietyName,
      ..._generateSocietyVariations(normalizedSocietyName),
    ];

    String? matchedSocietyName;
    bool societyNameFound = false;
    String fullAddress = '';
    String? pincode;
    double confidence = 0.0;
    int totalConfidencePoints = 0;
    int confidencePointCount = 0;

    for (final line in lines) {
      final normalizedLine = line.toLowerCase();
      
      // Check if this line contains society name
      for (final keyword in societyKeywords) {
        if (normalizedLine.contains(keyword)) {
          societyNameFound = true;
          matchedSocietyName = line;
          totalConfidencePoints += 100;
          confidencePointCount++;
          break;
        }
      }

      // Try to extract pincode (Indian format: 6 digits)
      final pincodeRegex = RegExp(r'\b\d{6}\b');
      final pincodeMatch = pincodeRegex.firstMatch(line);
      if (pincodeMatch != null && pincode == null) {
        pincode = pincodeMatch.group(0);
        totalConfidencePoints += 50;
        confidencePointCount++;
      }

      // Accumulate address lines
      if (fullAddress.isNotEmpty) {
        fullAddress += ', ';
      }
      fullAddress += line;
      
      // Estimate confidence based on text clarity
      totalConfidencePoints += 30;
      confidencePointCount++;
    }

    confidence = confidencePointCount > 0 
        ? (totalConfidencePoints / (confidencePointCount * 100)).clamp(0.0, 1.0)
        : 0.0;

    return AddressInfo(
      societyNameFound: societyNameFound,
      matchedSocietyName: matchedSocietyName,
      fullAddress: fullAddress,
      pincode: pincode,
      confidence: confidence,
      detectedText: text,
    );
  }

  /// Generate variations of society name for better matching
  List<String> _generateSocietyVariations(String baseName) {
    final variations = <String>[
      baseName,
      baseName.replaceAll('society', '').trim(),
      baseName.replaceAll('apartments', '').trim(),
      baseName.replaceAll('complex', '').trim(),
      baseName.replaceAll('residency', '').trim(),
      baseName.replaceAll('estate', '').trim(),
      baseName.replaceAll('heights', '').trim(),
      baseName.replaceAll('tower', '').trim(),
      baseName.replaceAll(' ', ''), // Remove spaces
    ];
    
    // Add abbreviated versions
    final words = baseName.split(' ');
    if (words.length > 1) {
      final abbreviations = words.map((w) => w.isNotEmpty ? w[0] : '').join();
      variations.add(abbreviations);
    }

    return variations.where((v) => v.isNotEmpty).toList();
  }

  /// Verify if package belongs to the society
  Future<PackageVerificationResult> verifyPackageForSociety({
    required String societyName,
    required String societyId,
  }) async {
    final ocrResult = await captureAndRecognize(societyName: societyName);

    if (!ocrResult.success) {
      return PackageVerificationResult(
        verified: false,
        ocrResult: ocrResult,
        message: 'Failed to scan package address',
      );
    }

    if (!ocrResult.societyNameFound) {
      return PackageVerificationResult(
        verified: false,
        ocrResult: ocrResult,
        message: 'Society name not found in address',
        suggestedAction: 'Please ensure the society name is clearly visible on the package',
      );
    }

    // Additional verification: Check confidence score
    if (ocrResult.confidence < 0.5) {
      return PackageVerificationResult(
        verified: false,
        ocrResult: ocrResult,
        message: 'Low confidence in address detection',
        suggestedAction: 'Please retake the photo in better lighting',
      );
    }

    return PackageVerificationResult(
      verified: true,
      ocrResult: ocrResult,
      message: 'Package verified for ${societyName}',
      confidence: ocrResult.confidence,
    );
  }

  /// Dispose resources
  void dispose() {
    _textRecognizer.close();
  }
}

/// Result of OCR operation
class OcrResult {
  final bool success;
  final String? error;
  final String? detectedText;
  final bool societyNameFound;
  final String? matchedSocietyName;
  final String? fullAddress;
  final String? pincode;
  final double confidence;
  final List<OcrTextBlock>? blocks;

  OcrResult({
    required this.success,
    this.error,
    this.detectedText,
    this.societyNameFound = false,
    this.matchedSocietyName,
    this.fullAddress,
    this.pincode,
    this.confidence = 0.0,
    this.blocks,
  });

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'error': error,
      'detectedText': detectedText,
      'societyNameFound': societyNameFound,
      'matchedSocietyName': matchedSocietyName,
      'fullAddress': fullAddress,
      'pincode': pincode,
      'confidence': confidence,
      'blocks': blocks?.map((b) => b.toJson()).toList(),
    };
  }
}

/// Text block from OCR
class OcrTextBlock {
  final String text;
  final double confidence;
  final List<OcrTextLine> lines;

  OcrTextBlock({
    required this.text,
    required this.confidence,
    required this.lines,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'confidence': confidence,
      'lines': lines.map((l) => l.toJson()).toList(),
    };
  }
}

/// Text line from OCR
class OcrTextLine {
  final String text;
  final double confidence;

  OcrTextLine({
    required this.text,
    required this.confidence,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'confidence': confidence,
    };
  }
}

/// Parsed address information
class AddressInfo {
  final bool societyNameFound;
  final String? matchedSocietyName;
  final String fullAddress;
  final String? pincode;
  final double confidence;
  final String detectedText;

  AddressInfo({
    required this.societyNameFound,
    this.matchedSocietyName,
    required this.fullAddress,
    this.pincode,
    required this.confidence,
    required this.detectedText,
  });
}

/// Package verification result
class PackageVerificationResult {
  final bool verified;
  final OcrResult ocrResult;
  final String message;
  final String? suggestedAction;
  final double? confidence;

  PackageVerificationResult({
    required this.verified,
    required this.ocrResult,
    required this.message,
    this.suggestedAction,
    this.confidence,
  });

  Map<String, dynamic> toJson() {
    return {
      'verified': verified,
      'message': message,
      'suggestedAction': suggestedAction,
      'confidence': confidence,
      'ocrData': ocrResult.toJson(),
    };
  }
}
