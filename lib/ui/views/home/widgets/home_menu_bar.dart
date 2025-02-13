import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../home_viewmodel.dart';

class HomeMenuBar extends ViewModelWidget<HomeViewModel> {
  const HomeMenuBar({
    Key? key, 
    required this.onNotificationsTap,
  }) : super(key: key, reactive: true);

  final VoidCallback onNotificationsTap;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final isLoggedIn = viewModel.isUserLoggedIn;
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
                GestureDetector(
                  onTap: () => viewModel.onMenuTap(context),
                  child: const SizedBox(
                    width: 20,
                    height: 16,
                    child: Icon(Icons.menu, size: 24),
                  ),
                ),
                const SizedBox(width: 12),
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
          // Right section with location and login
          Container(
            width: 152,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'India',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF121212),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/icons/location.png',
                  width: 16,
                  height: 16,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                if (isLoggedIn)
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Color(0xFF2C2C2C),
                      size: 24,
                    ),
                    onPressed: onNotificationsTap,
                  )
                else
                  ElevatedButton(
                    onPressed: () => viewModel.navigateToLogin(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6C018),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      minimumSize: const Size(66, 29),
                      maximumSize: const Size(66, 29),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF121212),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 