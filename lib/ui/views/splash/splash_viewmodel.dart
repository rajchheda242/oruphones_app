import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  Future<void> checkAuthStatus() async {
    try {
      setBusy(true);
      
      // Check authentication state
      final response = await _authService.checkLoginStatus();

      // Add delay for splash animation
      await Future.delayed(const Duration(seconds: 3));

      if (response.isAuthenticated) {
        if (response.user.name.isEmpty) {
          // New user - needs to set name
          await _navigationService.replaceWith(Routes.confirmNameView);
        } else {
          // Existing user - go to home
          await _navigationService.replaceWith(Routes.homeView);
        }
      } else {
        // Not authenticated - go to phone input
        await _navigationService.replaceWith(Routes.phoneInputView);
      }
    } catch (e) {
      // On error, go to phone input
      await _navigationService.replaceWith(Routes.phoneInputView);
    } finally {
      setBusy(false);
    }
  }
}
