import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';
import '../landing/landing_view.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  void onMenuTap(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black26,
        pageBuilder: (context, animation, secondaryAnimation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: const LandingView(),
            ),
          );
        },
      ),
    );
  }

  void onSearchTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search phones with make, model...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11.63),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onMicTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(
        content: Text('Voice search coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void onSellUsedPhonesTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(
        content: Text('Sell Used Phones coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void onBuyUsedPhonesTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('Buy Used Phones coming soon!')),
    );
  }

  void onComparePricesTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('Compare Prices coming soon!')),
    );
  }

  void onMyProfileTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('My Profile coming soon!')),
    );
  }

  void onMyListingsTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('My Listings coming soon!')),
    );
  }

  void onServicesTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('Services coming soon!')),
    );
  }

  void onRegisterStoreTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('Register Store coming soon!')),
    );
  }

  void onGetAppTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('Get App coming soon!')),
    );
  }

  void onRepairPhonesTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('Repair Phones coming soon!')),
    );
  }

  void onAccessoriesTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('Accessories coming soon!')),
    );
  }

  void onRecyclePhonesTap() {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      const SnackBar(content: Text('Recycle Phones coming soon!')),
    );
  }

  void onBatteryHealthCheckTap() {
    _showSnackBar('Battery Health Check');
  }

  void onDataWipeTap() {
    _showSnackBar('Data Wipe');
  }

  void onDeviceDetailsTap() {
    _showSnackBar('Device Details');
  }

  void onDeviceHealthCheckTap() {
    _showSnackBar('Device Health Check');
  }

  void onImeiCheckTap() {
    _showSnackBar('IMEI Check');
  }

  void onLikeNewPhonesTap() {
    _showSnackBar('Like New Phones');
  }

  void onMyFavouritesTap() {
    _showSnackBar('My Favourites');
  }

  void onMyNegotiationsTap() {
    _showSnackBar('My Negotiations');
  }

  void onMyProfilesTap() {
    _showSnackBar('My Profiles');
  }

  void onOpenStoreTap() {
    _showSnackBar('Open Store');
  }

  void onPremiumPhonesTap() {
    _showSnackBar('Premium Phones');
  }

  void onRefurbishedPhonesTap() {
    _showSnackBar('Refurbished Phones');
  }

  void onUnderWarrantyPhonesTap() {
    _showSnackBar('Under Warranty Phones');
  }

  void onVerifiedPhonesTap() {
    _showSnackBar('Verified Phones');
  }

  void onBrandTap(String brand) {
    _showSnackBar('$brand phones');
  }

  void onMoreBrandsTap() {
    _showSnackBar('More Brands');
  }

  void onViewAllBrandsTap() {
    _showSnackBar('View All Brands');
  }

  // Helper method to reduce code duplication
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(_navigationService.navigatorKey!.currentContext!).showSnackBar(
      SnackBar(content: Text('$message coming soon!')),
    );
  }
}
