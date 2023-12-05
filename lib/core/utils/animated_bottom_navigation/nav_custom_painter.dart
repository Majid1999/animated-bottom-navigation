import 'dart:math';

import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.21;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0) * size.width, 0)
      // ..arcTo(
      //   Rect.fromPoints(
      //     Offset(loc * size.width, 0),
      //     Offset((loc + s) * size.width, size.height),
      //   ),
      //   0,
      //   pi, // pi radians represents a half-circle
      //   false,
      // )
      ..cubicTo(
        (loc + s * 0.10) * size.width,
        size.height * 0.05,
        (loc + s - 0.12) * size.width ,
        size.height * 0.9,
        (loc + s + 0) * size.width,
        0,
      )
      // ..cubicTo(
      //   (loc + s) * size.width,
      //   size.height * 0.5,
      //   (loc + s - s * 0.20) * size.width,
      //   size.height * 0.05,
      //   (loc + s + 0) * size.width,
      //   0,
      // )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
