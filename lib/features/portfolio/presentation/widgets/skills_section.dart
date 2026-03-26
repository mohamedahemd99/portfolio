import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/gradient_text.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
                  'Technical Skills',
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
                SizedBox(height: info.spacing(ResponsiveSpacing.md)),
                Text(
                  'Technologies and tools I work with',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

                // Skills Grid
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
                        card(const _SkillCategory(
                          title: 'Languages',
                          icon: FontAwesomeIcons.code,
                          skills: ['Dart', 'Python', 'Java', 'C++', 'C', 'Swift'],
                        )),
                        card(const _SkillCategory(
                          title: 'Frameworks & Tools',
                          icon: FontAwesomeIcons.screwdriverWrench,
                          skills: ['Flutter', 'Android Studio', 'VS Code', 'Xcode'],
                        )),
                        card(const _SkillCategory(
                          title: 'State Management',
                          icon: FontAwesomeIcons.sitemap,
                          skills: ['Bloc', 'Provider', 'GetX'],
                        )),
                        card(const _SkillCategory(
                          title: 'Integrations',
                          icon: FontAwesomeIcons.plug,
                          skills: [
                            'Firebase',
                            'Google Maps',
                            'REST APIs',
                            'WebSockets',
                            'MyFatoorah',
                            'AdMob',
                          ],
                        )),
                        card(const _SkillCategory(
                          title: 'Architecture',
                          icon: FontAwesomeIcons.diagramProject,
                          skills: [
                            'Clean Architecture',
                            'MVVM',
                            'MVC',
                            'SOLID',
                            'OOP',
                            'Design Patterns',
                          ],
                        )),
                        card(const _SkillCategory(
                          title: 'DevOps',
                          icon: FontAwesomeIcons.gears,
                          skills: ['Git', 'GitHub', 'GitLab', 'CI/CD', 'CodeMagic'],
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

class _SkillCategory extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> skills;

  const _SkillCategory({
    required this.title,
    required this.icon,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryStart, size: 24),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.borderColor),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) => _SkillChip(skill)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;

  const _SkillChip(this.label);

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: AppDurations.fast,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: _isHovered ? AppColors.primaryGradient : null,
          color: _isHovered ? null : AppColors.bgSecondary,
          border: Border.all(
            color: _isHovered ? Colors.transparent : AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            color: _isHovered ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
