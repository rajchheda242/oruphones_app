import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'landing_viewmodel.dart';
import 'widgets/menu_grid_item.dart';
import 'widgets/menu_item.dart';

class LandingView extends StackedView<LandingViewModel> {
  const LandingView({Key? key}) : super(key: key);

  // Figma reference dimensions
  static const double figmaWidth = 311.0;
  static const double figmaHeight = 844.0;

  @override
  Widget builder(
    BuildContext context,
    LandingViewModel viewModel,
    Widget? child,
  ) {
    final screenSize = MediaQuery.of(context).size;
    final scaleWidth = screenSize.width / figmaWidth;
    final scaleHeight = screenSize.height / figmaHeight;
    
    double scaled(double size, {bool width = true}) {
      return size * (width ? scaleWidth : scaleHeight);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Banner Frame 1000001972
            Container(
              width: screenSize.width,
              height: scaled(48.0, width: false), // Fixed height from Figma
              color: const Color(0xFFF4F4F4),
              child: Center(
                child: SizedBox(
                  width: scaled(figmaWidth),
                  child: Padding(
                    padding: EdgeInsets.all(scaled(12.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: scaled(42.0),
                          height: scaled(20.0, width: false),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SizedBox(
                            width: scaled(24.0),
                            height: scaled(24.0),
                            child: Icon(
                              Icons.close,
                              size: scaled(24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Center(
                child: Container(
                  width: scaled(figmaWidth),
                  padding: EdgeInsets.symmetric(
                    vertical: scaled(12.0, width: false),
                  ),
                  child: Column(
                    children: [
                      // Frame 1000001973
                      Container(
                        height: scaled(168.0, width: false),
                        child: Column(
                          children: [
                            SizedBox(height: scaled(24.0, width: false)),
                            
                            // Buttons Container
                            Container(
                              height: scaled(96.0, width: false),
                              padding: EdgeInsets.symmetric(
                                horizontal: scaled(16.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Login/SignUp Button
                                  Container(
                                    width: scaled(279.0),
                                    height: scaled(43.0, width: false),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3E468F),
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x3310227B),
                                          blurRadius: 12,
                                          offset: Offset(0, 4),
                                        ),
                                        BoxShadow(
                                          color: Color(0x3304139C),
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          vertical: scaled(10.0, width: false),
                                          horizontal: scaled(20.0),
                                        ),
                                      ),
                                      child: Text(
                                        'Login/SignUp',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: scaled(15.0),
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: scaled(10.0, width: false)),

                                  // Sell Your Phone Button
                                  Container(
                                    width: scaled(279.0),
                                    height: scaled(43.0, width: false),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF6C018),
                                      borderRadius: BorderRadius.circular(1000),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x33737B10),
                                          blurRadius: 12,
                                          offset: Offset(0, 4),
                                        ),
                                        BoxShadow(
                                          color: Color(0x33A8AB18),
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          vertical: scaled(10.0, width: false),
                                          horizontal: scaled(20.0),
                                        ),
                                      ),
                                      child: SizedBox(
                                        width: scaled(117.0),
                                        height: scaled(23.0, width: false),
                                        child: Center(
                                          child: Text(
                                            'Sell Your Phone',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontSize: scaled(15.0),
                                              fontWeight: FontWeight.w500,
                                              height: 1.5,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Bottom frame
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: scaled(16.0),
                          vertical: scaled(8.0, width: false),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // First row of items
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MenuItem(
                                  title: 'How to Buy',
                                  iconPath: 'assets/icons/how_to_buy.png',
                                  onTap: () {},
                                  scale: scaleWidth,
                                ),
                                MenuItem(
                                  title: 'How to Sell',
                                  iconPath: 'assets/icons/how_to_sell.png',
                                  onTap: () {},
                                  scale: scaleWidth,
                                ),
                                MenuItem(
                                  title: 'Oru Guide',
                                  iconPath: 'assets/icons/oru_guide.png',
                                  onTap: () {},
                                  scale: scaleWidth,
                                ),
                              ],
                            ),

                            SizedBox(height: scaled(12.0, width: false)),

                            // Second row of items
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MenuItem(
                                  title: 'About Us',
                                  iconPath: 'assets/icons/about_us.png',
                                  onTap: () {},
                                  scale: scaleWidth,
                                ),
                                MenuItem(
                                  title: 'Privacy Policy',
                                  iconPath: 'assets/icons/privacy_policy.png',
                                  onTap: () {},
                                  scale: scaleWidth,
                                ),
                                MenuItem(
                                  title: 'FAQs',
                                  iconPath: 'assets/icons/faqs.png',
                                  onTap: () {},
                                  scale: scaleWidth,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LandingViewModel viewModelBuilder(BuildContext context) => LandingViewModel();
} 