import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'verify_otp_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOtpView extends StackedView<VerifyOtpViewModel> {
  final bool isBottomSheet;
  final String phoneNumber;

  const VerifyOtpView({
    Key? key,
    this.isBottomSheet = false,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, VerifyOtpViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                color: const Color(0xFFFFFFFF),
                width: 358,
                height: 775,
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 49),
                    // Logo and Header Section
                    SizedBox(
                      width: 343,
                      height: 273,
                      child: Column(
                        children: [
                          Container(
                            width: 116,
                            height: 61,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 116,
                              height: 61,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 60),
                          Text(
                            'Verify Mobile No.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              height: 44.24/28,
                              letterSpacing: 0,
                              color: const Color(0xFF3E468F),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 343,
                            height: 51,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 25.2/14,
                                  letterSpacing: 0,
                                  color: const Color(0xFF757474),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Please enter the 4 digital verification code sent to your mobile number ',
                                  ),
                                  TextSpan(
                                    text: '+91-$phoneNumber',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const TextSpan(text: ' via SMS'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // OTP Input Section
                    SizedBox(
                      width: 198,
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) {
                          return Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xFFE5E7EB),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: viewModel.otpControllers[index],
                                onChanged: (value) {
                                  if (value.length == 1 && index < 3) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF282828),
                                ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Resend OTP Section
                    SizedBox(
                      width: 160,
                      height: 46,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 138,
                            height: 25,
                            child: Text(
                              'Didn\'t receive OTP?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 25.2/14,
                                letterSpacing: 0,
                                color: const Color(0xFF757474),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 160,
                            height: 21,
                            child: TextButton(
                              onPressed: viewModel.canResend ? viewModel.resendOtp : null,
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Resend OTP in ${viewModel.resendTime} Sec',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 21/14,
                                  letterSpacing: 0,
                                  color: const Color(0xFF191919),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    // Verify Button
                    Container(
                      width: 358,
                      height: 51,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3F3E8F),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xFFB1B1B1),
                          width: 1,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: viewModel.canVerify ? viewModel.onVerifyPressed : null,
                          borderRadius: BorderRadius.circular(4),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Verify OTP',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 27/18,
                                    letterSpacing: 0,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.arrow_forward,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Back and Close buttons
              Positioned(
                top: 24,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: viewModel.onClosePressed,
                  color: const Color(0xFF3F3E8F),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 24,
                ),
              ),
              Positioned(
                top: 24,
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: viewModel.onBackPressed,
                  color: const Color(0xFF3F3E8F),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  VerifyOtpViewModel viewModelBuilder(BuildContext context) => VerifyOtpViewModel(phoneNumber);
}
