import 'dart:ui';

import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String storage;
  final String condition;
  final double price;
  final double originalPrice;
  final String location;
  final String date;
  final String imageUrl;
  final bool isVerified;
  final bool initialFavorite;
  final bool isPriceNegotiable;
  final VoidCallback? onTap;
  final Function(bool)? onFavoriteTap;

  const ProductCard({
    Key? key,
    required this.title,
    required this.storage,
    required this.condition,
    required this.price,
    required this.originalPrice,
    required this.location,
    required this.date,
    required this.imageUrl,
    this.isVerified = false,
    this.initialFavorite = false,
    this.isPriceNegotiable = false,
    this.onTap,
    this.onFavoriteTap,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteTap?.call(isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final discountPercentage = ((widget.originalPrice - widget.price) / widget.originalPrice * 100).round();
    
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 174,
        height: 281,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFCFCFCF),
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),  // X: 0, Y: 2
              blurRadius: 4,         // Blur: 4
              spreadRadius: 0,       // Spread: 0
              color: Color(0x1A8C8C8C),  // #8C8C8C at 10%
            ),
            BoxShadow(
              offset: Offset(-2, 6), // X: -2, Y: 6
              blurRadius: 7,         // Blur: 7
              spreadRadius: 0,       // Spread: 0
              color: Color(0x178C8C8C),  // #8C8C8C at 9%
            ),
            BoxShadow(
              offset: Offset(-4, 14), // X: -4, Y: 14
              blurRadius: 9,          // Blur: 9
              spreadRadius: 0,        // Spread: 0
              color: Color(0x0D8C8C8C),  // #8C8C8C at 5%
            ),
            BoxShadow(
              offset: Offset(-7, 26), // X: -7, Y: 26
              blurRadius: 11,         // Blur: 11
              spreadRadius: 0,        // Spread: 0
              color: Color(0x038C8C8C),  // #8C8C8C at 1%
            ),
            BoxShadow(
              offset: Offset(-12, 40), // X: -12, Y: 40
              blurRadius: 12,          // Blur: 12
              spreadRadius: 0,         // Spread: 0
              color: Color(0x008C8C8C),  // #8C8C8C at 0%
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.asset(
                    widget.imageUrl,
                    height: 181,
                    width: 174,
                    fit: BoxFit.cover,
                  ),
                ),
                
                // Price Negotiable Tag
                if (widget.isPriceNegotiable)
                  Positioned(
                    top: 160,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.86, sigmaY: 3.86),
                        child: Container(
                          width: 174,
                          height: 21,
                          color: Colors.black.withOpacity(0.5),
                          child: const Center(
                            child: Text(
                              'PRICE NEGOTIABLE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                // Top Frame with Verified and Heart
                Positioned(
                  top: 8,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Verified Badge
                        if (widget.isVerified)
                          Container(
                            height: 21,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 16),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF4CAF50),
                                  ),
                                  child: const Text(
                                    'ORUVerified',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: ClipPath(
                                    clipper: RibbonClipper(),
                                    child: Container(
                                      width: 12,
                                      height: 21,
                                      color: const Color(0xFF4CAF50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        // Heart Icon
                        GestureDetector(
                          onTap: _toggleFavorite,
                          child: Container(
                            width: 25.09375,
                            height: 25.09375,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            child: Center(
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.black,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                width: 156,
                height: 68,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Container(
                      width: 154,
                      height: 19,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          letterSpacing: 0,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 3),
                    // Storage and Condition
                    Container(
                      height: 19,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Storage text
                          Text(
                            '12/256 GB',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6D6D6D),
                              height: 1.315, // To match 15.78px line height
                            ),
                          ),
                          // Bullet point with exact spacing
                          Container(
                            width: 8,
                            height: 24,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: Text(
                                '•',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF6D6D6D),
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          // Like New tag
                          Container(
                            height: 16,
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F8F8), // Lighter grey background
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: const Color(0xFFE6E6E6),
                                width: 0.5,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Like New',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6D6D6D),
                                  height: 1.315, // To match 15.78px line height
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3),
                    // Price and Discount
                    Container(
                      width: 154,
                      height: 19,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Current Price
                          Container(
                            width: 60,
                            height: 24,
                            child: Text(
                              '₹${widget.price.toStringAsFixed(0)}',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                letterSpacing: 0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          // Discount Container
                          Container(
                            width: 85,
                            height: 15,
                            child: Row(
                              children: [
                                // Original Price
                                Container(
                                  width: 40,
                                  height: 15,
                                  child: Text(
                                    '₹${widget.originalPrice.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      letterSpacing: 0,
                                      decoration: TextDecoration.lineThrough,
                                      color: Color(0xFF707070),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 1),
                                // Discount Percentage
                                Container(
                                  width: 42,
                                  height: 14,
                                  child: Text(
                                    '(${((widget.originalPrice - widget.price) / widget.originalPrice * 100).round()}% off)',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      height: 1.35,
                                      letterSpacing: -0.5,
                                      color: Color(0xFFE9342B),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Add the bottom layer
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.5, sigmaY: 5.5),
                child: Container(
                  width: 174,
                  height: 21,
                  padding: const EdgeInsets.fromLTRB(6.76, 1.93, 9.66, 4),
                  decoration: BoxDecoration(
                    color: const Color(0xC4DFDFDF), // #DFDFDFC4
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.location,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6D6D6D),
                        ),
                      ),
                      const SizedBox(width: 9.66), // Gap specified
                      Text(
                        widget.date,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6D6D6D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);  // Start at top-left
    path.lineTo(size.width, 0);  // Line to top-right
    path.lineTo(size.width / 2, size.height / 2);  // Point inward at middle
    path.lineTo(size.width, size.height);  // Line to bottom-right
    path.lineTo(0, size.height);  // Line to bottom-left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
} 