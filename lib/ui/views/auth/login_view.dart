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
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isBottomSheet) _buildCloseButton(context),
              _buildLogo(),
              _buildWelcomeText(),
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
              Column(
                children: [
                  _buildTermsAndConditions(viewModel),
                  const SizedBox(height: 8),
                  _buildNextButton(viewModel),
                ],
              ),
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

  Widget _buildLogo() => Image.asset(
        'assets/images/logo.png',
        height: 100,
      );

  Widget _buildWelcomeText() => Center(
        child: Column(
          children: const [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF46389C),
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Sign in to continue',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
            ),
            SizedBox(height: 115),
          ],
        ),
      );

  Widget _buildTermsAndConditions(LoginViewModel viewModel) => Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: viewModel.acceptedTerms,
              onChanged: viewModel.setAcceptedTerms,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          const SizedBox(width: 8),
          const Text('Accept '),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
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
        height: 48,
        child: ElevatedButton(
          onPressed: viewModel.canProceed ? viewModel.generateOtp : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4318FF),
            disabledBackgroundColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: viewModel.isBusy
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
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
  LoginViewModel viewModelBuilder(BuildContext context) =>
      LoginViewModel(isBottomSheet: isBottomSheet);
}
