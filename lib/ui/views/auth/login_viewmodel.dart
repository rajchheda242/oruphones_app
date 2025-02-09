import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/auth_service.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../ui/views/auth/verify_otp_view.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final phoneController = TextEditingController();
  bool _acceptedTerms = false;
  String? errorMessage;

  String? get phoneError {
    if (phoneController.text.isEmpty) return null;
    if (phoneController.text.length != 10) return 'Enter valid number';
    return null;
  }

  bool get acceptedTerms => _acceptedTerms;
  bool get canProceed => phoneController.text.length == 10 && _acceptedTerms;

  void setAcceptedTerms(bool? value) {
    _acceptedTerms = value ?? false;
    notifyListeners();
  }

  Future<void> generateOtp() async {
    if (!canProceed) return;

    try {
      setBusy(true);
      final phone = phoneController.text;

      final result = await AuthService().generateOtp(
        countryCode: 91,
        mobileNumber: int.parse(phone),
      );

      if (!result.success) {
        setError(result.error ?? 'Failed to generate OTP');
        return;
      }

      _navigationService.navigateTo(
        Routes.verifyOtpView,
        arguments: VerifyOtpViewArguments(phoneNumber: phone),
      );
    } catch (e) {
      setError(e.toString());
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
