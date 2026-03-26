import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_constants.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryStart,
        secondary: AppColors.accentStart,
        surface: AppColors.bgSecondary,
        onSurface: AppColors.textPrimary,
        onPrimary: Colors.white,
      ),

      // Scaffold background
      scaffoldBackgroundColor: AppColors.bgPrimary,

      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.outfit(
          color: AppColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
      ),

      // Text theme
      textTheme: TextTheme(
        // Display styles
        displayLarge: GoogleFonts.outfit(
          fontSize: 72,
          fontWeight: FontWeight.w900,
          color: AppColors.textPrimary,
          height: 1.2,
        ),
        displayMedium: GoogleFonts.outfit(
          fontSize: 56,
          fontWeight: FontWeight.w900,
          color: AppColors.textPrimary,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.outfit(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          height: 1.2,
        ),

        // Headline styles
        headlineLarge: GoogleFonts.outfit(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          height: 1.2,
        ),
        headlineMedium: GoogleFonts.outfit(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
          height: 1.2,
        ),
        headlineSmall: GoogleFonts.outfit(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
          height: 1.2,
        ),

        // Title styles
        titleLarge: GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleMedium: GoogleFonts.outfit(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleSmall: GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),

        // Body styles
        bodyLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
          height: 1.6,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textMuted,
          height: 1.6,
        ),

        // Label styles
        labelLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textMuted,
        ),
      ),

      // Card theme
      cardTheme: const CardThemeData(
        color: AppColors.bgGlass,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusLg)),
          side: BorderSide(color: AppColors.borderColor, width: 1),
        ),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryStart,
          foregroundColor: Colors.white,
          elevation: 4,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.borderColor, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bgSecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          borderSide: const BorderSide(color: AppColors.primaryStart, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: GoogleFonts.inter(color: AppColors.textMuted, fontSize: 16),
        labelStyle: GoogleFonts.inter(
          color: AppColors.textSecondary,
          fontSize: 16,
        ),
      ),

      // Drawer theme
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.bgPrimary.withOpacity(0.98),
        elevation: 0,
      ),

      // Divider theme
      dividerTheme: const DividerThemeData(
        color: AppColors.borderColor,
        thickness: 1,
      ),
    );
  }
}
