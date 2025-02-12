import 'package:oruphones_app/services/auth_service.dart';
import 'package:oruphones_app/ui/views/auth/phone_input_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:flutter/material.dart';

class PhoneInputViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final bool isBottomSheet;
  
  PhoneInputViewModel({this.isBottomSheet = false});
  
  String _phoneNumber = '';
  bool _termsAccepted = false;

  String get phoneNumber => _phoneNumber;
  bool get termsAccepted => _termsAccepted;
  
  bool get canProceed => _phoneNumber.length == 10 && _termsAccepted;

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    setError(null);
    notifyListeners();
  }

  void setTermsAccepted(bool? value) {
    _termsAccepted = value ?? false;
    notifyListeners();
  }

  Future<void> navigateToOtpScreen() async {
    if (!canProceed) return;
    
    try {
      setBusy(true);
      final result = await _authService.generateOtp(
        countryCode: 91,
        mobileNumber: int.parse(_phoneNumber),
      );

      if (result.success) {
        await _navigationService.navigateToVerifyOtpView(
          phoneNumber: _phoneNumber,
          isBottomSheet: isBottomSheet,
        );
      }
    } finally {
      setBusy(false);
    }
  }

  void goBack() {
    if (isBottomSheet) {
      _navigationService.back();
    }
  }

  Future<void> showAsBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PhoneInputView(isBottomSheet: true),
    );
  }
} 