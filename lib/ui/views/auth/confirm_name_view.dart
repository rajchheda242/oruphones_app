import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confirm_name_viewmodel.dart';
import '../../widgets/logo_welcome_header.dart';

class ConfirmNameView extends StackedView<ConfirmNameViewModel> {
  final bool isBottomSheet;

  const ConfirmNameView({
    Key? key,
    this.isBottomSheet = false,
  }) : super(key: key);

  @override
  Widget builder(BuildContext context, ConfirmNameViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                color: const Color(0xFFFFFFFF),
                width: 358,
                height: 775,
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 49),
                    const LogoWelcomeHeader(
                      welcomeText: 'Welcome',
                      subtitleText: 'Sign in to continue',
                    ),
                    const SizedBox(height: 100), // Same gap as phone input
                    SizedBox(
                      width: 358,
                      height: 71,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 159,
                            height: 19,
                            child: Row(
                              children: [
                                Text(
                                  'Please Tell Us Your Name',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 18.96/12,
                                    letterSpacing: 0,
                                    color: const Color(0xFF282828),
                                  ),
                                ),
                                Text(
                                  ' *',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 18.96/12,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 358,
                            height: 52,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              border: Border.all(
                                color: const Color(0xFFCCCCCC),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: TextFormField(
                              controller: viewModel.nameController,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                errorText: viewModel.error('name'),
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF282828),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100), // Gap before button
                    _buildConfirmButton(viewModel),
                  ],
                ),
              ),
              Positioned(
                top: 24,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => viewModel.goBack(),
                  color: const Color(0xFF3F3E8F),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton(ConfirmNameViewModel viewModel) => SizedBox(
        width: 358,
        height: 51,
        child: ElevatedButton(
          onPressed: viewModel.canSubmit ? viewModel.onConfirmPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3F3E8F),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(
                color: Color(0xFFB1B1B1),
                width: 1,
              ),
            ),
          ),
          child: viewModel.isBusy
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Confirm Name',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward,
                      size: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
        ),
      );

  @override
  ConfirmNameViewModel viewModelBuilder(BuildContext context) =>
      ConfirmNameViewModel(isBottomSheet: isBottomSheet);
}
