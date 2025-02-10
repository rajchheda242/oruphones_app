import 'package:stacked/stacked.dart';

class PhoneInputViewModel extends BaseViewModel {
  String _phoneNumber = '';
  bool _termsAccepted = false;
  String? _error;

  String get phoneNumber => _phoneNumber;
  bool get termsAccepted => _termsAccepted;
  
  bool get canProceed => _phoneNumber.length >= 10 && _termsAccepted;
  String? getError() => _error;

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setTermsAccepted(bool? value) {
    _termsAccepted = value ?? false;
    notifyListeners();
  }

  Future<void> validateAndProceed() async {
    try {
      setBusy(true);
      if (_phoneNumber.length != 10) {
        _error = 'Please enter a valid phone number';
        notifyListeners();
        return;
      }
      // API call and navigation logic
    } catch (e) {
      _error = 'Something went wrong. Please try again.';
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }
} 