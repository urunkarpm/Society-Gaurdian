# Package Address Verification with OCR

## Overview

This feature enables security guards to verify if a delivery package belongs to the society by scanning the address on the package using Optical Character Recognition (OCR). The system uses Google ML Kit's on-device text recognition to extract and analyze address information.

## How It Works

### 1. Guard Initiates Scan
- Security guard opens the "Scan Package Address" button from the Guard Home Screen
- The app launches the camera interface

### 2. Image Capture & OCR Processing
- Guard captures a photo of the package address label
- Google ML Kit Text Recognition processes the image on-device
- Text is extracted and parsed to identify:
  - Society name
  - Full address
  - Pincode (6-digit Indian format)

### 3. Society Name Matching
The system performs intelligent matching against the registered society name:
- **Exact match**: Direct comparison with society name
- **Variations**: Handles common variations like:
  - Removing suffixes (Society, Apartments, Complex, Residency, etc.)
  - Removing spaces for abbreviated matching
  - Case-insensitive comparison

### 4. Verification Result
The system provides:
- ✅ **Verified**: Society name found with high confidence (>70%)
- ⚠️ **Low Confidence**: Possible match but needs manual verification (40-70%)
- ❌ **Not Verified**: Society name not detected or low confidence (<40%)

### 5. Action Options
Based on verification result:
- **Retry**: Capture another image if verification fails
- **Accept Package**: Save verified package information to Firestore
- **Skip**: Decline the package if it doesn't belong to the society

## Technical Implementation

### Files Modified/Created

#### 1. `lib/core/utils/ocr_service.dart` (NEW)
Core OCR service implementing:
- `OcrService`: Singleton service for text recognition
- `captureAndRecognize()`: Captures image and performs OCR
- `verifyPackageForSociety()`: Main verification workflow
- `AddressInfo`: Parsed address data structure
- `PackageVerificationResult`: Verification outcome

#### 2. `lib/presentation/screens/guard/guard_home_screen.dart` (MODIFIED)
Added package scanning functionality:
- `_scanPackageAddress()`: Initiates the scan workflow
- `_showVerificationResult()`: Displays verification dialog
- `_savePackageInfo()`: Saves verified package to Firestore
- New "Scan Package Address" button in the Scan tab

#### 3. `pubspec.yaml` (MODIFIED)
Added dependency:
```yaml
google_mlkit_text_recognition: ^4.0.0
```

## Data Structure

### Firestore Collection: `societies/{societyId}/packages`
```javascript
{
  societyId: string,
  address: string,           // Extracted full address
  pincode: string,           // Extracted pincode
  societyVerified: boolean,  // Verification status
  verificationConfidence: number, // Confidence score (0-1)
  scannedAt: timestamp,      // When package was scanned
  scannedBy: string,         // UID of security guard
  ocrRawText: string         // Raw OCR output for reference
}
```

## Usage Flow

```
┌─────────────────┐
│   Guard Opens   │
│    App          │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Click "Scan     │
│ Package Address"│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Capture Photo   │
│ of Address      │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ OCR Processes   │
│ Image (ML Kit)  │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Match Society   │
│ Name            │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Show Result     │
│ Dialog          │
└────────┬────────┘
         │
    ┌────┴────┐
    │         │
    ▼         ▼
┌───────┐ ┌──────────┐
│ Retry │ │ Accept   │
└───────┘ └──────────┘
```

## Benefits

1. **Prevents Misdelivery**: Ensures packages are only accepted for the correct society
2. **Audit Trail**: All scanned packages are logged with OCR data
3. **Offline Capable**: ML Kit works on-device without internet
4. **Fast Processing**: On-device OCR provides instant results
5. **User-Friendly**: Clear visual feedback with confidence indicators

## Best Practices

### For Guards
- Ensure good lighting when capturing the address
- Hold the camera steady and focus on the address label
- Make sure the society name is clearly visible
- Retake photo if confidence score is low

### For Developers
- Handle OCR failures gracefully with retry options
- Store raw OCR text for debugging and audit purposes
- Consider adding support for multiple languages if needed
- Implement rate limiting to prevent abuse

## Future Enhancements

1. **Multi-language Support**: Add support for regional languages
2. **Barcode Integration**: Combine OCR with barcode/QR scanning
3. **Auto-categorization**: Classify packages by type (food, courier, documents)
4. **Resident Notification**: Automatically notify residents of package arrival
5. **Photo Storage**: Upload package photos to Firebase Storage
6. **Analytics Dashboard**: Track package delivery patterns

## Troubleshooting

### Common Issues

**Issue**: No text detected
- **Solution**: Improve lighting, ensure text is clear and large enough

**Issue**: Low confidence score
- **Solution**: Retake photo from different angle, ensure society name is prominent

**Issue**: False positive matches
- **Solution**: Manually verify before accepting package

**Issue**: Camera permission denied
- **Solution**: Guide user to enable camera permissions in device settings

## Testing

To test the feature:
1. Create a test society in Firestore with a known name
2. Login as security guard
3. Prepare a package with an address label containing the society name
4. Use the "Scan Package Address" feature
5. Verify the detection accuracy and confidence scores

## Dependencies

- `google_mlkit_text_recognition: ^4.0.0` - On-device text recognition
- `image_picker: ^1.0.7` - Camera access and image selection
- `firebase_firestore` - Storing package records
- `firebase_storage` - Optional: storing package photos
