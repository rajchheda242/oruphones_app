import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StackedView<LoginViewModel> {
  final bool isBottomSheet;
  final String phoneNumber;

  const LoginView({
    Key? key,
    this.isBottomSheet = false,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                color: Color(0xFFFFFFFF),
                width: 358,
                height: 775,
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    SizedBox(height: 49),
                    Container(
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
                              errorBuilder: (context, error, stackTrace) {
                                print('Error loading logo: $error');
                                return Container(
                                  width: 116,
                                  height: 61,
                                  color: Colors.red,
                                  child: Center(child: Text('Logo Error')),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 60),
                          Text(
                            'Verify Mobile No.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              height: 44.24/28,
                              letterSpacing: 0,
                              color: Color(0xFF3E468F),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
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
                                  color: Color(0xFF757474),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Please enter the 4 digital verification code sent to your mobile number ',
                                  ),
                                  TextSpan(
                                    text: '+91-$phoneNumber',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(text: ' via SMS'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32), // Space after header
                    Container(
                      width: 198,  // Updated to match Frame 1000001957
                      height: 150, // Updated to match Frame 1000001957
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) {
                          return Container(
                            width: 40,  // Adjusted for 4 boxes with spacing
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color(0xFFE5E7EB),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: viewModel.otpControllers[index],
                                onChanged: (value) => viewModel.onOtpDigitChanged(index, value, context),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF282828),
                                ),
                                decoration: InputDecoration(
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
                    SizedBox(height: 60),  // Gap specified in Frame 1000001957
                    Container(
                      width: 160,  // Frame 1000001840 width
                      height: 46,  // Frame 1000001840 height
                      child: Column(
                        children: [
                          Container(
                            width: 138,
                            height: 25,
                            child: Text(
                              'Didn\'t receive OTP?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(  // Changed to Montserrat
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 25.2/14,
                                letterSpacing: 0,
                                color: Color(0xFF757474),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),  // Gap from Frame 1000001821
                          Container(
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
                                viewModel.resendTime > 0
                                  ? 'Resend OTP in ${viewModel.resendTime} Sec'
                                  : 'Resend OTP',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 21/14,
                                  letterSpacing: 0,
                                  color: Color(0xFF191919),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60),  // After previous section
                    Container(
                      width: 358,  // Fill (358px)
                      height: 51,  // Hug (51px)
                      decoration: BoxDecoration(
                        color: Color(0xFF3F3E8F),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Color(0xFFB1B1B1),
                          width: 1,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: viewModel.canVerify ? viewModel.verifyOtp : null,
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
                                    height: 27/18,  // Line height 27px
                                    letterSpacing: 0,
                                    color: Color(0xFFFFFFFF),  // #FFFFFF
                                  ),
                                ),
                                SizedBox(width: 10),  // Gap 10px
                                Icon(
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
              Positioned(
                top: 24,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => viewModel.goBack(),
                  color: Color(0xFF3F3E8F),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
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
  LoginViewModel viewModelBuilder(BuildContext context) =>
      LoginViewModel(isBottomSheet: isBottomSheet);
}
