import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/portfolio/presentation/pages/portfolio_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mohamed Ahmed - Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioPage(),
    );
  }
}
