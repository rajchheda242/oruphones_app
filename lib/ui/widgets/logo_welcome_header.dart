import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWelcomeHeader extends StatelessWidget {
  final String welcomeText;
  final String subtitleText;

  const LogoWelcomeHeader({
    Key? key,
    this.welcomeText = 'Welcome',
    this.subtitleText = 'Sign in to continue',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 136,
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 116,
            height: 61,
          ),
          const SizedBox(height: 60),
          SizedBox(
            width: 136,
            height: 66,
            child: Column(
              children: [
                Text(
                  welcomeText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    height: 44.24/28,
                    letterSpacing: 0,
                    color: const Color(0xFF3F3E8F),
                  ),
                ),
                SizedBox(
                  width: 130,
                  height: 22,
                  child: Text(
                    subtitleText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 22.12/14,
                      letterSpacing: 0,
                      color: const Color(0xFF707070),
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