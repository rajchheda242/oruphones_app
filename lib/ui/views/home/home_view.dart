import 'package:flutter/material.dart';
import 'package:oruphones_app/ui/widgets/gradient_box_border.dart';
import 'package:oruphones_app/ui/widgets/product_card.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_viewmodel.dart';
import 'widgets/home_menu_bar.dart';
import 'widgets/phone_nav_button.dart';
import 'widgets/phone_banners.dart';
import 'widgets/other_menu.dart';
import 'widgets/top_brands.dart';
import 'widgets/best_deals_section.dart';
import 'dart:math' show pi;
import 'widgets/faq_item.dart';
import 'widgets/qr_code_frame.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // FIXED section
          Container(
            width: 390,
            margin: const EdgeInsets.only(top: 47),
            child: HomeMenuBar(
              onNotificationsTap: viewModel.onNotificationsTap,
            ),
          ),
          
          // SCROLLS section
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Search Bar
                  Container(
                    width: 358,
                    height: 47,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                    decoration: BoxDecoration(
                      color: const Color(0x80FFFFFF),
                      borderRadius: BorderRadius.circular(11.63),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 1,
                      ),
                    ),
                    child: _buildSearchBar(context, viewModel),
                  ),

                  // Scrollable buttons
                  _buildScrollableButtons(viewModel),

                  const SizedBox(height: 24),

                  // Other Menu
                  const OtherMenu(completer: null),

                  const SizedBox(height: 28),

                  // Top Brands
                  const TopBrands(),

                  const SizedBox(height: 28),

                  // Best Deals Section
                  BestDealsSection(
                    onSortTap: viewModel.onSortTap,
                    onFilterTap: viewModel.onFilterTap,
                  ),

                  // FAQ Section
                  Container(
                    width: 358,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildFAQSection(viewModel),
                  ),

                  // Notification Section
                  Container(
                    width: 390,
                    height: 222,
                    margin: const EdgeInsets.only(top: 28),
                    padding: const EdgeInsets.fromLTRB(30, 49, 30, 49),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF6C018),
                    ),
                    child: _buildNotificationSection(),
                  ),

                  // Download App Section
                  Container(
                    width: 390,
                    height: 341,
                    padding: const EdgeInsets.fromLTRB(26.5, 22, 26.5, 30),
                    decoration: const BoxDecoration(
                      color: Color(0xFF363636),
                    ),
                    child: Container(
                      width: 337,
                      height: 289,
                      child: Column(
                        children: [
                          Text(
                            'Download App',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 30/20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              QRCodeFrame(
                                isPlayStore: true,
                              ),
                              QRCodeFrame(
                                isPlayStore: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Invite a Friend section
                  Container(
                    width: 390,
                    height: 450,  // Main frame height
                    child: Stack(
                      children: [
                        // Black background frame
                        Positioned(
                          top: -0.01,  // As per Figma
                          child: Container(
                            width: 390,
                            height: 237,  // Black background height
                            color: const Color(0xFF363636),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 28.85),
                              child: Text(
                                'Invite a Friend',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 28/20,
                                  letterSpacing: -0.005,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        // White rounded container
                        Positioned(
                          top: 81.47,
                          left: 44,
                          child: Container(
                            width: 308,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  blurRadius: 12,
                                  color: Color(0x1A787878),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 22),
                                  blurRadius: 22,
                                  color: Color(0x17787878),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 49),
                                  blurRadius: 29,
                                  color: Color(0x0D787878),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 87),
                                  blurRadius: 35,
                                  color: Color(0x03787878),
                                ),
                                BoxShadow(
                                  offset: Offset(0, 136),
                                  blurRadius: 38,
                                  color: Color(0x00787878),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Invite a friend to ORUphones application.\nTap to copy the respective download link\nto the clipboard',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 17.28/12,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                // Store buttons
                                GestureDetector(
                                  onTap: () => viewModel.launchStoreUrl('https://play.google.com/store/search?q=oruphones&c=apps&hl=en_US'),
                                  child: Image.asset(
                                    'assets/images/PlayStore_download_button.png',
                                    width: 166.23,
                                    height: 55.41,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                GestureDetector(
                                  onTap: () => viewModel.launchStoreUrl('https://apps.apple.com/in/app/oruphones-sell-used-phones/id1629378420'),
                                  child: Image.asset(
                                    'assets/images/AppStore_download_button.png',
                                    width: 166.23,
                                    height: 55.41,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Or Share section
                        Positioned(
                          top: 340.01,
                          left: 70,
                          child: Container(
                            width: 251,
                            height: 76.16,
                            child: Column(
                              children: [
                                Text(
                                  'Or Share',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    height: 16.8/12,
                                    letterSpacing: -0.005,
                                    color: const Color(0xFF363636),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 19),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildSocialIcon('instagram', viewModel.onInstagramShare),
                                    const SizedBox(width: 30),
                                    _buildSocialIcon('telegram', viewModel.onTelegramShare),
                                    const SizedBox(width: 30),
                                    _buildSocialIcon('twitter', viewModel.onTwitterShare),
                                    const SizedBox(width: 30),
                                    _buildSocialIcon('whatsapp', viewModel.onWhatsAppShare),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods for building sections...
  Widget _buildSearchBar(BuildContext context, HomeViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Search icon and text
        Expanded(
          child: GestureDetector(
            onTap: () => viewModel.onSearchTap(context),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/search.png',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 7),
                Text(
                  'Search phones with make, model...',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 18/12,
                    color: const Color(0xFF707070),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Divider and mic
        Row(
          children: [
            Text(
              '|',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 16.94/14,
                letterSpacing: -1.41,
                color: const Color(0xFF707070),
              ),
            ),
            const SizedBox(width: 3.77),
            GestureDetector(
              onTap: viewModel.onMicTap,
              child: Image.asset(
                'assets/icons/mic.png',
                width: 16,
                height: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScrollableButtons(HomeViewModel viewModel) {
    return Column(
      children: [
        SizedBox(
          width: 358,
          height: 36,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PhoneNavButton(
                  text: 'Sell Used Phones',
                  onTap: () => viewModel.onSellUsedPhonesTap(),
                ),
                const SizedBox(width: 8),
                PhoneNavButton(
                  text: 'Buy Used Phones',
                  onTap: () => viewModel.onBuyUsedPhonesTap(),
                ),
                const SizedBox(width: 8),
                PhoneNavButton(
                  text: 'Compare Prices',
                  onTap: () => viewModel.onComparePricesTap(),
                ),
                const SizedBox(width: 8),
                PhoneNavButton(
                  text: 'My Profile',
                  onTap: () => viewModel.onMyProfileTap(),
                ),
                const SizedBox(width: 8),
                PhoneNavButton(
                  text: 'My Listings',
                  onTap: () => viewModel.onMyListingsTap(),
                ),
                const SizedBox(width: 8),
                PhoneNavButton(
                  text: 'Services',
                  onTap: () => viewModel.onServicesTap(),
                ),
                const SizedBox(width: 8),
                PhoneNavButton(
                  text: 'Register your Store',
                  onTap: () => viewModel.onRegisterStoreTap(),
                  tag: 'new',
                ),
                const SizedBox(width: 8),
                PhoneNavButton(
                  text: 'Get the App',
                  onTap: () => viewModel.onGetAppTap(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Phone Banners
        const PhoneBanners(),
      ],
    );
  }

  Widget _buildFAQSection(HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // FAQ Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Frequently Asked Questions',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 24.3/18,
                letterSpacing: -0.01,
                color: const Color(0xFF282828),
              ),
            ),
            Image.asset(
              'assets/icons/right_arrow.png',
              width: 24,
              height: 24,
            ),
          ],
        ),
        const SizedBox(height: 16),
        // FAQ List
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final questions = [
              'Why should you buy used phones on ORUphones?',
              'How to sell phone on OruPhones ?',
              'Why should you buy used phones on ORUphones?',
            ];
            final answers = [
              'Answer for why to buy...',
              '''You can sell used phones online through ORUphones in 3 easy steps.

Step 1: Add your Device
Click on the "Sell Now" button available at the top right corner of the ORUphones homepage, select your location, enter the mobile details on the listing page, and enter your expected price for the device.

Step 2: Device Verification
After listing your device, we recommend you verify your device to sell it quickly. To verify your device, download the ORUphones app on the device you want to sell. Follow the simple instructions in the app & perform diagnostics to complete the verification process. After verification, a "verified" badge will be displayed along with your listing.

Step 3: Get Cash
You will start receiving offers for your listing. If the offer is right, you can arrange a meet-up with the buyer at a secure location. The buyer will go through a buyer verification process on the ORUphones app & if satisfied you can conclude the deal and get instant payment from the buyer directly.''',
              'Answer for why to buy...',
            ];
            return FAQItem(
              question: questions[index],
              answer: answers[index],
              isExpanded: viewModel.expandedFAQIndex == index,
              onTap: () {
                viewModel.toggleFAQ(index);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildNotificationSection() {
    return Column(
      children: [
        Container(
          width: 369,
          height: 56,
          child: Text(
            'Get Notified About Our \nLatest Offers and Price Drops',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 28/20,
              letterSpacing: -0.005,
              color: const Color(0xFF000000),
            ),
          ),
        ),
        const SizedBox(height: 25),
        Container(
          width: 259,
          height: 43,
          padding: const EdgeInsets.fromLTRB(21, 7, 7, 7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(72),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 130,
                height: 18,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email here',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 18/12,
                      color: const Color(0xFFA8A8A8),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add send functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF363636),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(75, 29),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(43),
                  ),
                ),
                child: Text(
                  'Send',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 18/12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String iconName, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/icons/$iconName.png',
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
