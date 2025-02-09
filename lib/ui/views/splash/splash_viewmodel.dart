import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';
import '../../../services/firebase_service.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

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
          // Navigate to confirm name screen if name is empty
          _navigationService.replaceWith(Routes.confirmNameView);
          return;
        } else {
          _navigationService.replaceWith(Routes.homeView);
          return;
        }
      }

      // If not authenticated, go to login
      _navigationService.replaceWith(Routes.loginView);
    } catch (e) {
      print('Error in splash screen: $e');
      // On error, go to login
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
