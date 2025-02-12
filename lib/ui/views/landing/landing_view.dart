import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'landing_viewmodel.dart';
import 'widgets/menu_item.dart';

class LandingView extends StackedView<LandingViewModel> {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, LandingViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              height: viewModel.isLoggedIn ? 118 : 48,
              color: const Color(0xFFF4F4F4),
              padding: const EdgeInsets.all(12),
              child: viewModel.isLoggedIn 
                ? _buildLoggedInHeader(context, viewModel)
                : _buildLoggedOutHeader(context, viewModel),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    
                    // Buttons Section
                    viewModel.isLoggedIn 
                      ? _buildSellButton(context)
                      : _buildAuthButtons(context, viewModel),

                    const Spacer(),

                    // Menu Grid
                    _buildMenuGrid(context, viewModel),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoggedInHeader(BuildContext context, LandingViewModel viewModel) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 42,
              height: 20,
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: viewModel.onBackPressed,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                'assets/images/user.png',
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.userName ?? 'User',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    letterSpacing: -1,
                  ),
                ),
                Text(
                  'Joined: ${viewModel.joinDate ?? 'Unknown'}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFABABAB),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoggedOutHeader(BuildContext context, LandingViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 42,
          height: 20,
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: viewModel.onBackPressed,
        ),
      ],
    );
  }

  Widget _buildAuthButtons(BuildContext context, LandingViewModel viewModel) {
    return Column(
      children: [
        _buildButton(
          'Login/SignUp',
          onPressed: viewModel.navigateToLogin,
          color: const Color(0xFF3E468F),
          textColor: Colors.white,
        ),
        const SizedBox(height: 10),
        _buildSellButton(context),
      ],
    );
  }

  Widget _buildSellButton(BuildContext context) {
    return _buildButton(
      'Sell Your Phone',
      onPressed: () {},
      color: const Color(0xFFF6C018),
      textColor: Colors.black,
    );
  }

  Widget _buildButton(
    String text, {
    required VoidCallback onPressed,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      width: 279,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context, LandingViewModel viewModel) {
    final menuItems = viewModel.isLoggedIn
        ? [
            ('How to Buy', 'assets/icons/how_to_buy.png', viewModel.onHowToBuyTap),
            ('How to Sell', 'assets/icons/how_to_sell.png', viewModel.onHowToSellTap),
            ('FAQs', 'assets/icons/faqs.png', viewModel.onFAQsTap),
            ('About Us', 'assets/icons/about_us.png', viewModel.onAboutUsTap),
            ('Privacy Policy', 'assets/icons/privacy_policy.png', viewModel.onPrivacyPolicyTap),
            ('Return Policy', 'assets/icons/return_policy.png', viewModel.onReturnPolicyTap),
          ]
        : [
            ('How to Buy', 'assets/icons/how_to_buy.png', viewModel.onHowToBuyTap),
            ('How to Sell', 'assets/icons/how_to_sell.png', viewModel.onHowToSellTap),
            ('Oru Guide', 'assets/icons/oru_guide.png', viewModel.onOruGuideTap),
            ('About Us', 'assets/icons/about_us.png', viewModel.onAboutUsTap),
            ('Privacy Policy', 'assets/icons/privacy_policy.png', viewModel.onPrivacyPolicyTap),
            ('FAQs', 'assets/icons/faqs.png', viewModel.onFAQsTap),
          ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: menuItems.take(3).map((item) => MenuItem(
            title: item.$1,
            iconPath: item.$2,
            onTap: item.$3,
            scaleFactor: 1,
          )).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: menuItems.skip(3).map((item) => MenuItem(
            title: item.$1,
            iconPath: item.$2,
            onTap: item.$3,
            scaleFactor: 1,
          )).toList(),
        ),
      ],
    );
  }

  @override
  LandingViewModel viewModelBuilder(BuildContext context) => LandingViewModel();
} 