import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';

import '../widgets/about_section.dart';
import '../widgets/app_navigation_bar.dart';
import '../widgets/contact_section.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main scrollable content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Hero Section
              SliverToBoxAdapter(child: HeroSection(key: _heroKey)),

              // About Section
              SliverToBoxAdapter(child: AboutSection(key: _aboutKey)),

              // Skills Section
              SliverToBoxAdapter(child: SkillsSection(key: _skillsKey)),

              // Experience Section
              SliverToBoxAdapter(child: ExperienceSection(key: _experienceKey)),

              // Projects Section
              SliverToBoxAdapter(child: ProjectsSection(key: _projectsKey)),

              // Education Section
              SliverToBoxAdapter(child: EducationSection(key: _educationKey)),

              // Contact Section
              SliverToBoxAdapter(child: ContactSection(key: _contactKey)),

              // Footer
              const SliverToBoxAdapter(child: FooterSection()),
            ],
          ),

          // Navigation bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppNavigationBar(
              scrollController: _scrollController,
              onNavigate: (section) {
                switch (section) {
                  case 'home':
                    _scrollToSection(_heroKey);
                    break;
                  case 'about':
                    _scrollToSection(_aboutKey);
                    break;
                  case 'skills':
                    _scrollToSection(_skillsKey);
                    break;
                  case 'experience':
                    _scrollToSection(_experienceKey);
                    break;
                  case 'projects':
                    _scrollToSection(_projectsKey);
                    break;
                  case 'education':
                    _scrollToSection(_educationKey);
                    break;
                  case 'contact':
                    _scrollToSection(_contactKey);
                    break;
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ResponsiveBuilder(
        builder: (context, info) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity:
                _scrollController.hasClients && _scrollController.offset > 500
                ? 1.0
                : 0.0,
            child: FloatingActionButton(
              onPressed: () => _scrollToSection(_heroKey),
              child: const Icon(Icons.arrow_upward),
            ),
          );
        },
      ),
    );
  }
}
