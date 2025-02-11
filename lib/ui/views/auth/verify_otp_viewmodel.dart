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
      final authService = locator<AuthService>();
      await authService.generateOtp(
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

  Future<void> verifyOtp() async {
    if (!canVerify) return;

    try {
      setBusy(true);
      final otp = int.parse(otpControllers.map((c) => c.text).join());

      final authService = locator<AuthService>();
      final result = await authService.validateOtp(
        countryCode: 91,
        mobileNumber: int.parse(phoneNumber),
        otp: otp,
      );

      if (!result.success) {
        setError(result.error ?? 'Verification failed');
        return;
      }

      final authResponse = result.data!;
      if (authResponse.user.name.isEmpty) {
        _navigationService.replaceWith(Routes.confirmNameView);
      } else {
        _navigationService.replaceWith(Routes.homeView);
      }
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
    }
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
