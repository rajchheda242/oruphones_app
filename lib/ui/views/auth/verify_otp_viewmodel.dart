import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';

class VerifyOtpViewModel extends BaseViewModel {
  final String phoneNumber;
  final List<TextEditingController> otpControllers;
  int _resendTime = 30;
  Timer? _timer;
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  VerifyOtpViewModel(this.phoneNumber)
      : otpControllers = List.generate(4, (_) => TextEditingController()) {
    _startResendTimer();
  }

  bool get canResend => _resendTime == 0;
  int get resendTime => _resendTime;

  bool get canVerify => otpControllers.every((c) => c.text.isNotEmpty);

  void _startResendTimer() {
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
      await _authService.generateOtp(
        countryCode: 91,
        mobileNumber: int.parse(phoneNumber),
      );

      _resendTime = 30;
      _startResendTimer();
      notifyListeners();
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> onVerifyPressed() async {
    if (!canVerify) return;
    
    try {
      setBusy(true);
      final otp = int.parse(otpControllers.map((c) => c.text).join());
      final response = await _authService.validateOtp(
        countryCode: 91,
        mobileNumber: int.parse(phoneNumber),
        otp: otp,
      );

      if (response.success && response.data != null) {
        _authService.updateAuthState(response.data!);
        
        print('OTP Validation Response: ${response.data?.isAuthenticated}');
        print('User name: ${response.data?.user.name}');

        if (response.data!.user.name.isEmpty) {
          await _navigationService.clearStackAndShow(Routes.confirmNameView);
        } else {
          await _navigationService.clearStackAndShow(Routes.homeView);
        }
      } else {
        setError(response.error ?? 'Verification failed');
      }
    } catch (e) {
      print('Error during verification: $e');
      setError('Verification failed: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  void onBackPressed() {
    _navigationService.back();
  }

  void onClosePressed() {
    _navigationService.clearStackAndShow(Routes.landingView);
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
