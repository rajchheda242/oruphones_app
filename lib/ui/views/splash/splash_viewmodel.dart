import 'package:stacked/stacked.dart';
import '../../../services/auth_service.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> checkAuthStatus() async {
    try {
      // Add 3 second delay to show animation
      await Future.delayed(const Duration(seconds: 3));

      // Check if user is logged in using isLoggedIn API
      final response = await AuthService().checkLoginStatus();

      // Store authentication state if user is authenticated
      if (response.isAuthenticated) {
        // TODO: Persist authentication state
        if (response.user.name.isEmpty) {
          // TODO: Set flag to show confirm name screen inside home
          print('User needs to confirm name');
        }
      }

      // Always navigate to home screen after tasks complete
      // TODO: Add navigation to home screen
      print('Navigating to home screen');
    } catch (e) {
      // Log error but still navigate to home screen
      print('Error checking auth status: $e');
      // TODO: Add navigation to home screen
    }
  }
}
