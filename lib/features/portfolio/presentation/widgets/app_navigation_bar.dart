import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class AppNavigationBar extends StatefulWidget {
  final ScrollController scrollController;
  final Function(String) onNavigate;

  const AppNavigationBar({
    super.key,
    required this.scrollController,
    required this.onNavigate,
  });

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.scrollController.offset > 100 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (widget.scrollController.offset <= 100 && _isScrolled) {
      setState(() => _isScrolled = false);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        return AnimatedContainer(
          duration: AppDurations.normal,
          decoration: BoxDecoration(
            color: AppColors.bgPrimary.withOpacity(_isScrolled ? 0.95 : 0),
            border: Border(
              bottom: BorderSide(
                color: _isScrolled ? AppColors.borderColor : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: info.spacing(ResponsiveSpacing.md),
              vertical: 16,
            ),
            constraints: const BoxConstraints(
              maxWidth: AppSizes.contentMaxWidth,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                _buildLogo(context),

                // Navigation links (desktop/tablet only)
                if (!info.isMobile) _buildNavLinks(context, info),

                // Mobile menu button
                if (info.isMobile) _buildMobileMenuButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.primaryGradient,
      ),
      padding: const EdgeInsets.all(2),
      child: ClipOval(
        child: Image.asset(
          'assets/mohamed.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildNavLinks(BuildContext context, ResponsiveInfo info) {
    final items = [
      ('Home', 'home'),
      ('About', 'about'),
      ('Skills', 'skills'),
      ('Experience', 'experience'),
      ('Projects', 'projects'),
      ('Contact', 'contact'),
    ];

    return Row(
      children: items.map((item) {
        return Padding(
          padding: EdgeInsets.only(left: info.spacing(ResponsiveSpacing.md)),
          child: _NavLink(
            text: item.$1,
            onTap: () => widget.onNavigate(item.$2),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileMenuButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.bgPrimary,
          builder: (context) => _MobileMenu(onNavigate: widget.onNavigate),
        );
      },
    );
  }
}

class _NavLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavLink({required this.text, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: _isHovered
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: AppDurations.fast,
              width: _isHovered ? 40 : 0,
              height: 2,
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final Function(String) onNavigate;

  const _MobileMenu({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Home', 'home', Icons.home),
      ('About', 'about', Icons.person),
      ('Skills', 'skills', Icons.code),
      ('Experience', 'experience', Icons.work),
      ('Projects', 'projects', Icons.folder),
      ('Contact', 'contact', Icons.email),
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items.map((item) {
          return ListTile(
            leading: Icon(item.$3, color: AppColors.primaryStart),
            title: Text(item.$1),
            onTap: () {
              Navigator.pop(context);
              onNavigate(item.$2);
            },
          );
        }).toList(),
      ),
    );
  }
}