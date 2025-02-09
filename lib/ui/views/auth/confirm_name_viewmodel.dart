import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../services/auth_service.dart';

class ConfirmNameViewModel extends BaseViewModel {
  final nameController = TextEditingController();
  String? errorMessage;

  bool get canConfirm => nameController.text.isNotEmpty;

  Future<void> confirmName() async {
    if (!canConfirm) return;

    try {
      setBusy(true);
      errorMessage = null;

      final result = await AuthService().updateUserName(
        countryCode: 91,
        userName: nameController.text.trim(),
      );

      if (!result.success) {
        errorMessage = result.error;
        notifyListeners();
        return;
      }

      // TODO: Navigate to home screen
    } catch (e) {
      errorMessage = 'Something went wrong. Please try again.';
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
