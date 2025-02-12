import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNavButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? tag; // Optional tag like "new"

  const PhoneNavButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0x80FFFFFF),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (tag != null) ...[
              Image.asset(
                'assets/icons/$tag.png',
                width: 24,
                height: 12,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 1,
                color: const Color(0xFF121212),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 