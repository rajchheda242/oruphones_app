import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final bool isExpanded;
  final VoidCallback onTap;
  final String? answer;

  const FAQItem({
    required this.question,
    required this.isExpanded,
    required this.onTap,
    this.answer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 358,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFE8E8E8),
              width: 1,
            ),
          ),
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: const Color(0xFFF4F4F4),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size(356, 68),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 22.4/16,
                      letterSpacing: 0,
                      color: const Color(0xFF282828),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 24,
                  height: 24,
                  child: Icon(
                    isExpanded ? Icons.close : Icons.add,
                    color: const Color(0xFF282828),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded && answer != null)
          Container(
            width: 358,
            height: 612,
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 326,
              height: 588,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                answer!,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 21.6/12,
                  letterSpacing: 0,
                  color: const Color(0xFF282828),
                ),
              ),
            ),
          ),
      ],
    );
  }
} 