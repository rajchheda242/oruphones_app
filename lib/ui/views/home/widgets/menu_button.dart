import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButton extends StatelessWidget {
  final String iconName;
  final VoidCallback onTap;

  const MenuButton({
    Key? key,
    required this.iconName,
    required this.onTap,
  }) : super(key: key);

  String get displayText => iconName
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 72,
        child: Column(
          children: [
            Image.asset(
              'assets/menu/$iconName.png',
              width: 72,
              height: 72,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 5),
            Text(
              displayText,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 16.2/12,
                color: const Color(0xFF121212),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
} 