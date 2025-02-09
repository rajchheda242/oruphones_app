import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'confirm_name_viewmodel.dart';

class ConfirmNameView extends StackedView<ConfirmNameViewModel> {
  final bool isBottomSheet;

  const ConfirmNameView({
    Key? key,
    this.isBottomSheet = false,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ConfirmNameViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isBottomSheet
              ? const BorderRadius.vertical(top: Radius.circular(16))
              : null,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: isBottomSheet ? MainAxisSize.min : MainAxisSize.max,
            children: [
              if (isBottomSheet) _buildCloseButton(context),
              _buildLogo(),
              _buildTitle(),
              if (viewModel.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    viewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              _buildNameInput(viewModel),
              _buildConfirmButton(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      );

  Widget _buildLogo() => Image.asset('assets/images/logo.png', height: 40);

  Widget _buildTitle() => Column(
        children: const [
          Text(
            'Welcome',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          Text(
            'SignUp to continue',
            style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
          ),
          SizedBox(height: 32),
        ],
      );

  Widget _buildNameInput(ConfirmNameViewModel viewModel) => TextFormField(
        controller: viewModel.nameController,
        decoration: InputDecoration(
          labelText: 'Please Tell Us Your Name',
          labelStyle: const TextStyle(color: Color(0xFF6B7280)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixText: '*',
          suffixStyle: const TextStyle(color: Colors.red),
        ),
      );

  Widget _buildConfirmButton(ConfirmNameViewModel viewModel) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: viewModel.canConfirm ? viewModel.confirmName : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4318FF),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: viewModel.isBusy
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                    'Confirm Name',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      );

  @override
  ConfirmNameViewModel viewModelBuilder(BuildContext context) =>
      ConfirmNameViewModel();
}
