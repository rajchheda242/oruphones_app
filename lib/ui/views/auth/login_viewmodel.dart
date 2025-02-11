import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../services/auth_service.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../ui/views/auth/verify_otp_view.dart';
import 'dart:async';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final phoneController = TextEditingController();
  bool _acceptedTerms = false;
  final bool isBottomSheet;
  final List<TextEditingController> otpControllers;
  int _resendTime = 30;
  Timer? _timer;

  LoginViewModel({this.isBottomSheet = false})
      : otpControllers = List.generate(4, (_) => TextEditingController()) {
    _startResendTimer();
  }

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

  bool get canResend => _resendTime == 0;
  int get resendTime => _resendTime;

  bool get canVerify => otpControllers.every((controller) => 
    controller.text.length == 1) && !isBusy;

  void setAcceptedTerms(bool? value) {
    _acceptedTerms = value ?? false;
    notifyListeners();
  }

  @override
  void setError(dynamic message) {
    super.setError(message);
    notifyListeners();
  }

  void _startResendTimer() {
    _timer?.cancel();
    _resendTime = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTime > 0) {
        _resendTime--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> resendOtp() async {
    if (!canResend) return;
    
    try {
      setBusy(true);
      // API call to resend OTP would go here
      _startResendTimer();
    } catch (e) {
      setError('Failed to resend OTP');
    } finally {
      setBusy(false);
    }
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

  void onOtpDigitChanged(int index, String value, BuildContext context) {
    if (value.length == 1) {
      if (index < 3) {
        // Move to next field
        FocusScope.of(context).nextFocus();
      } else {
        // Last field, hide keyboard
        FocusScope.of(context).unfocus();
      }
    } else if (value.isEmpty && index > 0) {
      // Move to previous field
      FocusScope.of(context).previousFocus();
    }
  }

  void goBack() {
    if (isBottomSheet) {
      _navigationService.back();
    }
  }

  Future<void> verifyOtp() async {
    try {
      setBusy(true);
      final otp = otpControllers.map((c) => c.text).join();
      // TODO: Add API call to verify OTP
      await _navigationService.navigateToConfirmNameView();
    } catch (e) {
      setError('Failed to verify OTP');
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }
}
