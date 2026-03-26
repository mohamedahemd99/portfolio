import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgSecondary,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Text(
            '© ${DateTime.now().year} Mohamed Ahmed. All rights reserved.',
            style: const TextStyle(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Built with ',
                style: TextStyle(color: AppColors.textSecondary),
              ),
              Icon(Icons.favorite, color: Colors.red, size: 16),
              Text(
                ' using Flutter',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
