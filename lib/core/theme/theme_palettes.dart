import 'package:flutter/material.dart';

class TimerPalette {
  final int id;
  final bool isGradient;
  final List<Color> backgroundGradient;
  final Color backgroundColor;
  final Color activePillBg;
  final Color activePillText;
  final Color inactivePillBg;
  final Color timerProgress;
  final Color timerTrack;
  final Color buttonBg;
  final Color buttonText;

  const TimerPalette({
    required this.id,
    this.isGradient = false,
    this.backgroundGradient = const [],
    required this.backgroundColor,
    required this.activePillBg,
    required this.activePillText,
    required this.inactivePillBg,
    required this.timerProgress,
    required this.timerTrack,
    required this.buttonBg,
    required this.buttonText,
  });

  static const TimerPalette blueTeal = TimerPalette(
    id: 0xFF152A63,
    isGradient: true,
    backgroundGradient: [Color(0xFF152A63), Color(0xFF25BCB7)],
    backgroundColor: Color(0xFF152A63),
    activePillBg: Color(0xFF1E1E64),
    activePillText: Colors.white,
    inactivePillBg: Colors.white24,
    timerProgress: Color(0xFF00FFFF),
    timerTrack: Colors.white24,
    buttonBg: Colors.white,
    buttonText: Color(0xFF1E1E64),
  );

  static const TimerPalette darkGreen = TimerPalette(
    id: 0xFF184D35,
    backgroundColor: Color(0xFF184D35),
    activePillBg: Color(0xFF155F2A),
    activePillText: Colors.white,
    inactivePillBg: Colors.white24,
    timerProgress: Color(0xFF4C9A2A),
    timerTrack: Colors.white24,
    buttonBg: Colors.white,
    buttonText: Color(0xFF184D35),
  );

  static TimerPalette? fromId(int? id) {
    if (id == blueTeal.id) return blueTeal;
    if (id == darkGreen.id) return darkGreen;
    return null;
  }
}
