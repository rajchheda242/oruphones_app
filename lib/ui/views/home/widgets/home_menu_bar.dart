import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../home_viewmodel.dart';

class HomeMenuBar extends ViewModelWidget<HomeViewModel> {
  const HomeMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      width: 390,
      height: 64,
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left section with menu and logo
          Container(
            width: 114,
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                // Menu Icon
                GestureDetector(
                  onTap: () => viewModel.onMenuTap(context),
                  child: SizedBox(
                    width: 20,
                    height: 16,
                    child: Image.asset(
                      'assets/icons/menu.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Logo
                SizedBox(
                  width: 50,
                  height: 24,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          // Right section (to be implemented)
          const SizedBox(), // Placeholder for right section
        ],
      ),
    );
  }
} 