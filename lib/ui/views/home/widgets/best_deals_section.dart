import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestDealsSection extends StatelessWidget {
  final VoidCallback onSortTap;
  final VoidCallback onFilterTap;

  const BestDealsSection({
    Key? key,
    required this.onSortTap,
    required this.onFilterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title text
          Container(
            width: 149,
            height: 24,
            child: Text(
              'Best deals in India',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 24.3/18, // line-height divided by font-size
                letterSpacing: 0,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Sort and Filter buttons
          Container(
            width: 358,
            height: 36,
            child: Row(
              children: [
                // Sort Button
                GestureDetector(
                  onTap: onSortTap,
                  child: Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFD7D7D7),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/sort.png',
                          width: 13.2,
                          height: 13.2,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Sort',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 18.9/14,
                            letterSpacing: 0,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Image.asset(
                          'assets/icons/down_arrow.png',
                          width: 13.2,
                          height: 13.2,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Filter Button
                GestureDetector(
                  onTap: onFilterTap,
                  child: Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFD7D7D7),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/filters.png',
                          width: 13.2,
                          height: 13.2,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Filters',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 18.9/14,
                            letterSpacing: 0,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Image.asset(
                          'assets/icons/down_arrow.png',
                          width: 13.2,
                          height: 13.2,
                        ),
                      ],
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