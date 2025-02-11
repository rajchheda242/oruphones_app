import 'package:flutter/material.dart';

class MenuGridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MenuGridItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311,
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(icon, size: 24),
        ],
      ),
    );
  }
} 