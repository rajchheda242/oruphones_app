import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oruphones_app/ui/views/home/widgets/sell_phone_card.dart';
import 'package:oruphones_app/ui/widgets/product_card.dart';

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
    return Padding(
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
    );
  }
} 