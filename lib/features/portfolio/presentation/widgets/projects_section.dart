import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/gradient_text.dart';

// ─── Section ──────────────────────────────────────────────────────────────────

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
            constraints: const BoxConstraints(maxWidth: AppSizes.contentMaxWidth),
            child: Column(
              children: [
                _SectionHeader(info: info),
                SizedBox(height: info.spacing(ResponsiveSpacing.xxl)),
                ...ProjectsData.groups.map(
                      (g) => _CompanyGroup(group: g, info: info),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ─── Section header ───────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final ResponsiveInfo info;
  const _SectionHeader({required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        ),
        SizedBox(height: info.spacing(ResponsiveSpacing.sm)),
        Text(
          "Apps I've built across companies and industries",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

// ─── Company group ────────────────────────────────────────────────────────────

class _CompanyGroup extends StatelessWidget {
  final CompanyGroup group;
  final ResponsiveInfo info;
  const _CompanyGroup({required this.group, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CompanyHeader(group: group),
        SizedBox(height: info.spacing(ResponsiveSpacing.lg)),
        _ProjectsGrid(projects: group.projects, info: info),
        SizedBox(height: info.spacing(ResponsiveSpacing.xxl)),
        _GradientDivider(),
        SizedBox(height: info.spacing(ResponsiveSpacing.xxl)),
      ],
    );
  }
}

class _CompanyHeader extends StatelessWidget {
  final CompanyGroup group;
  const _CompanyHeader({required this.group});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          child: Icon(group.companyIcon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              group.company,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              group.period,
              style: const TextStyle(fontSize: 13, color: AppColors.accentStart),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  final List<ProjectData> projects;
  final ResponsiveInfo info;
  const _ProjectsGrid({required this.projects, required this.info});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = info.isMobile ? 1 : (info.isTablet ? 2 : 3);
        final spacing = info.spacing(ResponsiveSpacing.lg);
        final cardW = (constraints.maxWidth - spacing * (cols - 1)) / cols;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: projects
              .map((p) => SizedBox(width: cardW, child: _ProjectCard(project: p)))
              .toList(),
        );
      },
    );
  }
}

class _GradientDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, AppColors.borderColor, Colors.transparent],
        ),
      ),
    );
  }
}

// ─── Project card ─────────────────────────────────────────────────────────────

class _ProjectCard extends StatefulWidget {
  final ProjectData project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  void _openDetail() {
    showDialog(
      context: context,
      builder: (_) => _ProjectDetailDialog(project: widget.project),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _openDetail,
        child: AnimatedContainer(
          duration: AppDurations.normal,
          transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
          child: GlassContainer(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CardHeader(project: p, isHovered: _isHovered),
                _CardBody(project: p),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  final ProjectData project;
  final bool isHovered;
  const _CardHeader({required this.project, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background icon
          Center(
            child: Icon(
              project.icon,
              size: 72,
              color: Colors.white.withValues(alpha: 0.25),
            ),
          ),

          // Badge
          if (project.badge != null)
            Positioned(
              top: 12,
              right: 12,
              child: _Badge(label: project.badge!),
            ),

          // Hover overlay
          if (isHovered)
            _CardHoverOverlay(project: project),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _CardHoverOverlay extends StatelessWidget {
  final ProjectData project;
  const _CardHoverOverlay({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgPrimary.withValues(alpha: 0.92),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.open_in_new, color: Colors.white, size: 32),
            SizedBox(height: 8),
            Text(
              'View Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final ProjectData project;
  const _CardBody({required this.project});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            project.description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: project.skills.map(_SkillChip.new).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
      ),
    );
  }
}

// ─── Project detail dialog ────────────────────────────────────────────────────

class _ProjectDetailDialog extends StatefulWidget {
  final ProjectData project;
  const _ProjectDetailDialog({required this.project});

  @override
  State<_ProjectDetailDialog> createState() => _ProjectDetailDialogState();
}

class _ProjectDetailDialogState extends State<_ProjectDetailDialog> {
  int _currentImage = 0;

  ProjectData get p => widget.project;
  bool get hasImages => p.images.isNotEmpty;
  bool get hasLinks => p.iosUrl != null || p.androidUrl != null;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: GlassContainer(
        color: AppColors.bgSecondary,
        padding: EdgeInsets.zero,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _DialogHeader(project: p),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image gallery or placeholder
                      if (hasImages)
                        _ImageGallery(
                          images: p.images,
                          current: _currentImage,
                          onChanged: (i) => setState(() => _currentImage = i),
                        )
                      else
                        _NoImagePlaceholder(icon: p.icon),

                      const SizedBox(height: 24),

                      // Description
                      Text(
                        p.description,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Skills
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: p.skills.map(_SkillChip.new).toList(),
                      ),

                      // Store links
                      if (hasLinks) ...[
                        const SizedBox(height: 24),
                        const Divider(color: AppColors.borderColor),
                        const SizedBox(height: 16),
                        _StoreLinks(project: p),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DialogHeader extends StatelessWidget {
  final ProjectData project;
  const _DialogHeader({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
      ),
      child: Row(
        children: [
          Icon(project.icon, color: Colors.white, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              project.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class _ImageGallery extends StatelessWidget {
  final List<String> images;
  final int current;
  final ValueChanged<int> onChanged;
  const _ImageGallery({
    required this.images,
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main image
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          child: Image.asset(
            images[current],
            height: 300,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => _ImageError(),
          ),
        ),

        if (images.length > 1) ...[
          const SizedBox(height: 12),
          // Thumbnails
          SizedBox(
            height: 64,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final isSelected = i == current;
                return GestureDetector(
                  onTap: () => onChanged(i),
                  child: AnimatedContainer(
                    duration: AppDurations.fast,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      border: Border.all(
                        color: isSelected ? AppColors.primaryStart : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                      child: Image.asset(
                        images[i],
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _ImageError(small: true),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}

class _ImageError extends StatelessWidget {
  final bool small;
  const _ImageError({this.small = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: small ? 64 : double.infinity,
      height: small ? 64 : 300,
      color: AppColors.bgTertiary,
      child: Icon(
        Icons.broken_image_outlined,
        color: AppColors.textMuted,
        size: small ? 20 : 40,
      ),
    );
  }
}

class _NoImagePlaceholder extends StatelessWidget {
  final IconData icon;
  const _NoImagePlaceholder({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: Icon(icon, size: 80, color: Colors.white.withValues(alpha: 0.3)),
    );
  }
}

class _StoreLinks extends StatelessWidget {
  final ProjectData project;
  const _StoreLinks({required this.project});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (project.iosUrl != null)
          _StoreButton(
            label: 'App Store',
            icon: Icons.apple,
            url: project.iosUrl!,
          ),
        if (project.androidUrl != null)
          _StoreButton(
            label: 'Play Store',
            icon: Icons.android,
            url: project.androidUrl!,
          ),
      ],
    );
  }
}

class _StoreButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String url;
  const _StoreButton({required this.label, required this.icon, required this.url});

  Future<void> _launch() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launch,
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
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}