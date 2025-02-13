import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuButton extends StatelessWidget {
  final String iconName;
  final VoidCallback onTap;
  final double iconSize;  // Renamed to iconSize for clarity

  const MenuButton({
    Key? key,
    required this.iconName,
    required this.onTap,
    this.iconSize = 72,  // Only for the icon
  }) : super(key: key);

  String get displayText {
    // Special cases for longer texts
    if (iconName == 'refurbished_phones') {
      return 'Refurbished\nPhones';  // Force line break between words
    }
    if (iconName == 'my_negotiations') {
      return 'My\nNegotiations';  // Force line break between words
    }
    
    // For other cases, convert snake_case to Title Case
    return iconName
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 72,  // Original width
        child: Column(
          children: [
            Image.asset(
              'assets/menu/$iconName.png',
              width: iconSize,  // Larger icon
              height: iconSize,  // Larger icon
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 5),  // Original spacing
            Text(
              displayText,
              style: GoogleFonts.poppins(
                fontSize: 12,  // Original font size
                fontWeight: FontWeight.w400,
                height: 16.2/12,  // Original height
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