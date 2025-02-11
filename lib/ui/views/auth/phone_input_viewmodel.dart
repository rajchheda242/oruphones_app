import 'package:oruphones_app/ui/views/auth/phone_input_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:flutter/material.dart';

class PhoneInputViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
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
    try {
      if (!canProceed) {
        if (_phoneNumber.length != 10) {
          setError('Please enter a valid 10-digit phone number');
        } else if (!_termsAccepted) {
          setError('Please accept terms and conditions');
        }
        notifyListeners();
        return;
      }

      setBusy(true);
      // Here you would typically make an API call to send OTP
      
      await _navigationService.navigateToLoginView(
        isBottomSheet: isBottomSheet,
        phoneNumber: _phoneNumber,
      );
    } catch (e) {
      setError('Something went wrong. Please try again.');
      notifyListeners();
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