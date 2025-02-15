# OruPhones Flutter Assignment

A Flutter application for OruPhones internship assignment.

## Features
- Splash Screen with authentication persistence
- Complete Authentication Flow (both screen and bottom sheet modes)
- Home Screen with product listings and pagination
- Firebase Push Notifications
- Like/Unlike Products functionality
- Cyclic Dummy Product Cards
- Image Caching
- Responsive Layout Design

## Architecture & State Management
Using **Stacked** state management with MVVM architecture:
- Clean separation of concerns (Views, ViewModels, Services)
- Proper dependency injection
- Reusable components
- Proper error handling
- Efficient state management without setState

## Project Structure
```
lib/
├── app/
│   ├── app.dart
│   └── app.router.dart
├── core/
│   ├── models/
│   │   ├── product.dart
│   │   └── user.dart
│   └── services/
│       ├── auth_service.dart
│       ├── product_service.dart
│       └── firebase_service.dart
├── ui/
│   ├── common/
│   │   └── widgets/
│   └── views/
│       ├── auth/
│       │   ├── login_view.dart
│       │   ├── verify_otp_view.dart
│       │   └── confirm_name_view.dart
│       ├── home/
│       │   ├── home_view.dart
│       │   └── widgets/
│       │       ├── product_card.dart
│       │       ├── filter_sheet.dart
│       │       └── sort_sheet.dart
│       └── splash/
│           ├── splash_view.dart
│           └── splash_viewmodel.dart
└── main.dart
```

## Setup Instructions
1. Clone the repository
2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```
3. Configure Firebase:
   - Add `google-services.json` for Android
   - Add `GoogleService-Info.plist` for iOS
4. Run the app:
   ```bash
   flutter run
   ```

## Key Implementation Details

### Splash Screen
- Authentication state persistence
- Firebase notification permission handling
- Navigation logic based on user state
- New user name verification check

### Authentication
- Phone number validation
- OTP verification
- Name confirmation for new users
- Reusable authentication UI (works as both screen and bottom sheet)
- Persistent login state

### Home Screen
- Custom scrolling behavior matching OruPhones app
- Product listing with pagination
- Like/Unlike functionality with authentication integration
- Cyclic dummy product cards (every 7th listing)
- Image caching for better performance
- Responsive grid layout

### Firebase Integration
- Push notification handling (foreground and background)
- Notification permission management
- Firebase Cloud Messaging implementation

## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  stacked: ^3.0.0
  firebase_core: ^2.0.0
  firebase_messaging: ^14.0.0
  cached_network_image: ^3.0.0
  dio: ^5.0.0
  flutter_secure_storage: ^8.0.0
```

Note: Some of the features and functionality are not implemented yet. I have done the best I could.