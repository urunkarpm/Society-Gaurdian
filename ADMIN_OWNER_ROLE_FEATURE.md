# Admin/Owner Role Toggle Feature

## Overview
This feature enables users who are both admins and property owners to toggle between roles, and ensures they receive visitor notifications when in admin mode.

## Key Features Implemented

### 1. New Owner Role
- Added `UserRole.owner` to the user role enum in `user_entity.dart`
- Created `OwnerProfile` entity with properties:
  - `canActAsAdmin`: Indicates if owner can toggle to admin mode
  - `isAdminMode`: Tracks current active mode
  - `ownedFlatIds`: List of properties owned by the user

### 2. Enhanced Admin Profile
- Added `isOwner` flag to `AdminProfile` to identify admins who are also owners
- Added `ownerId` reference for linking admin and owner profiles

### 3. Role Toggle System (Flutter)

#### Auth Provider Changes (`auth_provider.dart`)
- **ActiveRoleNotifier**: State notifier for managing active role
  - `toggleRole()`: Switches between admin and owner roles
  - `setRole()`: Sets active role explicitly
  - `resetToBaseRole()`: Resets to base role
  
- **New Providers**:
  - `activeRoleProvider`: Tracks currently active role (admin/owner)
  - `isOwnerProvider`: Checks if user has owner role
  - `canToggleRolesProvider`: Determines if user can toggle (admin + owner flag)

#### Admin Dashboard Updates (`admin_dashboard_screen.dart`)
- **Role Toggle UI**: 
  - Shows current role badge (Admin/Owner)
  - Toggle button visible only for users who can switch roles
  - Visual feedback when switching modes
  
- **Visitor Notification Badge**:
  - Displays unread visitor notification count for admins
  - Real-time updates via Firestore stream listener
  - Only shown when in admin mode

#### Router Updates (`app_router.dart`)
- Added owner-specific routes:
  - `/owner/dashboard`: Uses admin dashboard
  - `/owner/visitors`: Access to visitor notifications
- Updated role guards:
  - `ownerOnly`: Restricts access to owners
  - `adminOrOwner`: Allows both roles
  - `staffOnly`: Extended to include owners

### 4. Cloud Functions Updates (`functions/src/index.ts`)

#### Enhanced Visitor Notifications
- **Admin/Owner FCM Tokens**: Queries all users with admin or owner role
- **Notification Filtering**: 
  - Checks `receiveVisitorNotifications` flag (default: true)
  - Respects `isAdminMode` status for owners
- **Combined Token Delivery**: Sends notifications to both residents and admins/owners

#### Dual Notification Documents
1. **Resident Notification** (`type: 'visitor'`):
   - Targeted to flat residents
   - Standard visitor alert

2. **Admin Notification** (`type: 'visitor_admin'`):
   - Targeted to all admins/owners in society
   - Includes additional context (flat number, etc.)
   - Enables notification badge in admin dashboard

## Usage Flow

### For Admin Who Is Also Owner:

1. **Login**: User logs in with admin credentials
2. **Dashboard Access**: Automatically routed to admin dashboard
3. **Role Toggle**: 
   - Click swap icon in navigation rail
   - Badge shows current mode (Admin/Owner)
   - SnackBar confirms mode switch
4. **Visitor Notifications**:
   - When visitor arrives, admin receives FCM push notification
   - Red badge appears on dashboard showing unread count
   - Click notification to view visitor details
5. **Mode Switching**:
   - In Admin Mode: Full admin access + visitor notifications
   - In Owner Mode: Owner-specific views (future enhancement)

## Database Schema Changes

### Users Collection
```typescript
{
  uid: string,
  email: string,
  role: 'admin' | 'owner',
  societyId: string,
  isOwner: boolean, // For admin users
  isAdminMode: boolean, // For owner users
  receiveVisitorNotifications: boolean, // Default true
  fcmTokens: string[],
  // ... other fields
}
```

### Notifications Collection
```typescript
{
  societyId: string,
  type: 'visitor' | 'visitor_admin',
  title: string,
  body: string,
  targetUserIds: string[],
  targetFlatIds?: string[],
  deepLink: string,
  data: {
    visitorId: string,
    visitorName: string,
    // ... visitor details
  },
  priority: number,
  isRead: boolean,
  createdAt: Timestamp
}
```

## Benefits

1. **Flexibility**: Admins who own property can seamlessly switch contexts
2. **Oversight**: Owners acting as admins stay informed about visitor activity
3. **Scalability**: Supports up to 2 admins per society (as per requirement)
4. **Real-time**: Instant notifications via FCM for all relevant parties
5. **Audit Trail**: Separate notification documents for residents and admins

## Future Enhancements

- Owner-specific dashboard views
- Granular notification preferences per admin/owner
- Visitor analytics for owners
- Multi-property owner support
- Delegation of admin duties to other owners
