import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/gradient_text.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        return Container(
          color: AppColors.bgSecondary,
          padding: EdgeInsets.symmetric(
            horizontal: info.spacing(ResponsiveSpacing.md),
            vertical: info.spacing(ResponsiveSpacing.xxl),
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                GradientText(
                  'Professional Experience',
                  gradient: AppColors.primaryGradient,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.sm)),
                Container(
                  width: 60,
                  height: 4,
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradient,
                  ),
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

                const _ExperienceItem(
                  date: 'Dec 2024 – Present',
                  title: 'Team Lead / Senior Flutter Developer',
                  company: 'HOMES Real Estate Platform',
                  location: 'Dubai, UAE · Full-time',
                  description: [
                    'Started as Mobile Flutter Developer, then promoted to Team Lead',
                    'Managed coordination across backend, frontend, mobile, UI/UX, and QA',
                    'Led development of a real estate platform for brokers, developers, and investors',
                    'Built advanced features including interactive maps, AR/radar views, multilingual support, pagination, and optimized API flows',
                    'Integrated Firebase services, monetization features, analytics, and deployment pipelines',
                    'Improved performance and scalability across the platform',
                  ],
                  skills: [
                    'Flutter',
                    'Team Leadership',
                    'Firebase',
                    'Google Maps',
                    'AR Integration',
                    'CI/CD',
                    'AdMob',
                  ],
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

                const _ExperienceItem(
                  date: 'Oct 2024 – Jun 2025',
                  title: 'Flutter Developer',
                  company: 'Yummy.ps',
                  location: 'Remote',
                  description: [
                    'Worked on the UI revamp of the full food delivery application',
                    'Improved the design quality and user experience across app screens',
                    'Focused on performance improvement, smoother app behavior, and better responsiveness',
                    'Enhanced usability and visual consistency across the product',
                  ],
                  skills: [
                    'Flutter',
                    'UI Redesign',
                    'Performance Optimization',
                    'Food Delivery',
                  ],
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

                const _ExperienceItem(
                  date: 'Jan 2024 – Nov 2024',
                  title: 'Flutter Developer',
                  company: 'Syana Co.',
                  location: 'Saudi Arabia · Remote',
                  description: [
                    'Developed Syana and Syana Hero apps for iOS and Android',
                    'Integrated Google Maps, authentication, APIs, payment SDK, push notifications, camera modules, analytics, and CI/CD',
                    'Built responsive screens and optimized app performance',
                  ],
                  skills: [
                    'Flutter',
                    'Google Maps',
                    'Payment SDK',
                    'Firebase',
                    'CI/CD',
                    'Push Notifications',
                  ],
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

                const _ExperienceItem(
                  date: 'Dec 2022 – Sep 2024',
                  title: 'Flutter Developer',
                  company: 'Root Co.',
                  location: 'Egypt · Hybrid',
                  description: [
                    'Built apps for iOS, Android, Windows, and Linux',
                    'Worked on real-time tracking, live stream integration, camera modules, and backend connectivity',
                    'Integrated Raspberry Pi / embedded workflows',
                    'Delivered production-ready cross-platform apps',
                  ],
                  skills: [
                    'Flutter',
                    'Multi-platform',
                    'IoT / Raspberry Pi',
                    'GPS Tracking',
                    'Live Streaming',
                  ],
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

                const _ExperienceItem(
                  date: 'Apr 2022 – Mar 2023',
                  title: 'Flutter Developer',
                  company: 'Tqnia IT',
                  location: 'Saudi Arabia · Remote',
                  description: [
                    'Developed multiple applications including AlAttar, From Home Meal, Tpdel, and CS Tqnia',
                    'Implemented Firebase, APIs, push notifications, maps, and animations',
                  ],
                  skills: [
                    'Flutter',
                    'Firebase',
                    'Google Maps',
                    'Payment Integration',
                    'Push Notifications',
                  ],
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

                const _ExperienceItem(
                  date: 'Apr 2021 – Mar 2022',
                  title: 'Flutter Developer',
                  company: 'ForAll FA',
                  location: 'Saudi Arabia / Egypt · On-site',
                  description: [
                    'Built e-commerce and service-based applications',
                    'Worked on customer, vendor, driver, and HR solutions',
                    'Integrated maps, payments, backend services, and notifications',
                  ],
                  skills: [
                    'Flutter',
                    'E-commerce',
                    'Multi-app Ecosystem',
                    'Firebase',
                    'Payment Integration',
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final String date;
  final String title;
  final String company;
  final String location;
  final List<String> description;
  final List<String> skills;

  const _ExperienceItem({
    required this.date,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.bgSecondary, width: 3),
                  ),
                ),
                Container(
                  width: 2,
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: AppColors.primaryGradient,
                  ),
                ),
              ],
            ),

            SizedBox(width: info.spacing(ResponsiveSpacing.lg)),

            // Content
            Expanded(
              child: GlassContainer(
                padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.lg)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      ),
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: info.spacing(ResponsiveSpacing.md)),

                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Company
                    Text(
                      company,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.accentStart,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Location
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textMuted,
                      ),
                    ),

                    SizedBox(height: info.spacing(ResponsiveSpacing.md)),

                    // Description
                    ...description.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '▹ ',
                              style: TextStyle(color: AppColors.primaryStart),
                            ),
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: info.spacing(ResponsiveSpacing.md)),

                    // Skills
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: skills.map((skill) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.bgPrimary,
                            border: Border.all(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(
                              AppSizes.radiusSm,
                            ),
                          ),
                          child: Text(
                            skill,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
