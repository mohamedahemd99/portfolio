import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// A gradient button that matches the portfolio design
class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const GradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.gradient,
    this.width,
    this.height,
    this.padding,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: AppDurations.normal,
        transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
        child: Material(
          elevation: _isHovered ? 8 : 4,
          shadowColor: AppColors.primaryStart.withOpacity(0.3),
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
            child: Ink(
              width: widget.width,
              height: widget.height,
              padding:
                  widget.padding ??
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              decoration: BoxDecoration(
                gradient: widget.gradient ?? AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) ...[
                    Icon(widget.icon, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
