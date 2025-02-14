import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../home_viewmodel.dart';
import 'brand_logo.dart';
import '../widgets/sort_bottom_sheet.dart';

class TopBrands extends ViewModelWidget<HomeViewModel> {
  const TopBrands({Key? key}) : super(key: key);

  void _showSortBottomSheet(BuildContext context) {
    print('Sort button tapped');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SortBottomSheet(
        onClose: () => Navigator.pop(context),
        onClearAll: () {
          print('Clear tapped');
          Navigator.pop(context);
        },
        onApply: () {
          print('Apply tapped');
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final brands = ['apple', 'mi', 'samsung', 'vivo', 'realme', 'motorola', 'oppo'];

    return Container(
      width: 390,
      height: 114,
      child: Column(
        children: [
          // Header section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top brands',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    height: 24.3/18,
                    color: const Color(0xFF525252),
                  ),
                ),
                GestureDetector(
                  onTap: () => _showSortBottomSheet(context),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/icons/more.png',
                      width: 23.26,
                      height: 23.26,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Brands list
          Container(
            margin: const EdgeInsets.only(top: 13.97),
            height: 72,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.fromLTRB(17, 0, 20, 0),
                child: Row(
                  children: [
                    for (int i = 0; i < brands.length; i++) ...[
                      if (i > 0) const SizedBox(width: 17),
                      BrandLogo(
                        brand: brands[i],
                        onTap: () => viewModel.onBrandTap(brands[i]),
                        animate: true,
                      ),
                    ],
                    const SizedBox(width: 17),
                    // View All button
                    GestureDetector(
                      onTap: () => viewModel.onViewAllBrandsTap(),
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF2F2F2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View All',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  height: 13.5/10,
                                  letterSpacing: -0.03,
                                  color: const Color(0xFF3E468F),
                                ),
                              ),
                              const SizedBox(width: 2),
                              Image.asset(
                                'assets/icons/arrow.png',
                                width: 12,
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 