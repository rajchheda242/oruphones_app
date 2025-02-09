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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: isBottomSheet ? MainAxisSize.min : MainAxisSize.max,
          children: [
            if (isBottomSheet) _buildCloseButton(context),
            _buildLogo(),
            _buildWelcomeText(),
            if (viewModel.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  viewModel.errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            TextFormField(
              controller: viewModel.phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              onChanged: (_) => viewModel.notifyListeners(),
              decoration: InputDecoration(
                prefixText: '+91 ',
                hintText: 'Mobile Number',
                errorText: viewModel.phoneError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                counterText: '',
              ),
            ),
            _buildTermsAndConditions(viewModel),
            _buildNextButton(viewModel),
          ],
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

  Widget _buildWelcomeText() => Column(
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
            'Sign in to continue',
            style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
          ),
          SizedBox(height: 32),
        ],
      );

  Widget _buildTermsAndConditions(LoginViewModel viewModel) => Row(
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
      );

  Widget _buildNextButton(LoginViewModel viewModel) => SizedBox(
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
      );

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
