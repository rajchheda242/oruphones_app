import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final phoneController = TextEditingController();
  bool _acceptedTerms = false;

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

      await AuthService().generateOtp(
        countryCode: 91,
        mobileNumber: int.parse(phone),
      );

      // TODO: Navigate to OTP verification screen
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
