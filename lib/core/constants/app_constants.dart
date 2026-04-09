import 'package:flutter/material.dart';

import 'app_images.dart';

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
  static const String location1 = 'Egypt';
  static const String phone = '+971 56 227 9178';
  static const String phone1 = '+20 121 0798091';
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
      'real-time systems, and strong UI/UX execution. 5+ years of experience delivering '
      'production-quality apps across iOS, Android, Web, and Desktop — with a track record '
      'in performance optimization, clean architecture, and cross-functional team leadership.';

  static const String aboutMe1 =
      'Senior Flutter Developer and Team Lead with 5+ years of experience building high-quality '
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

// ─── Project data models ──────────────────────────────────────────────────────

class ProjectData {
  final String title;
  final String description;
  final IconData icon;
  final List<String> skills;
  final String? iosUrl;
  final String? androidUrl;
  final String? badge;
  final List<String> images;

  const ProjectData({
    required this.title,
    required this.description,
    required this.icon,
    required this.skills,
    this.iosUrl,
    this.androidUrl,
    this.badge,
    this.images = const [],
  });
}

class CompanyGroup {
  final String company;
  final String period;
  final IconData companyIcon;
  final List<ProjectData> projects;

  const CompanyGroup({
    required this.company,
    required this.period,
    required this.companyIcon,
    required this.projects,
  });
}

class ProjectsData {
  ProjectsData._();

