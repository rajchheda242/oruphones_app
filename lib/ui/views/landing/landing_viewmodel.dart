import 'package:flutter/material.dart';
import 'package:oruphones_app/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class LandingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  bool get isLoggedIn => _authService.isLoggedIn;
  String? get userName => _authService.currentUser?.name;
  String? get joinDate => _authService.currentUser?.joinDate;
  String? get profileImage => _authService.currentUser?.profileImage;

  void navigateToLogin() {
    _navigationService.navigateToPhoneInputView();
  }

  void navigateToSellPhone() {
    if (!isLoggedIn) {
      navigateToLogin();
      return;
    }
    // TODO: Implement sell phone flow
  }

  void logout() {
    _authService.logout();
    _navigationService.clearStackAndShow(Routes.landingView);
  }

  void onHowToBuyTap() {
    // TODO: Implement how to buy flow
  }

  void onHowToSellTap() {
    // TODO: Implement how to sell flow
  }

  void onOruGuideTap() {
    // TODO: Implement guide flow
  }

  void onAboutUsTap() {
    // TODO: Implement about us flow
  }

  void onPrivacyPolicyTap() {
    // TODO: Implement privacy policy flow
  }

  void onFAQsTap() {
    // TODO: Implement FAQs flow
  }

  void onReturnPolicyTap() {
    // TODO: Implement return policy flow
  }

  void onBackPressed() {
    // Get the current context from the navigator key
    final context = _navigationService.navigatorKey?.currentContext;
    if (context != null) {
      // Pop until we reach the home view
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }
} 