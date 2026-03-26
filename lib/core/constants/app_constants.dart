import 'package:flutter/material.dart';

/// App-wide color constants matching the HTML/CSS portfolio design
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary gradient colors
  static const Color primaryStart = Color(0xFF667EEA);
  static const Color primaryEnd = Color(0xFF764BA2);

  // Secondary gradient colors
  static const Color secondaryStart = Color(0xFFF093FB);
  static const Color secondaryEnd = Color(0xFFF5576C);

  // Accent gradient colors
  static const Color accentStart = Color(0xFF4FACFE);
  static const Color accentEnd = Color(0xFF00F2FE);

  // Background colors (Dark theme)
  static const Color bgPrimary = Color(0xFF0A0E27);
  static const Color bgSecondary = Color(0xFF151932);
  static const Color bgTertiary = Color(0xFF1E2139);
  static const Color bgGlass = Color(0x0DFFFFFF); // rgba(255, 255, 255, 0.05)
  static const Color bgGlassHover = Color(
    0x1AFFFFFF,
  ); // rgba(255, 255, 255, 0.1)

  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB8B9C7);
  static const Color textMuted = Color(0xFF6B7280);

  // Border colors
  static const Color borderColor = Color(
    0x1AFFFFFF,
  ); // rgba(255, 255, 255, 0.1)

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryStart, primaryEnd],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondaryStart, secondaryEnd],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentStart, accentEnd],
  );
}

/// App-wide text style constants
class AppTextStyles {
  AppTextStyles._();

  // Font families
  static const String fontPrimary = 'Inter';
  static const String fontHeading = 'Outfit';
}

/// App-wide spacing and sizing constants
class AppSizes {
  AppSizes._();

  // Border radius
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;

  // Icon sizes
  static const double iconSm = 20.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;

  // Content max width
  static const double contentMaxWidth = 1200.0;
}

/// Portfolio data constants
class PortfolioData {
  PortfolioData._();

  static const String name = 'Mohamed Ahmed';
  static const String role = 'Senior Flutter Developer | Team Lead';
  static const String location = 'Dubai, UAE';
  static const String phone = '+971 56 227 9178';
  static const String email = 'memocr426@gmail.com';
  static const String linkedIn =
      'https://linkedin.com/in/mohamed-ahmed-3090531a0';
  static const String github = 'https://github.com/mohamedahemd99';

  static const List<String> animatedTitles = [
    'Senior Flutter Developer',
    'Team Lead',
    'Mobile App Architect',
    'Clean Architecture Expert',
    'iOS & Android Developer',
    'Multi-platform Engineer',
  ];

  static const String bioSummary =
      'Building scalable, high-performance mobile and multi-platform apps with Flutter, '
      'real-time systems, and strong UI/UX execution. 4+ years of experience delivering '
      'production-quality apps across iOS, Android, Web, and Desktop — with a track record '
      'in performance optimization, clean architecture, and cross-functional team leadership.';

  static const String aboutMe1 =
      'Senior Flutter Developer and Team Lead with 4+ years of experience building high-quality '
      'applications across iOS, Android, Web, and Desktop. Currently leading a cross-functional '
      'team at HOMES Real Estate Platform in Dubai — managing backend, frontend, mobile, UI/UX, '
      'and QA across full product delivery cycles.';

  static const String aboutMe2 =
      'Strong background in Flutter architecture, state management (Bloc, Provider, GetX), '
      'Firebase, REST APIs, WebSockets, maps, payments, and real-time features. My work spans '
      'real estate platforms with AR views, food delivery apps, school bus safety systems, '
      'fitness ecosystems, and rental marketplaces — always focused on UI quality, app '
      'performance, scalability, and clean engineering.';
}

/// Animation duration constants
class AppDurations {
  AppDurations._();

  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}
