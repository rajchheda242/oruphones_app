# OruPhones Flutter Assignment

A Flutter application for OruPhones internship assignment.

## Project Setup Steps

### Step 1: Initial Setup 
- Created new Flutter project
- Added basic dependencies:
  - lottie: For splash screen animation
- Created basic folder structure
- Added splash screen animation asset

### Step 2: Splash Screen Implementation ⏳
- Added authentication check
- Added API service integration
- Added state management with Stacked
- Added Firebase initialization and notification permissions
- Implemented navigation logic

### Step 3: Authentication Implementation 🚧
- Created reusable login widget (works as both screen and bottom sheet)
- Implemented OTP generation API
- Added phone number validation
- Added terms and conditions acceptance
- Added proper error handling with API responses
- Improved UI/UX with form validation
- Added OTP verification screen with:
  - 4-digit OTP input
  - Resend OTP functionality with timer
  - Validation and error handling
  - Navigation logic based on user state
- Added Confirm Name screen with:
  - Name input validation
  - API integration for name update
  - Error handling and loading states

### Project Structure
```
lib/
├── core/
│   └── models/
│       └── api_response.dart
├── services/
│   ├── auth_service.dart
│   └── firebase_service.dart
├── ui/
│   └── views/
│       ├── auth/
│       │   ├── login_view.dart
│       │   ├── login_viewmodel.dart
│       │   ├── verify_otp_view.dart
│       │   ├── verify_otp_viewmodel.dart
│       │   ├── confirm_name_view.dart
│       │   └── confirm_name_viewmodel.dart
│       └── splash/
│           ├── splash_view.dart
│           └── splash_viewmodel.dart
└── main.dart

assets/
└── animations/
    └── splash.json
```

### Current Progress
- [x] Project Setup
- [x] Splash Screen Implementation
- [⏳] Authentication Flow
- [ ] Home Screen
- [ ] Firebase Integration

### Architecture Highlights
- Using Stacked for state management
- Proper separation of concerns (Views, ViewModels, Services)
- Reusable components
- Proper error handling with API responses
- Form validation and user feedback

## Features
- OTP Authentication
- Product Listings with Pagination
- Firebase Push Notifications
- Like/Unlike Products
- User Profile Management

## Setup Instructions
1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build` to generate route files
4. Run the app using `flutter run`

## Dependencies
- stacked: State management
- firebase_core: Firebase integration
- firebase_messaging: Push notifications
- dio: Network calls
- cached_network_image: Image caching
- flutter_secure_storage: Secure storage

## Development Status
working

## Architecture & State Management
- Using **Stacked** state management for MVVM architecture
- Clean separation of concerns with ViewModels handling business logic
- Reusable components for consistent UI elements

## Authentication Flow
- Complete authentication flow with phone number verification
- OTP verification system
- Name confirmation for new users
- Supports both full-screen and bottom sheet modes
- Persistent authentication state

## Key Features
- Phone number authentication
- OTP verification
- User name confirmation
- Persistent login state
- Bottom sheet support for in-app authentication

## Technical Details
- Flutter SDK: >=3.0.0 <4.0.0
- Stacked State Management
- Firebase Integration
- Clean Architecture