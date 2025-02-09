import 'package:stacked/stacked.dart';
import '../../../services/auth_service.dart';
import '../../../services/firebase_service.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> checkAuthStatus() async {
    try {
      // Initialize Firebase and setup notifications
      await FirebaseService.initialize();
      await FirebaseService.setupNotifications();

      // Add 3 second delay to show animation
      await Future.delayed(const Duration(seconds: 3));

      // Check if user is logged in using isLoggedIn API
      final response = await AuthService().checkLoginStatus();

      // Store authentication state if user is authenticated
      if (response.isAuthenticated) {
        // TODO: Persist authentication state

        if (response.user.name.isEmpty) {
          // Navigate to confirm name screen for new users
          // TODO: Add navigation to confirm name screen
          print('Navigating to confirm name screen');
          return; // Exit early to prevent home screen navigation
        }
      }

      // Navigate to home screen for all other cases
      // TODO: Add navigation to home screen
      print('Navigating to home screen');
    } catch (e) {
      print('Error in splash screen: $e');
      // TODO: Add navigation to home screen
    }
  }
}
