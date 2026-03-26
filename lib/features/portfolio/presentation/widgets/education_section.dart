import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/gradient_text.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
                GradientText(
                  'Education & Certifications',
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

                if (info.isMobile)
                  Column(
                    children: [
                      _buildEducationCard(info),
                      SizedBox(height: info.spacing(ResponsiveSpacing.xl)),
                      _buildCertificationsCard(info),
                    ],
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildEducationCard(info)),
                      SizedBox(width: info.spacing(ResponsiveSpacing.xl)),
                      Expanded(child: _buildCertificationsCard(info)),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEducationCard(ResponsiveInfo info) {
    return GlassContainer(
      padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.xl)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: const Icon(Icons.school, size: 40, color: Colors.white),
          ),
          SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

          const Text(
            'Education',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

          const Text(
            'B.Sc. in Computer Science & Artificial Intelligence',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),

          const Text(
            'Helwan University, Egypt',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.accentStart,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),

          const Text(
            '2018 - 2022',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 4),

          const Text(
            'GPA: 3.3 / 4.0',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationsCard(ResponsiveInfo info) {
    final certifications = [
      'Flutter Development Bootcamp with Dart',
      'Flutter Clean Architecture',
      'Introduction to Algorithms',
      'Introduction to Data Structures',
      'Introduction to Firebase',
      'Python Fundamentals',
      'C/C++ Fundamentals',
      'Machine Learning Preprocessing',
    ];

    return GlassContainer(
      padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.xl)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            ),
            child: const Icon(
              Icons.card_membership,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

          const Text(
            'Certifications',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: certifications.length,
            separatorBuilder: (_, _) =>
                const Divider(color: AppColors.borderColor, height: 16),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.primaryStart,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      certifications[index],
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
