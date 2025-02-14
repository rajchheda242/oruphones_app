import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'verify_otp_viewmodel.dart';

class VerifyOtpView extends StackedView<VerifyOtpViewModel> {
  final bool isBottomSheet;
  final String phoneNumber;

  const VerifyOtpView({
    Key? key,
    this.isBottomSheet = false,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, VerifyOtpViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: viewModel.onBackPressed,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: viewModel.onClosePressed,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isBottomSheet
              ? const BorderRadius.vertical(top: Radius.circular(16))
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            _buildLogo(),
            const SizedBox(height: 40),
            _buildTitle(),
            const SizedBox(height: 16),
            _buildOtpDescription(),
            const SizedBox(height: 40),
            _buildOtpInput(viewModel, context),
            const SizedBox(height: 24),
            _buildResendOtp(viewModel),
            const Spacer(),
            _buildVerifyButton(viewModel),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() => Image.asset('assets/images/logo.png', height: 60);

  Widget _buildTitle() => const Text(
        'Verify Mobile No.',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1F2937),
        ),
      );

  Widget _buildOtpDescription() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          'Please enter the 4 digit verification code sent\nto your mobile number +$phoneNumber via SMS',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
        ),
      );

  Widget _buildOtpInput(VerifyOtpViewModel viewModel, BuildContext context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: TextFormField(
              controller: viewModel.otpControllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              maxLength: 1,
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF4318FF)),
                ),
              ),
              onChanged: (value) {
                if (value.length == 1 && index < 3) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          ),
        ),
      );

  Widget _buildResendOtp(VerifyOtpViewModel viewModel) => Column(
        children: [
          const Text(
            "Didn't receive OTP?",
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: viewModel.canResend ? viewModel.resendOtp : null,
            child: Text(
              'Resend OTP in ${viewModel.resendTime} Sec',
              style: TextStyle(
                color: viewModel.canResend ? const Color(0xFF4318FF) : const Color(0xFF6B7280),
                fontSize: 14,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      );

  Widget _buildVerifyButton(VerifyOtpViewModel viewModel) => SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: viewModel.canVerify ? viewModel.onVerifyPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4318FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: viewModel.isBusy
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
        ),
      );

  @override
  VerifyOtpViewModel viewModelBuilder(BuildContext context) =>
      VerifyOtpViewModel(phoneNumber);
}
