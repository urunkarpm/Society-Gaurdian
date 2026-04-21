# Residence Verification Feature

## Overview
This feature allows users to select their society, building, wing, and flat after logging in. The admin then reviews and approves/rejects these requests before granting full resident access.

## Flow

### 1. User Login → Society Selection
- After logging in with Google, if the user has no role or `verificationStatus` is `pending`, they are redirected to the **Society Selection Screen** (`/select-residence`)
- User selects:
  - Society (from active societies)
  - Building Number (filtered by society)
  - Wing (filtered by society + building, optional with "N/A" option)
  - Flat Number (filtered by all above selections)

### 2. Submit Verification Request
- When user submits the form:
  - A new document is created in the `residence_verifications` collection
  - User's profile is updated with `verificationStatus: 'pending'`
  - User is redirected to **Waiting Approval Screen** (`/waiting-approval`)

### 3. Waiting for Approval
- User sees their request status (Pending/Approved/Rejected)
- If **Pending**: User can refresh or edit their request
- If **Approved**: User is automatically redirected to resident home screen
- If **Rejected**: User sees rejection reason and can resubmit

### 4. Admin Review
- Admin accesses **Verifications** tab in the admin dashboard
- Admin can:
  - View all verification requests (filter by status)
  - See request details (user info, selected residence)
  - **Approve**: Sets user role to `resident` and grants access
  - **Reject**: Provides a reason, user can resubmit

## Firestore Collections

### residence_verifications
```javascript
{
  userId: string,
  userEmail: string,
  userName: string,
  societyId: string,
  buildingNumber: string,
  wing: string | null,
  flatNumber: string,
  flatId: string,
  status: 'pending' | 'approved' | 'rejected',
  requestedAt: Timestamp,
  reviewedAt: Timestamp | null,
  reviewedBy: string | null,
  rejectionReason: string | null
}
```

### users (updated fields)
```javascript
{
  // ... existing fields
  verificationStatus: 'pending' | 'approved' | 'rejected' | null,
  societyId: string | null,
  flatId: string | null
}
```

## Files Created/Modified

### New Files
1. `/lib/presentation/screens/resident/society_selection_screen.dart`
   - Form for selecting society, building, wing, and flat
   - Cascading dropdowns (each selection filters the next)
   - Submits verification request to Firestore

2. `/lib/presentation/screens/resident/waiting_approval_screen.dart`
   - Shows verification request status
   - Displays approval/rejection status with details
   - Allows resubmission if rejected

3. `/lib/presentation/screens/admin/admin_verifications_screen.dart`
   - Admin interface to review verification requests
   - Filter by status (pending/approved/rejected/all)
   - Approve/Reject actions with reason for rejection

### Modified Files
1. `/lib/presentation/routers/app_router.dart`
   - Added routes for `/select-residence` and `/waiting-approval`
   - Added route for `/admin/verifications`
   - Imported new screens

2. `/lib/presentation/screens/admin_dashboard_screen.dart`
   - Added Verifications tab to navigation rail
   - Integrated `AdminVerificationsScreen` as second tab

3. `/lib/presentation/providers/auth_provider.dart`
   - Updated `authStateProvider` to check `verificationStatus`
   - Users with pending verification are routed appropriately

## Usage

### For Residents
1. Login with Google
2. Select your society, building, wing, and flat
3. Submit for verification
4. Wait for admin approval
5. Once approved, access all resident features

### For Admins
1. Login with admin account
2. Navigate to Admin Dashboard
3. Click on "Verifications" tab
4. Review pending requests
5. Approve or reject with reason

## Security Notes
- Only admins can approve/reject verification requests
- Verification requests are stored in a separate collection for audit trail
- User role is only set to `resident` after admin approval
- Rejected users can resubmit with corrected information

## Future Enhancements
- Email notifications on approval/rejection
- Auto-expiry of pending requests after X days
- Bulk approval/rejection
- Export verification reports
- Document upload for proof of residence
