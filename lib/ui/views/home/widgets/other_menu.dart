import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../home_viewmodel.dart';
import 'menu_button.dart';

class OtherMenu extends ViewModelWidget<HomeViewModel> {
  const OtherMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 28),
          child: Text(
            "What's on your mind?",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              height: 24.3/18,
              color: const Color(0xFF525252),
            ),
          ),
        ),
        const SizedBox(height: 0),
        SizedBox(
          height: 140,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                MenuButton(
                  iconName: 'buy_used_phones',
                  onTap: () => viewModel.onBuyUsedPhonesTap(),
                  // iconSize: 90,
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'sell_used_phones',
                  onTap: () => viewModel.onSellUsedPhonesTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'compare_prices',
                  onTap: () => viewModel.onComparePricesTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'my_profile',
                  onTap: () => viewModel.onMyProfileTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'my_listings',
                  onTap: () => viewModel.onMyListingsTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'open_store',
                  onTap: () => viewModel.onOpenStoreTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'services',
                  onTap: () => viewModel.onServicesTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'device_health_check',
                  onTap: () => viewModel.onDeviceHealthCheckTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'battery_health_check',
                  onTap: () => viewModel.onBatteryHealthCheckTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'imei_check',
                  onTap: () => viewModel.onImeiCheckTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'device_details',
                  onTap: () => viewModel.onDeviceDetailsTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'data_wipe',
                  onTap: () => viewModel.onDataWipeTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'under_warranty_phones',
                  onTap: () => viewModel.onUnderWarrantyPhonesTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'premium_phones',
                  onTap: () => viewModel.onPremiumPhonesTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'like_new_phones',
                  onTap: () => viewModel.onLikeNewPhonesTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'refurbished_phones',
                  onTap: () => viewModel.onRefurbishedPhonesTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'verified_phones',
                  onTap: () => viewModel.onVerifiedPhonesTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'my_negotiations',
                  onTap: () => viewModel.onMyNegotiationsTap(),
                ),
                const SizedBox(width: 16),
                MenuButton(
                  iconName: 'my_favourites',
                  onTap: () => viewModel.onMyFavouritesTap(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
} 