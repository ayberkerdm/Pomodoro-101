import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getDarkTheme({Color? customBackground}) {
    final bgColor = customBackground ?? AppColors.darkBackground;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        primaryContainer: AppColors.primaryDark,
        onPrimaryContainer: AppColors.primaryLight,
        secondary: AppColors.secondary,
        onSecondary: Colors.black,
        secondaryContainer: AppColors.secondaryDark,
        onSecondaryContainer: AppColors.secondaryLight,
        tertiary: AppColors.accent,
        onTertiary: Colors.white,
        tertiaryContainer: const Color(0xFF8B0000),
        onTertiaryContainer: AppColors.accent,
        error: AppColors.error,
        onError: Colors.white,
        errorContainer: const Color(0xFF8B0000),
        onErrorContainer: AppColors.error,
        surface: AppColors.darkSurface,
        onSurface: AppColors.textPrimaryDark,
        onSurfaceVariant: AppColors.textSecondaryDark,
        outline: AppColors.darkDivider,
        outlineVariant: AppColors.darkDivider,
        shadow: Colors.black,
        scrim: Colors.black54,
        inverseSurface: AppColors.lightSurface,
        onInverseSurface: AppColors.textPrimaryLight,
        inversePrimary: AppColors.primaryDark,
        surfaceContainerHighest: AppColors.darkCard,
        surfaceContainerHigh: AppColors.darkCard,
        surfaceContainer: AppColors.darkCardSecondary,
        surfaceContainerLow: bgColor,
        surfaceContainerLowest: bgColor,
      ),
      scaffoldBackgroundColor: bgColor,
      cardColor: AppColors.darkCard,
      cardTheme: CardThemeData(
        color: AppColors.darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimaryDark,
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimaryDark),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        indicatorColor: AppColors.primary.withValues(alpha: 0.2),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary, size: 28);
          }
          return const IconThemeData(color: AppColors.textSecondaryDark);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            );
          }
          return GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondaryDark,
          );
        }),
      ),
      textTheme: _getTextTheme(AppColors.textPrimaryDark, AppColors.textSecondaryDark),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkDivider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkDivider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }

  static ThemeData getLightTheme({Color? customBackground}) {
    final bgColor = customBackground ?? AppColors.lightBackground;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        primaryContainer: const Color(0xFFE8E7FF),
        onPrimaryContainer: AppColors.primaryDark,
        secondary: AppColors.secondary,
        onSecondary: Colors.black,
        secondaryContainer: const Color(0xFFBFF8EF),
        onSecondaryContainer: AppColors.secondaryDark,
        tertiary: AppColors.accent,
        onTertiary: Colors.white,
        error: AppColors.error,
        onError: Colors.white,
        surface: AppColors.lightSurface,
        onSurface: AppColors.textPrimaryLight,
        onSurfaceVariant: AppColors.textSecondaryLight,
        outline: AppColors.lightDivider,
        outlineVariant: AppColors.lightDivider,
        surfaceContainerLow: bgColor,
        surfaceContainerLowest: Colors.white,
      ),
      scaffoldBackgroundColor: bgColor,
      cardColor: AppColors.lightCard,
      cardTheme: CardThemeData(
        color: AppColors.lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.lightDivider),
        ),
        margin: EdgeInsets.zero,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.nunito(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimaryLight,
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimaryLight),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        indicatorColor: AppColors.primary.withValues(alpha: 0.1),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primary, size: 28);
          }
          return const IconThemeData(color: AppColors.textSecondaryLight);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            );
          }
          return GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondaryLight,
          );
        }),
      ),
      textTheme: _getTextTheme(AppColors.textPrimaryLight, AppColors.textSecondaryLight),
    );
  }

  static TextTheme _getTextTheme(Color primaryColor, Color secondaryColor) {
    return GoogleFonts.interTextTheme().copyWith(
      displayLarge: GoogleFonts.nunito(fontWeight: FontWeight.w800, color: primaryColor),
      displayMedium: GoogleFonts.nunito(fontWeight: FontWeight.w700, color: primaryColor),
      displaySmall: GoogleFonts.nunito(fontWeight: FontWeight.w700, color: primaryColor),
      headlineLarge: GoogleFonts.nunito(fontWeight: FontWeight.w800, color: primaryColor),
      headlineMedium: GoogleFonts.nunito(fontWeight: FontWeight.w700, color: primaryColor),
      headlineSmall: GoogleFonts.nunito(fontWeight: FontWeight.w700, color: primaryColor),
      titleLarge: GoogleFonts.nunito(fontWeight: FontWeight.w700, color: primaryColor),
      titleMedium: GoogleFonts.inter(fontWeight: FontWeight.w600, color: primaryColor),
      titleSmall: GoogleFonts.inter(fontWeight: FontWeight.w600, color: primaryColor),
      bodyLarge: GoogleFonts.inter(color: primaryColor),
      bodyMedium: GoogleFonts.inter(color: primaryColor),
      bodySmall: GoogleFonts.inter(color: secondaryColor),
      labelLarge: GoogleFonts.inter(fontWeight: FontWeight.w600, color: primaryColor),
      labelMedium: GoogleFonts.inter(fontWeight: FontWeight.w500, color: secondaryColor),
      labelSmall: GoogleFonts.inter(fontWeight: FontWeight.w500, color: secondaryColor.withValues(alpha: 0.7)),
    );
  }
}
