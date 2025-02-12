import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  final double scaleFactor;

  const MenuItem({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    required this.scaleFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 64) / 3;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: itemWidth,
        constraints: BoxConstraints(
          minHeight: 54,
          maxHeight: itemWidth * 0.7,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: itemWidth * 0.25,
              height: itemWidth * 0.25,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: itemWidth * 0.11,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 