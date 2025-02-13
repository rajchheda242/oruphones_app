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

  bool get canSubmit => nameController.text.isNotEmpty;
  Future<void> onConfirmPressed() => confirmName();

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
        // First update the auth state
        final authResponse = AuthResponse(
          isAuthenticated: true,  // This is crucial
          user: User(
            name: nameController.text.trim(),
            joinDate: DateTime.now().toString(),
          ),
        );
        
        // Update auth state BEFORE navigation
        _authService.updateAuthState(authResponse);
        
        // Add a small delay to ensure state updates
        await Future.delayed(const Duration(milliseconds: 100));
        
        // Then navigate
        await _navigationService.clearStackAndShow(Routes.homeView);
      } else {
        print('Failed to update name: ${result.error}');
        setError(result.error ?? 'Failed to update name');
      }
    } catch (e) {
      print('Error in confirmName: $e');
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
