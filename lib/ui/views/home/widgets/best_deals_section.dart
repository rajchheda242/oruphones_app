import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones_app/ui/views/home/widgets/sell_phone_card.dart';
import 'package:oruphones_app/ui/widgets/product_card.dart';
import 'filter_bottom_sheet.dart';
import 'sort_bottom_sheet.dart';

class BestDealsSection extends StatelessWidget {
  final VoidCallback onFilterTap;
  final VoidCallback? onSortTap;

  const BestDealsSection({
    Key? key,
    required this.onFilterTap,
    this.onSortTap,
  }) : super(key: key);

  void _showSortBottomSheet(BuildContext context) {
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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title text
            Text(
              'Best deals in India',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                height: 24.3/18,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 20),
            
            // Sort and Filter buttons
            Row(
              children: [
                // Sort Button
                InkWell(
                  onTap: () => _showSortBottomSheet(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/sort.png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Sort',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF2C2C2C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Filter Button
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => FilterBottomSheet(
                        onClose: () => Navigator.pop(context),
                        onClearAll: () {
                          // Handle clear all
                        },
                        onApply: () {
                          // Handle apply
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Color(0xFFD7D7D7),
                        width: 1,
                      ),
                    ),
                    minimumSize: const Size(0, 36),
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
                          color: Colors.black,
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
              ],
            ),
            const SizedBox(height: 16),
            
            // Products Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 10,
                childAspectRatio: 174/281,
              ),
              itemCount: 22, // 18 cards + 4 ads
              itemBuilder: (context, index) {
                // Calculate if this position should be an ad
                if ((index + 1) % 8 == 0) {  // After every 7 products (on the 8th position)
                  return Container(
                    width: double.infinity,
                    height: 281,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Image.asset(
                      // Alternate between ad1 and ad2
                      ((index + 1) ~/ 8) % 2 == 1 ? 'assets/ads/ad1.png' : 'assets/ads/ad2.png',
                      fit: BoxFit.cover,
                    ),
                  );
                }

                // Calculate the actual product index (accounting for ads)
                int productIndex = index - (index ~/ 8);  // Subtract number of ads before this index

                return ProductCard(
                  title: 'iPhone 13 Pro Max',
                  storage: '256',
                  condition: 'Like New',
                  price: 89999,
                  originalPrice: 109999,
                  location: 'Mumbai',
                  date: '2 days ago',
                  imageUrl: 'assets/images/product.png',
                  isVerified: true,
                  initialFavorite: false,
                  isPriceNegotiable: productIndex % 3 == 0,
                  onTap: () {},
                  onFavoriteTap: (isFavorite) {},
                  discount: '45% off',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
} 