  static const List<CompanyGroup> groups = [
    CompanyGroup(
      company: 'AT World',
      period: 'Dec 2024 – Present',
      companyIcon: Icons.auto_awesome,
      projects: [
        ProjectData(
          title: 'AI Homes',
          description:
          'Comprehensive real estate marketplace with AR and real-time data. '
              'Connects developers, marketers and buyers in one AI-powered platform — '
              'targeting 5M+ brokers across 212 countries with smart contracts and '
              'white-label agency pages.',
          icon: Icons.home_work,
          skills: ['Flutter', 'AR', 'AI', 'Maps', 'Smart Contracts', 'Firebase'],
          images: [
            AppImage.homes1,
            AppImage.homes2,
            AppImage.homes3,
            AppImage.homes4,
            AppImage.homes5,
            AppImage.homes6,
            AppImage.homes7,
          ],
          iosUrl: 'https://apps.apple.com/ae/app/homes/id6744656599',
          androidUrl: 'https://play.google.com/store/apps/details?id=com.homes.radar',
        ),
        ProjectData(
          title: 'AI Radar',
          description:
          'Personal travel & discovery assistant powered by Google Places. '
              'Explore nearby attractions, restaurants, services and more through '
              'Map View, Augmented Reality, and List View with real-time navigation.',
          icon: Icons.explore,
          skills: ['Flutter', 'AR', 'Google Places', 'AdMob', 'Maps'],
          images: [
            AppImage.radar1,
            AppImage.radar2,
            AppImage.radar3,
            AppImage.radar4,
            AppImage.radar5,
            AppImage.radar6,
            AppImage.radar7,
          ],
          iosUrl: 'https://apps.apple.com/ae/app/radar/id6747173241',
          androidUrl: 'https://play.google.com/store/apps/details?id=com.atworld.atradar',
        ),
        ProjectData(
          title: 'AI Feasibility',
          description:
          'AI-powered real estate feasibility analysis in minutes. Instant '
              'financial metrics (IRR, NPV, ROI, cash flow), scenario testing, '
              'and UAE market insights for developers, investors, banks, and consultants.',
          icon: Icons.analytics,
          skills: ['Flutter', 'AI', 'Finance', 'Real Estate', 'Charts'],
          images: [
            AppImage.feasibility1,
            AppImage.feasibility2,
            AppImage.feasibility3,
            AppImage.feasibility4,
            AppImage.feasibility5,
          ],
          iosUrl: 'https://apps.apple.com/ae/app/ai-feasibility/id6755543887',
          androidUrl: 'https://play.google.com/store/apps/details?id=at.ai.feasibility.world',
        ),
        ProjectData(
          title: 'HomesXP',
          description:
          'AI-driven virtual real estate platform that transforms property '
              'investment. Reduces friction from off-plan investing with AI market '
              'analysis, data-driven recommendations, and seamless transactions.',
          icon: Icons.villa,
          skills: ['Flutter', 'AI', 'Real Estate', 'Investment', 'Firebase'],
          images: [
            AppImage.xp1,
            AppImage.xp2,
            AppImage.xp3,
            AppImage.xp4,
            AppImage.xp5,
            AppImage.xp6,
            AppImage.xp7,
          ],
          iosUrl: 'https://apps.apple.com/ae/app/homesxp/id6752358412',
          androidUrl: 'https://play.google.com/store/apps/details?id=com.homesxp.homesxp',
        ),
      ],
    ),
    CompanyGroup(
      company: 'Yummy.ps',
      period: 'Oct 2024 – Jun 2025',
      companyIcon: Icons.restaurant,
      projects: [
        ProjectData(
          title: 'Yummy',
          description:
          'All-in-one delivery app for food, groceries, flowers, and more. '
              'Features real-time tracking, loyalty points, in-app wallet, and a '
              'special feature to send food & gifts to loved ones in Palestine from abroad.',
          icon: Icons.delivery_dining,
          skills: ['Flutter', 'UI Redesign', 'Real-time Tracking', 'Payments', 'Firebase'],
          images: [
            AppImage.yummy1,
            AppImage.yummy2,
            AppImage.yummy3,
            AppImage.yummy4,
            AppImage.yummy5,
            AppImage.yummy6,
          ],
          iosUrl: 'https://apps.apple.com/il/app/yummy-food-grocery-more/id1448247070',
          androidUrl: 'https://play.google.com/store/apps/details?id=app.yummy.ps',
          badge: '100K+ Downloads',
        ),
      ],
    ),
    CompanyGroup(
      company: 'Syana Co.',
      period: 'Jan 2024 – Nov 2024',
      companyIcon: Icons.build_circle,
      projects: [
        ProjectData(
          title: 'Syana',
          description:
          'On-demand maintenance & automotive app covering plumbing, electrical, '
              'AC, and home services. Features a bidding system, invoice generation '
              'via MyFatoorah, wallet, and Apple Pay support.',
          icon: Icons.home_repair_service,
          skills: ['Flutter', 'Maps', 'MyFatoorah', 'Apple Pay', 'Firebase', 'CI/CD'],
          images: [
            AppImage.syana1,
            AppImage.syana2,
            AppImage.syana3,
            AppImage.syana4,
            AppImage.syana5,
            AppImage.syana6,
            AppImage.syana7,
            AppImage.syana8,
          ],
        ),
        ProjectData(
          title: 'Syana Hero',
          description:
          'Service provider companion app for Syana. Professionals manage '
              'incoming bids, jobs, invoices, and earnings with Firebase auth, '
              'analytics, push notifications, and CI/CD pipelines.',
          icon: Icons.engineering,
          skills: ['Flutter', 'Firebase', 'Push Notifications', 'Payments', 'CI/CD'],
        ),
      ],
    ),
    CompanyGroup(
      company: 'Root Co.',
      period: 'Dec 2022 – Sep 2024',
      companyIcon: Icons.developer_board,
      projects: [
        ProjectData(
          title: 'WeCare',
          description:
          'IoT-powered school bus safety app. Integrates GPS live tracking, '
              'NFC for student attendance, and live camera streaming from the bus — '
              'giving parents full visibility and peace of mind.',
          icon: Icons.bus_alert,
          skills: ['Flutter', 'IoT', 'GPS Tracking', 'Live Streaming', 'NFC', 'Raspberry Pi'],
          images: [AppImage.wecare1, AppImage.wecare2, AppImage.wecare3, AppImage.wecare4],
        ),
        ProjectData(
          title: 'Logist – Client',
          description:
          'Heavy shipping request app for clients. Book truck deliveries, '
              'track shipments live on Google Maps, and receive push notifications '
              'on all status updates.',
          icon: Icons.local_shipping,
          skills: ['Flutter', 'Google Maps', 'Live Location', 'Push Notifications'],
          images: [
            AppImage.logosit1,
            AppImage.logosit2,
            AppImage.logosit3,
            AppImage.logosit4,
            AppImage.logosit5,
            AppImage.logosit6,
            AppImage.logosit7,
            AppImage.logosit8,
            AppImage.logosit9,
          ],
        ),
        ProjectData(
          title: 'Logist – Driver',
          description:
          'Driver companion for the Logist platform. Accept heavy shipping '
              'jobs, navigate with real-time Google Maps, share live location '
              'with clients, and manage deliveries end-to-end.',
          icon: Icons.drive_eta,
          skills: ['Flutter', 'Google Maps', 'Live Location', 'Push Notifications'],
          images: [
            AppImage.logosit10,
            AppImage.logosit11,
            AppImage.logosit12,
            AppImage.logosit13,
            AppImage.logosit14,
            AppImage.logosit15,
            AppImage.logosit16,
            AppImage.logosit17,
            AppImage.logosit18,
          ],
        ),
        ProjectData(
          title: 'Flexi',
          description:
          'All-in-one gym management ecosystem with three roles — clients, '
              'coaches, and providers. Manage subscriptions, book sessions, track '
              'fitness progress, and purchase gym-related products.',
          icon: Icons.fitness_center,
          skills: ['Flutter', 'Multi-role', 'Subscriptions', 'Payments', 'Firebase'],
        ),
      ],
    ),
    CompanyGroup(
      company: 'Tqnia IT',
      period: 'Apr 2022 – Mar 2023',
      companyIcon: Icons.computer,
      projects: [
        ProjectData(
          title: 'Tqnia CS',
          description:
          'Client portal for Tqnia IT — 15+ years in the Middle East. '
              'Track project requests, support tickets, domain management, '
              'and invoices all in one place.',
          icon: Icons.support_agent,
          skills: ['Flutter', 'Firebase', 'REST APIs', 'Push Notifications'],
          images: [
            AppImage.tqniaCs1,
            AppImage.tqniaCs2,
            AppImage.tqniaCs3,
            AppImage.tqniaCs4,
            AppImage.tqniaCs5,
            AppImage.tqniaCs6,
          ],
          iosUrl: 'https://apps.apple.com/sa/app/%D8%AA%D9%82%D9%86%D9%8A%D8%A9-cs/id6450683976',
        ),
        ProjectData(
          title: 'From Home Meal',
          description:
          'Food ordering app with cash-on-delivery and secure online payment '
              'gateway. Discover home-cooked meals and local food with a simple, '
              'fast ordering experience.',
          icon: Icons.soup_kitchen,
          skills: ['Flutter', 'Payments', 'Firebase', 'Push Notifications'],
          images: [
            AppImage.fromHomeMeal1,
            AppImage.fromHomeMeal2,
            AppImage.fromHomeMeal3,
            AppImage.fromHomeMeal4,
          ],
          androidUrl: 'https://appgallery.huawei.com/#/app/C106764857',
        ),
        ProjectData(
          title: 'Ajarhaa',
          description:
          'Digital leasing platform for cars, chalets, offices, and '
              'electronics. Secure payments, flexible options, user listings '
              'for passive income, and ratings & reviews.',
          icon: Icons.key,
          skills: ['Flutter', 'Rental', 'Booking', 'Maps', 'Payments'],
          images: [AppImage.ajarha1, AppImage.ajarha2, AppImage.ajarha3, AppImage.ajarha4],
          androidUrl: 'https://play.google.com/store/apps/details?id=com.inspireui.ajerha',
        ),
      ],
    ),
    CompanyGroup(
      company: 'ForAll FA',
      period: 'Apr 2021 – Mar 2022',
      companyIcon: Icons.public,
      projects: [
        ProjectData(
          title: 'ForAll – Client',
          description:
          'Global super app with 40+ services across 50+ countries and '
              '300 cities in 17 languages. Shopping, beauty, travel, healthcare, '
              'automotive, real estate, and more — all in one place.',
          icon: Icons.apps,
          skills: ['Flutter', 'Multi-service', 'Maps', 'Payments', 'Firebase'],
          images: [
            AppImage.forall1,
            AppImage.forall2,
            AppImage.forall3,
            AppImage.forall4,
            AppImage.forall5,
            AppImage.forall6,
            AppImage.forall7,
            AppImage.forall8,
          ],
          iosUrl: 'https://apps.apple.com/us/app/forall/id1592120593',
          androidUrl: 'https://play.google.com/store/apps/details?id=com.easyindex.forall2030',
        ),
        ProjectData(
          title: 'ForAll – Vendor',
          description:
          'Business portal for ForAll. List services, manage bookings, '
              'and reach customers across 60+ countries.',
          icon: Icons.storefront,
          skills: ['Flutter', 'Multi-service', 'Dashboard', 'Firebase'],
          images: [
            AppImage.forallVendor1,
            AppImage.forallVendor2,
            AppImage.forallVendor3,
            AppImage.forallVendor4,
            AppImage.forallVendor5,
            AppImage.forallVendor6,
            AppImage.forallVendor7,
            AppImage.forallVendor8,
          ],
          iosUrl: 'https://apps.apple.com/us/app/forall-vendors/id1602962621',
          androidUrl: 'https://play.google.com/store/apps/details?id=com.easyindex.favendor',
        ),
        ProjectData(
          title: 'ForAll – Sales',
          description:
          'Sales management app for ForAll teams. Track performance across '
              'roles (GM, Supervisor, Team Lead), manage your team, receive '
              'commission alerts, and monitor deal activity.',
          icon: Icons.leaderboard,
          skills: ['Flutter', 'Analytics', 'Team Management', 'Firebase'],
          images: [
            AppImage.forallSales1,
            AppImage.forallSales2,
            AppImage.forallSales3,
            AppImage.forallSales4,
            AppImage.forallSales5,
            AppImage.forallSales6,
            AppImage.forallSales7,
          ],
          iosUrl: 'https://apps.apple.com/us/app/forall-sales/id1607065808',
          androidUrl: 'https://play.google.com/store/apps/details?id=com.forall.forallhr',
        ),
        ProjectData(
          title: 'ForAll – Rides',
          description:
          'Delivery & rides driver app. Earn on your own schedule using '
              'your car or scooter with flexible earnings, secure delivery '
              'workflow, and fast payments.',
          icon: Icons.two_wheeler,
          skills: ['Flutter', 'Maps', 'Live Location', 'Payments', 'Firebase'],
          images: [
            AppImage.forallRide1,
            AppImage.forallRide2,
            AppImage.forallRide3,
            AppImage.forallRide4,
            AppImage.forallRide5,
            AppImage.forallRide6,
            AppImage.forallRide7,
            AppImage.forallRide8,
          ],
          iosUrl: 'https://apps.apple.com/us/app/forall-riders/id1600042031',
          androidUrl: 'https://play.google.com/store/apps/details?id=com.easyindex.forallcap2030',
        ),
      ],
    ),
  ];
}