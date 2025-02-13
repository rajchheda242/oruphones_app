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

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 390,
              margin: const EdgeInsets.only(top: 47),
              child: HomeMenuBar(
                onNotificationsTap: viewModel.onNotificationsTap,
              ),
            ),
            Container(
              width: 390,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
              decoration: BoxDecoration(
                color: const Color(0xCCFFFFFF),
                backgroundBlendMode: BlendMode.srcOver,
              ),
              child: Column(
                children: [
                  Container(
                    width: 358,
                    margin: const EdgeInsets.only(top: 16),
                    child: Column(
                      children: [
                        Container(
                          width: 358,
                          height: 47,
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                          decoration: BoxDecoration(
                            color: const Color(0x80FFFFFF),
                            borderRadius: BorderRadius.circular(11.63),
                            border: Border.all(
                              color: const Color(0xFFE0E0E0),
                              width: 1,
                            ),
                          ),
                          child: Row(
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
                          ),
                        ),
                        // Space for scrollable buttons that will be added later
                        const SizedBox(height: 10),
                        // Scrollable buttons frame
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
                        const SizedBox(height: 10),
                        const PhoneBanners(),
                        const OtherMenu(completer: null,),
                        const SizedBox(height: 28),
                        const TopBrands(),
                        const SizedBox(height: 28),
                        BestDealsSection(
                          onSortTap: () {
                            viewModel.onSortTap();
                          },
                          onFilterTap: () {
                            viewModel.onFilterTap();
                          },
                        ),
                        const SizedBox(height: 16),
                        // Product Grid
                        Container(
                          width: 358,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 10,
                              childAspectRatio: 174/281,
                            ),
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              if ((index + 1) % 8 == 0) {
                                final adNumber = ((index ~/ 8) % 2) + 1;
                                return Container(
                                  width: 174,
                                  height: 292,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.16),
                                    color: const Color(0x12F6C018),
                                    border: GradientBoxBorder(
                                      gradient: const LinearGradient(
                                        begin: Alignment(0.0, 0.0),
                                        end: Alignment(0.0, 1.0),
                                        colors: [
                                          Color(0x00CFCFCF),
                                          Color(0xFFCFCFCF),
                                        ],
                                        stops: [0.2755, 0.9106],
                                        transform: GradientRotation(167.72 * pi / 180),
                                      ),
                                      width: 1.02,
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/ads/ad$adNumber.png',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      print('Failed to load ad$adNumber: $error');
                                      return Center(
                                        child: Text('Ad $adNumber'),
                                      );
                                    },
                                  ),
                                );
                              }
                              
                              final productIndex = index - (index ~/ 8);
                              
                              return ProductCard(
                                title: 'Apple iPhone 13 Pro',
                                storage: '256 GB',
                                condition: 'Like New',
                                price: 41500,
                                originalPrice: 81500,
                                location: 'Nijampur, Luc...',
                                date: 'July 25th',
                                imageUrl: 'assets/images/product.png',
                                isVerified: true,
                                isPriceNegotiable: true,
                                onTap: () => viewModel.onProductTap(),
                                onFavoriteTap: (isFavorite) => viewModel.onFavoriteTap(isFavorite),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
