import 'package:flutter/material.dart';

class GradientBoxBorder extends BoxBorder {
  final Gradient gradient;
  final double width;

  const GradientBoxBorder({
    required this.gradient,
    this.width = 1.0,
  });

  @override
  BorderSide get top => BorderSide(width: width);
  BorderSide get right => BorderSide(width: width);
  @override
  BorderSide get bottom => BorderSide(width: width);
  BorderSide get left => BorderSide(width: width);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    final RRect rrect = borderRadius?.toRRect(rect) ?? RRect.fromRectXY(rect, 0, 0);
    canvas.drawRRect(rrect, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return GradientBoxBorder(
      gradient: gradient,
      width: width * t,
    );
  }
} 