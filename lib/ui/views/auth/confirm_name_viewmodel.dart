import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';

class ConfirmNameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final nameController = TextEditingController();
  String? errorMessage;
  final bool isBottomSheet;

  ConfirmNameViewModel({this.isBottomSheet = false});

  bool get canConfirm => nameController.text.isNotEmpty;

  Future<void> confirmName() async {
    if (!canConfirm) return;

    try {
      setBusy(true);
      errorMessage = null;

      final result = await locator<AuthService>().updateUserName(
        countryCode: 91,
        userName: nameController.text.trim(),
      );

      if (!result.success) {
        errorMessage = result.error;
        notifyListeners();
        return;
      }

      _navigationService.replaceWith(Routes.homeView);
    } catch (e) {
      errorMessage = 'Something went wrong. Please try again.';
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }

  void goBack() {
    if (isBottomSheet) {
      _navigationService.back();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
