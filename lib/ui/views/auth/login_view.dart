import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  final bool isBottomSheet;

  const LoginView({
    Key? key,
    this.isBottomSheet = false,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isBottomSheet
            ? const BorderRadius.vertical(top: Radius.circular(16))
            : null,
      ),
      child: Column(
        mainAxisSize: isBottomSheet ? MainAxisSize.min : MainAxisSize.max,
        children: [
          // Close button for bottom sheet
          if (isBottomSheet)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),

          // Logo
          Image.asset('assets/images/logo.png', height: 40),
          const SizedBox(height: 24),

          // Welcome text
          const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const Text(
            'Sign in to continue',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 32),

          // Phone number input
          TextFormField(
            controller: viewModel.phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixText: '+91 ',
              hintText: 'Mobile Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Terms and conditions
          Row(
            children: [
              Checkbox(
                value: viewModel.acceptedTerms,
                onChanged: viewModel.setAcceptedTerms,
              ),
              const Text('Accept '),
              TextButton(
                onPressed: () {}, // Empty void action
                child: const Text(
                  'Terms and condition',
                  style: TextStyle(
                    color: Color(0xFF4318FF),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Next button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: viewModel.canProceed ? viewModel.generateOtp : null,
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
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
