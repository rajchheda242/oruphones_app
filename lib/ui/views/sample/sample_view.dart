import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/product_card.dart';

class SampleView extends StatelessWidget {
  const SampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample View'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProductCard(
            title: 'Apple iPhone 13 Pro',
            storage: '256 GB',
            condition: 'Like New',
            price: 41500,
            originalPrice: 81500,
            location: 'Nijampur, Luc...',
            date: 'July 25th',
            imageUrl: 'assets/images/product.png',
            isVerified: true,
            initialFavorite: false,
            isPriceNegotiable: true,
            onTap: () {
              print('Card tapped');
            },
            onFavoriteTap: (isFavorite) {
              print('Favorite changed to: $isFavorite');
            },
          ),
        ),
      ),
    );
  }
} 