import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  int completePercent;
  double width;
  MyPainter(
      {required this.lineColor,
      required this.completeColor,
      required this.completePercent,
      required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = math.min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * math.pi * (completePercent / 100);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2, arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}