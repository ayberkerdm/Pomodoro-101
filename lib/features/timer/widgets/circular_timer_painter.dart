import 'dart:math';
import 'package:flutter/material.dart';

class CircularTimerPainter extends CustomPainter {
  final double progress;
  final Color trackColor;
  final Color progressColor;
  final double strokeWidth;

  CircularTimerPainter({
    required this.progress,
    required this.trackColor,
    required this.progressColor,
    this.strokeWidth = 16.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Arka plandaki silik çember (Track)
    final trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // 2. Kalan süreyi gösteren dolu alan (Progress Arc)
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - (strokeWidth / 2);

    // Track'i çiz (Tam Çember)
    canvas.drawCircle(center, radius, trackPaint);

    // Sweep Angle: Progress ne kadarsa o kadar çember dolacak (1.0 = tam)
    // Dairesel hareket en tepeden (-pi/2) saat yönüne doğru gider
    final sweepAngle = 2 * pi * progress;
    
    // Shader/Gradient eklenebilir, fakat şimdilik düz ana renk
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -(pi / 2),
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CircularTimerPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
