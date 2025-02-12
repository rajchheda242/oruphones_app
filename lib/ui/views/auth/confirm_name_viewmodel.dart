import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth_service.dart';

class ConfirmNameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final nameController = TextEditingController();
  final bool isBottomSheet;

  ConfirmNameViewModel({this.isBottomSheet = false}) {
    // Add listener to text controller
    nameController.addListener(() {
      notifyListeners();  // This will update the UI when text changes
    });
  }

  bool get canConfirm => nameController.text.trim().isNotEmpty;

  String? getFieldError(String field) {
    if (field == 'name' && nameController.text.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  Future<void> confirmName() async {
    if (!canConfirm) return;

    try {
      setBusy(true);
      final result = await _authService.updateUserName(
        countryCode: 91,
        userName: nameController.text.trim(),
      );

      if (result.success) {
        // Update user name in auth state
        if (_authService.currentUser != null) {
          _authService.updateAuthState(
            AuthResponse(
              isAuthenticated: true,
              user: User(
                name: nameController.text.trim(),
                joinDate: _authService.currentUser!.joinDate,
                profileImage: _authService.currentUser!.profileImage,
              ),
            ),
          );
        }
        // Navigate back to landing page (now in logged-in state)
        await _navigationService.clearStackAndShow(Routes.landingView);
      } else {
        setError(result.error ?? 'Failed to update name');
      }
    } catch (e) {
      setError('Something went wrong');
    } finally {
      setBusy(false);
    }
  }

  void goBack() {
    if (isBottomSheet) {
      _navigationService.back();
    } else {
      _navigationService.clearStackAndShow(Routes.landingView);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
