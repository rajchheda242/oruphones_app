import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
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
      errorMessage = null;
      final phone = phoneController.text;

      final result = await AuthService().generateOtp(
        countryCode: 91,
        mobileNumber: int.parse(phone),
      );

      if (!result.success) {
        errorMessage = result.error;
        notifyListeners();
        return;
      }

      // TODO: Navigation
    } catch (e) {
      errorMessage = 'Something went wrong. Please try again.';
      notifyListeners();
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
