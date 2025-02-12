import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oruphones_app/app/app.locator.dart';
import 'package:oruphones_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'splash_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.router.dart';


class SplashView extends StackedView<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animations/splash.json',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
          onLoaded: (_) => viewModel.initialize(),
        ),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();
}

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  Future<void> initialize() async {
    await _authService.initialize();
    
    if (_authService.isLoggedIn) {
      if (_authService.currentUser?.name.isEmpty ?? true) {
        await _navigationService.replaceWith(Routes.confirmNameView);
      } else {
        await _navigationService.replaceWith(Routes.homeView);
      }
    } else {
      await _navigationService.replaceWith(Routes.landingView);
    }
  }
}
