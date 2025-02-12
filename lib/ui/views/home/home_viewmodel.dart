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
}
