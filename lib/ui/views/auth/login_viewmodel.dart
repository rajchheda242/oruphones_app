import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/auth_service.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../ui/views/auth/verify_otp_view.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final phoneController = TextEditingController();
  bool _acceptedTerms = false;
  final bool isBottomSheet;

  LoginViewModel({this.isBottomSheet = false});

  String? get phoneError {
    final phone = phoneController.text;
    if (phone.isEmpty) return null;
    if (phone.length != 10) return 'Enter valid number';
    if (!RegExp(r'^[0-9]{10}$').hasMatch(phone)) {
      return 'Enter valid number';
    }
    return null;
  }

  bool get acceptedTerms => _acceptedTerms;

  bool get canProceed =>
      phoneController.text.length == 10 &&
      _acceptedTerms &&
      !isBusy &&
      phoneError == null;

  void setAcceptedTerms(bool? value) {
    _acceptedTerms = value ?? false;
    notifyListeners();
  }

  @override
  void setError(dynamic message) {
    super.setError(message);
    notifyListeners();
  }

  Future<void> generateOtp() async {
    if (!canProceed) return;

    try {
      setBusy(true);
      setError(null);
      notifyListeners();

      final phone = phoneController.text;

      final result = await _authService.generateOtp(
        countryCode: 91,
        mobileNumber: int.parse(phone),
      );

      if (!result.success) {
        setError(result.error ?? 'Failed to generate OTP');
        return;
      }

      await _navigationService.navigateTo(
        Routes.verifyOtpView,
        arguments: VerifyOtpViewArguments(
          phoneNumber: phone,
          isBottomSheet: isBottomSheet,
        ),
      );
    } catch (e) {
      print('Generate OTP Error: $e');
      setError('Something went wrong. Please try again.');
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
