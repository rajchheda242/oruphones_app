import 'package:flutter/material.dart';

class BrandLogo extends StatefulWidget {
  final String brand;
  final VoidCallback? onTap;
  final bool animate;

  const BrandLogo({
    Key? key,
    required this.brand,
    this.onTap,
    this.animate = true,
  }) : super(key: key);

  @override
  State<BrandLogo> createState() => _BrandLogoState();
}

class _BrandLogoState extends State<BrandLogo> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    if (widget.animate) {
      _controller.forward();
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: GestureDetector(
          onTap: widget.onTap,
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
            padding: EdgeInsets.all(widget.brand == 'mi' ? 12 : 4.26),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.11),
              child: Image.asset(
                'assets/brands/${widget.brand}.png',
                width: widget.brand == 'mi' ? 40 : 55.48,
                height: widget.brand == 'mi' ? 40 : 55.48,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
} 