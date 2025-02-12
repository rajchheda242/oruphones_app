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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isBottomSheet
              ? const BorderRadius.vertical(top: Radius.circular(16))
              : null,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: isBottomSheet ? MainAxisSize.min : MainAxisSize.max,
            children: [
              if (isBottomSheet) _buildCloseButton(context, viewModel),
              _buildLogo(),
              _buildTitle(),
              _buildOtpDescription(),
              _buildOtpInput(viewModel, context),
              _buildResendOtp(viewModel),
              _buildVerifyButton(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context, VerifyOtpViewModel viewModel) => Align(
    alignment: Alignment.topLeft,
    child: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: viewModel.onBackPressed,
      
    ),
  );

  Widget _buildLogo() => Image.asset('assets/images/logo.png', height: 40);

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => SizedBox(
            width: 50,
            child: TextFormField(
              controller: viewModel.otpControllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: const InputDecoration(
                counterText: '',
                border: OutlineInputBorder(),
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

  Widget _buildResendOtp(VerifyOtpViewModel viewModel) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            const Text("Didn't receive OTP?"),
            TextButton(
              onPressed: viewModel.canResend ? viewModel.resendOtp : null,
              child: Text(
                'Resend OTP in ${viewModel.resendTime} sec',
                style: const TextStyle(color: Color(0xFF4318FF)),
              ),
            ),
          ],
        ),
      );

  Widget _buildVerifyButton(VerifyOtpViewModel viewModel) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: viewModel.canVerify ? viewModel.onVerifyPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4318FF),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: viewModel.isBusy
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
        ),
      );

  @override
  VerifyOtpViewModel viewModelBuilder(BuildContext context) =>
      VerifyOtpViewModel(phoneNumber);
}
