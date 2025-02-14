import 'package:flutter/material.dart';

class QRCodeFrame extends StatelessWidget {
  final bool isPlayStore;

  const QRCodeFrame({
    required this.isPlayStore,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159,
      height: 215,
      child: Column(
        children: [
          Container(
            width: 159,
            height: 159,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                isPlayStore ? 'assets/images/android_qr.png' : 'assets/images/apple_qr.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 159,
            height: 48,
            alignment: Alignment.center,
            child: Image.asset(
              isPlayStore ? 'assets/images/PlayStore.png' : 'assets/images/apple.png',
              width: 48,
              height: 48,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
} 