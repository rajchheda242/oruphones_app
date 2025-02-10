import 'package:stacked/stacked.dart';

class PhoneInputViewModel extends BaseViewModel {
  String _phoneNumber = '';
  bool _termsAccepted = false;

  String get phoneNumber => _phoneNumber;
  bool get termsAccepted => _termsAccepted;
  
  bool get canProceed => _phoneNumber.length >= 10 && _termsAccepted;

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setTermsAccepted(bool? value) {
    _termsAccepted = value ?? false;
    notifyListeners();
  }
} 