import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/gradient_text.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: info.spacing(ResponsiveSpacing.md),
            vertical: info.spacing(ResponsiveSpacing.xxl),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: AppSizes.contentMaxWidth,
            ),
            child: Column(
              children: [
                GradientText(
                  'Featured Projects',
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

                // Projects Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cols = info.isMobile ? 1 : (info.isTablet ? 2 : 3);
                    final spacing = info.spacing(ResponsiveSpacing.lg);
                    final cardW = (constraints.maxWidth - spacing * (cols - 1)) / cols;
                    Widget card(Widget child) => SizedBox(width: cardW, child: child);
                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: [
                        card(const _ProjectCard(
                          title: 'HOMES Real Estate Platform',
                          description: 'A real estate platform with advanced property browsing, interactive maps, AR-style views, and multi-role experiences for brokers, developers, and investors.',
                          icon: Icons.home,
                          skills: ['Flutter', 'AR', 'Maps', 'Firebase', 'Team Lead'],
                          iosUrl: 'https://apps.apple.com/ae/app/homes/id6744656599',
                          androidUrl: 'https://play.google.com/store/apps/details?id=com.homes.radar',
                        )),
                        card(const _ProjectCard(
                          title: 'Radar App',
                          description: 'A tourism and discovery app with radar-style AR exploration, map view, and list view, including monetization and real-time interactions.',
                          icon: Icons.explore,
                          skills: ['Flutter', 'AR Location', 'AdMob', 'Maps'],
                          iosUrl: 'https://apps.apple.com/ae/app/radar/id6747173241',
                          androidUrl: 'https://play.google.com/store/apps/details?id=com.atworld.atradar',
                        )),
                        card(const _ProjectCard(
                          title: 'Yummy.ps',
                          description: 'A food delivery app for ordering from popular restaurants and food brands. Contributed UI redesign and performance improvements across the full app.',
                          icon: Icons.restaurant,
                          skills: ['Flutter', 'UI Redesign', 'Food Delivery', 'Performance'],
                          iosUrl: 'https://apps.apple.com/ae/app/yummy-food-grocery-more/id1448247070',
                          androidUrl: 'https://play.google.com/store/apps/details?id=app.yummy.ps',
                        )),
                        card(const _ProjectCard(
                          title: 'Syana',
                          description: 'A maintenance and roadside assistance solution with separate flows for users and service providers.',
                          icon: Icons.build,
                          skills: ['Flutter', 'Maps', 'Payment', 'Firebase', 'CI/CD'],
                        )),
                        card(const _ProjectCard(
                          title: 'Ajrhaa',
                          description: 'An electronic rental platform for cars, chalets, offices, and devices.',
                          icon: Icons.key,
                          skills: ['Flutter', 'Rental', 'Booking', 'Maps'],
                        )),
                        card(const _ProjectCard(
                          title: 'WeCare Apps',
                          description: 'School bus safety and monitoring apps with GPS tracking and live camera streaming.',
                          icon: Icons.bus_alert,
                          skills: ['Flutter', 'GPS', 'Live Stream', 'IoT'],
                        )),
                        card(const _ProjectCard(
                          title: 'Flexi Ecosystem',
                          description: 'A fitness platform including apps for users, coaches, and providers.',
                          icon: Icons.fitness_center,
                          skills: ['Flutter', 'Fitness', 'Multi-role'],
                        )),
                        card(const _ProjectCard(
                          title: 'Logist Apps',
                          description: 'Goods transportation and truck delivery apps with request and driver workflows.',
                          icon: Icons.local_shipping,
                          skills: ['Flutter', 'Logistics', 'Maps', 'Real-time'],
                        )),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final List<String> skills;
  final String? iosUrl;
  final String? androidUrl;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.skills,
    this.iosUrl,
    this.androidUrl,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: AppDurations.normal,
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        child: GlassContainer(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon header
              Container(
                height: 180,
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppSizes.radiusLg),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        widget.icon,
                        size: 80,
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    if (_isHovered &&
                        (widget.iosUrl != null || widget.androidUrl != null))
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.bgPrimary.withValues(alpha: 0.95),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(AppSizes.radiusLg),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.iosUrl != null)
                                _LinkButton(
                                  label: 'iOS App',
                                  icon: Icons.apple,
                                  onTap: () => _launchURL(widget.iosUrl!),
                                ),
                              if (widget.androidUrl != null) ...[
                                const SizedBox(height: 12),
                                _LinkButton(
                                  label: 'Android App',
                                  icon: Icons.android,
                                  onTap: () => _launchURL(widget.androidUrl!),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.skills.map((skill) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
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
                              fontSize: 11,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _LinkButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _LinkButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
