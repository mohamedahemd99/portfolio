import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/gradient_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
            constraints: const BoxConstraints(
              maxWidth: AppSizes.contentMaxWidth,
            ),
            child: Column(
              children: [
                _buildSectionHeader(context, info),
                SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

                // Content
                if (info.isMobile)
                  Column(
                    children: [
                      _buildImage(info),
                      SizedBox(height: info.spacing(ResponsiveSpacing.lg)),
                      _buildContent(context, info),
                    ],
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildImage(info),
                      SizedBox(width: info.spacing(ResponsiveSpacing.xl)),
                      Expanded(child: _buildContent(context, info)),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, ResponsiveInfo info) {
    return Column(
      children: [
        GradientText(
          'About Me',
          gradient: AppColors.primaryGradient,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(height: info.spacing(ResponsiveSpacing.sm)),
        Container(
          width: 60,
          height: 4,
          decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        ),
      ],
    );
  }

  Widget _buildImage(ResponsiveInfo info) {
    return Container(
      width: info.isMobile ? double.infinity : 320,
      height: 320,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        image: const DecorationImage(
          image: AssetImage('assets/mohamed.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ResponsiveInfo info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter Developer & Team Lead',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: info.spacing(ResponsiveSpacing.md)),

        Text(PortfolioData.aboutMe1),
        SizedBox(height: info.spacing(ResponsiveSpacing.md)),

        Text(PortfolioData.aboutMe2),
        SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

        // Highlights
        Wrap(
          spacing: info.spacing(ResponsiveSpacing.md),
          runSpacing: info.spacing(ResponsiveSpacing.md),
          children: [
            _HighlightCard(
              icon: Icons.code,
              title: '5+ Years',
              subtitle: 'Professional Experience',
              info: info,
            ),
            _HighlightCard(
              icon: Icons.phone_android,
              title: '10+ Apps',
              subtitle: 'Published on Stores',
              info: info,
            ),
            _HighlightCard(
              icon: Icons.people,
              title: 'Team Lead',
              subtitle: 'Cross-functional Teams',
              info: info,
            ),
          ],
        ),

        SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

        // Info items
        Wrap(
          spacing: info.spacing(ResponsiveSpacing.lg),
          runSpacing: info.spacing(ResponsiveSpacing.md),
          children: [
            _InfoItem(icon: Icons.location_on, text: PortfolioData.location),
            _InfoItem(icon: Icons.location_on, text: PortfolioData.location1),
            _InfoItem(icon: Icons.school, text: 'B.Sc. Computer Science & AI'),
            _InfoItem(icon: Icons.phone, text: PortfolioData.phone),
            _InfoItem(icon: Icons.phone, text: PortfolioData.phone1),
            _InfoItem(icon: Icons.email, text: PortfolioData.email),
          ],
        ),
      ],
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final ResponsiveInfo info;

  const _HighlightCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.md)),
      width: info.isMobile ? double.infinity : 200,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(width: info.spacing(ResponsiveSpacing.sm)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primaryStart, size: 20),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: AppColors.textSecondary)),
      ],
    );
  }
}