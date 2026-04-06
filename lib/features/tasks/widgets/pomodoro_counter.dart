import 'package:flutter/material.dart';

class PomodoroCounter extends StatelessWidget {
  final int completed;
  final int target;
  final Color activeColor;
  final Color inactiveColor;

  const PomodoroCounter({
    super.key,
    required this.completed,
    required this.target,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    // Toplam hedef sayısına göre yuvarlaklar çizeceğiz.
    final List<Widget> dots = [];

    for (int i = 0; i < target; i++) {
      final isDone = i < completed;
      dots.add(
        Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone ? activeColor : inactiveColor,
            border: Border.all(
              color: isDone ? activeColor : inactiveColor.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: dots,
    );
  }
}
