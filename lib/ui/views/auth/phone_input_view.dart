import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_view.dart';
import 'phone_input_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneInputView extends StackedView<PhoneInputViewModel> {
  const PhoneInputView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, PhoneInputViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            color: Color(0xFFFFFFFF), // #FFFFFF background color
            width: 358, // Frame 1514 fixed width
            height: 775, // Frame 1514 fixed height
            margin: const EdgeInsets.only(left: 16), // Left margin 16px
            padding: const EdgeInsets.symmetric(vertical: 24), // Top and Bottom padding 24px
            child: Column(
              children: [
                SizedBox(height: 49), // Initial padding for first element
                Container(
                  width: 136, // Frame 1000001956 width
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 116,
                        height: 61,
                      ),
                      SizedBox(height: 60), // Gap of 60px between logo and welcome text
                      Container(
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
                                color: Color(0xFF3F3E8F),
                              ),
                            ),
                            Container(
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
                                  color: Color(0xFF707070),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100), // Gap from Frame 1514
                Container(
                  width: 358, // Frame 1000001841 full width
                  height: 71, // Frame 1000001841 height
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 153,
                        height: 19,
                        child: Text(
                          'Enter Your Phone Number',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 18.96/12,
                            letterSpacing: 0,
                            color: Color(0xFF282828),
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
                          color: Color(0xFFFFFFFF),
                          border: Border.all(
                            color: Color(0xFFCCCCCC),
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
                                color: Color(0xFF282828),
                              ),
                            ),
                            SizedBox(width: 10), // Gap of 10px
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Mobile Number',
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF282828),
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
                SizedBox(height: 100), // Gap from Frame 1514
                Container(
                  width: 358, // Frame 1000001825 width (fill)
                  height: 89, // Frame 1000001825 height (hug)
                  child: Column(
                    children: [
                      Container(
                        width: 358, // Frame 1000001821 width
                        height: 22, // Frame 1000001821 height
                        child: Row(
                          children: [
                            Container(
                              width: 19,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                border: Border.all(
                                  color: Color(0xFFABABAB),
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
                      SizedBox(height: 16), // Gap between Frame 1000001821 and 1000001824
                      Container(
                        width: 358,
                        height: 51,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 160,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF3F3E8F),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Color(0xFFB1B1B1),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 27/18,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward,
                              size: 24,
                              color: Color(0xFFFFFFFF),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Rest of the content will be added later
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  PhoneInputViewModel viewModelBuilder(BuildContext context) => PhoneInputViewModel();
} 