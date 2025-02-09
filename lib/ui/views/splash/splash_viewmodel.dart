import 'package:stacked/stacked.dart';
import '../../../services/auth_service.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> checkAuthStatus() async {
    // Add 3 second delay to show animation
    await Future.delayed(const Duration(seconds: 3));

    try {
      // Check if user is logged in using isLoggedIn API
      final response = await AuthService().checkLoginStatus();

      if (response.isAuthenticated) {
        if (response.user.name.isEmpty) {
          // Navigate to confirm name screen
          // TODO: Add navigation
        } else {
          // Navigate to home screen
          // TODO: Add navigation
        }
      } else {
        // Navigate to home screen (user will see login option there)
        // TODO: Add navigation
      }
    } catch (e) {
      // Handle error
      // TODO: Show error message
    }
  }
}
