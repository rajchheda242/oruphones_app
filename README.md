# OruPhones App

A Flutter application built for OruPhones internship assessment

## Architecture & State Management

### State Management
- Using **Stacked** architecture for state management
- Services for business logic
- ViewModels for UI state management
- Views for UI representation

### Project Structure
```
lib/
├── app/                    # App level configurations
├── core/                   # Core functionality
│   ├── constants/         # App constants
│   ├── models/           # Data models
│   ├── services/         # Business logic services
│   └── utils/            # Utility functions
├── ui/                    # UI components
│   ├── views/            # Screen implementations
│   ├── widgets/          # Reusable widgets
│   └── common/           # Common UI components
└── main.dart             # Entry point
```

## Features
- OTP Authentication
- Product Listings with Pagination
- Firebase Push Notifications
- Like/Unlike Products
- User Profile Management

## Setup Instructions
1. Clone the repository
2. Run `flutter pub get`
3. Configure Firebase project
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