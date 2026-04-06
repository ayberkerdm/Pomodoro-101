import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // === Display ===
  static TextStyle displayLarge(BuildContext context) =>
      GoogleFonts.nunito(
        fontSize: 57,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.25,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle displayMedium(BuildContext context) =>
      GoogleFonts.nunito(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // === Headlines ===
  static TextStyle headlineLarge(BuildContext context) =>
      GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle headlineMedium(BuildContext context) =>
      GoogleFonts.nunito(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle headlineSmall(BuildContext context) =>
      GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // === Titles ===
  static TextStyle titleLarge(BuildContext context) =>
      GoogleFonts.nunito(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle titleMedium(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle titleSmall(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: Theme.of(context).colorScheme.onSurface,
      );

  // === Body ===
  static TextStyle bodyLarge(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle bodyMedium(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle bodySmall(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );

  // === Labels ===
  static TextStyle labelLarge(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle labelMedium(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle labelSmall(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );

  // === Special: Timer ===
  static TextStyle timerDisplay(BuildContext context) =>
      GoogleFonts.nunito(
        fontSize: 72,
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        color: Theme.of(context).colorScheme.onSurface,
      );

  static TextStyle timerLabel(BuildContext context) =>
      GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 2,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );
}
