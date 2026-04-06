import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // === Brand Colors ===
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF9C97FF);
  static const Color primaryDark = Color(0xFF4A42D6);

  static const Color secondary = Color(0xFF00D4AA);
  static const Color secondaryLight = Color(0xFF4DFFDB);
  static const Color secondaryDark = Color(0xFF00A882);

  static const Color accent = Color(0xFFFF6B6B);
  static const Color accentOrange = Color(0xFFFF9F43);
  static const Color accentYellow = Color(0xFFFFD93D);

  // === Neutral Dark (Dark Theme) ===
  static const Color darkBackground = Color(0xFF0F0F1A);
  static const Color darkSurface = Color(0xFF1A1A2E);
  static const Color darkCard = Color(0xFF242442);
  static const Color darkCardSecondary = Color(0xFF2D2D50);
  static const Color darkDivider = Color(0xFF2E2E4A);

  // === Neutral Light (Light Theme) ===
  static const Color lightBackground = Color(0xFFF5F5FF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightCardSecondary = Color(0xFFF0F0FF);
  static const Color lightDivider = Color(0xFFE8E8F0);

  // === Text ===
  static const Color textPrimaryDark = Color(0xFFEEEEFF);
  static const Color textSecondaryDark = Color(0xFF9090B0);
  static const Color textHintDark = Color(0xFF5A5A80);

  static const Color textPrimaryLight = Color(0xFF1A1A2E);
  static const Color textSecondaryLight = Color(0xFF6060A0);
  static const Color textHintLight = Color(0xFFA0A0C0);

  // === Timer Mode Colors ===
  static const Color focusColor = Color(0xFF6C63FF);    // Focus / Work
  static const Color shortBreakColor = Color(0xFF00D4AA); // Short Break
  static const Color longBreakColor = Color(0xFF4ECDC4);  // Long Break

  // === Status Colors ===
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFFF5252);
  static const Color info = Color(0xFF2196F3);

  // === Category Colors ===
  static const List<Color> categoryColors = [
    Color(0xFF6C63FF),
    Color(0xFF00D4AA),
    Color(0xFFFF6B6B),
    Color(0xFFFF9F43),
    Color(0xFF4ECDC4),
    Color(0xFFA29BFE),
    Color(0xFFFF7675),
    Color(0xFF74B9FF),
    Color(0xFF55EFC4),
    Color(0xFFFDCB6E),
  ];

  // === Chart Colors ===
  static const List<Color> chartColors = [
    Color(0xFF6C63FF),
    Color(0xFF00D4AA),
    Color(0xFFFF6B6B),
    Color(0xFFFF9F43),
    Color(0xFF4ECDC4),
    Color(0xFFA29BFE),
    Color(0xFFFF7675),
  ];

  // === Gradient ===
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6C63FF), Color(0xFF9C97FF)],
  );

  static const LinearGradient focusGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6C63FF), Color(0xFF4A42D6)],
  );

  static const LinearGradient shortBreakGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF00D4AA), Color(0xFF00A882)],
  );

  static const LinearGradient longBreakGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4ECDC4), Color(0xFF2EA8A0)],
  );

  static const LinearGradient darkBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0F0F1A), Color(0xFF1A1A2E)],
  );
}
