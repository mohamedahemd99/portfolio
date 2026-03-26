import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/gradient_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        return Container(
          constraints: const BoxConstraints(minHeight: 800),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryStart.withOpacity(0.1),
                AppColors.primaryEnd.withOpacity(0.1),
              ],
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: info.spacing(ResponsiveSpacing.md),
              vertical: info.spacing(ResponsiveSpacing.xxl),
            ),
            constraints: const BoxConstraints(
              maxWidth: AppSizes.contentMaxWidth,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

                // Greeting
                Text(
                  "Hello, I'm",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                SizedBox(height: info.spacing(ResponsiveSpacing.sm)),

                // Name
                GradientText(
                  PortfolioData.name,
                  gradient: AppColors.primaryGradient,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: info.responsiveFontSize(info.isMobile ? 40 : 56),
                  ),
                ),

                SizedBox(height: info.spacing(ResponsiveSpacing.sm)),

                // Animated Titles
                SizedBox(
                  height: info.responsiveFontSize(info.isMobile ? 32 : 40),
                  child: Row(
                    children: [
                      AnimatedTextKit(
                        repeatForever: true,
                        pause: const Duration(seconds: 2),
                        animatedTexts: PortfolioData.animatedTitles.map((
                          title,
                        ) {
                          return TypewriterAnimatedText(
                            title,
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontSize: info.responsiveFontSize(
                                    info.isMobile ? 24 : 32,
                                  ),
                                  color: AppColors.accentStart,
                                ),
                            speed: const Duration(milliseconds: 100),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

                // Bio
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Text(
                    PortfolioData.bioSummary,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),

                SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

                // Buttons
                Wrap(
                  spacing: info.spacing(ResponsiveSpacing.md),
                  runSpacing: info.spacing(ResponsiveSpacing.sm),
                  children: [
                    GradientButton(
                      text: 'View My Work',
                      icon: Icons.work,
                      onPressed: () {},
                    ),
                    GradientButton(
                      text: 'Get In Touch',
                      icon: Icons.email,
                      gradient: const LinearGradient(
                        colors: [AppColors.bgGlass, AppColors.bgGlassHover],
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

                SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

                // Social Links
                Row(
                  children: [
                    _SocialIcon(
                      icon: FontAwesomeIcons.linkedin,
                      onTap: () => _launchURL(PortfolioData.linkedIn),
                    ),
                    SizedBox(width: info.spacing(ResponsiveSpacing.md)),
                    _SocialIcon(
                      icon: FontAwesomeIcons.github,
                      onTap: () => _launchURL(PortfolioData.github),
                    ),
                    SizedBox(width: info.spacing(ResponsiveSpacing.md)),
                    _SocialIcon(
                      icon: FontAwesomeIcons.envelope,
                      onTap: () => _launchURL('mailto:${PortfolioData.email}'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({required this.icon, required this.onTap});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppDurations.normal,
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: _isHovered ? AppColors.primaryGradient : null,
            color: _isHovered ? null : AppColors.bgGlass,
            border: Border.all(
              color: _isHovered ? Colors.transparent : AppColors.borderColor,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          child: Icon(widget.icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
