import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_view.dart';
import 'phone_input_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneInputView extends StackedView<PhoneInputViewModel> {
  final bool isBottomSheet;
  
  const PhoneInputView({
    Key? key,
    this.isBottomSheet = false,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, PhoneInputViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                color: const Color(0xFFFFFFFF), // #FFFFFF background color
                width: 358, // Frame 1514 fixed width
                height: 775, // Frame 1514 fixed height
                margin: const EdgeInsets.only(left: 16), // Left margin 16px
                padding: const EdgeInsets.symmetric(vertical: 24), // Top and Bottom padding 24px
                child: Column(
                  children: [
                    const SizedBox(height: 49), // Initial padding for first element
                    SizedBox(
                      width: 136, // Frame 1000001956 width
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 116,
                            height: 61,
                          ),
                          const SizedBox(height: 60), // Gap of 60px between logo and welcome text
                          SizedBox(
                            width: 136,
                            height: 66,
                            child: Column(
                              children: [
                                Text(
                                  'Welcome',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    height: 44.24/28,
                                    letterSpacing: 0,
                                    color: const Color(0xFF3F3E8F),
                                  ),
                                ),
                                SizedBox(
                                  width: 130,
                                  height: 22,
                                  child: Text(
                                    'Sign in to continue',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      height: 22.12/14, // line height 22.12px
                                      letterSpacing: 0, // 0% letter spacing
                                      color: const Color(0xFF707070),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100), // Gap from Frame 1514
                    SizedBox(
                      width: 358, // Frame 1000001841 full width
                      height: 71, // Frame 1000001841 height
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 153,
                            height: 19,
                            child: Text(
                              'Enter Your Phone Number',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 18.96/12,
                                letterSpacing: 0,
                                color: const Color(0xFF282828),
                              ),
                            ),
                          ),
                          Container(
                            width: 358,
                            height: 52,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              border: Border.all(
                                color: const Color(0xFFCCCCCC),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '+91',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF282828),
                                  ),
                                ),
                                const SizedBox(width: 10), // Gap of 10px
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Mobile Number',
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      errorText: viewModel.error('phone'),
                                    ),
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF282828),
                                    ),
                                    keyboardType: TextInputType.phone,
                                    onChanged: viewModel.setPhoneNumber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100), // Gap from Frame 1514
                    SizedBox(
                      width: 358, // Frame 1000001825 width (fill)
                      height: 89, // Frame 1000001825 height (hug)
                      child: Column(
                        children: [
                          SizedBox(
                            width: 358, // Frame 1000001821 width
                            height: 22, // Frame 1000001821 height
                            child: Row(
                              children: [
                                Container(
                                  width: 19,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    border: Border.all(
                                      color: const Color(0xFFABABAB),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Checkbox(
                                    value: viewModel.termsAccepted,
                                    onChanged: viewModel.setTermsAccepted,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Accept ',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 21/14,
                                          letterSpacing: 0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Terms and condition',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 21/14,
                                          letterSpacing: 0,
                                          color: Colors.black,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle terms and conditions tap
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16), // Gap between Frame 1000001821 and 1000001824
                          Container(
                            width: 358,
                            height: 51,
                            decoration: BoxDecoration(
                              color: viewModel.canProceed 
                                ? const Color(0xFF3F3E8F)
                                : const Color(0xFF3F3E8F).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xFFB1B1B1),
                                width: 1,
                              ),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: viewModel.canProceed 
                                  ? () => viewModel.navigateToOtpScreen()
                                  : null,
                                borderRadius: BorderRadius.circular(4),
                                child: Center(
                                  child: viewModel.isBusy
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Next',
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              height: 27/18,
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const Icon(
                                            Icons.arrow_forward,
                                            size: 24,
                                            color: Color(0xFFFFFFFF),
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
                    // Rest of the content will be added later
                  ],
                ),
              ),
              Positioned(
                top: 24,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => viewModel.onClosePressed(),
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
                  onPressed: () => viewModel.onBackPressed(),
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
  PhoneInputViewModel viewModelBuilder(BuildContext context) => 
    PhoneInputViewModel(isBottomSheet: isBottomSheet);
} 