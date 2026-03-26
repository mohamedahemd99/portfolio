import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// A glassmorphism container with blur effect
class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Color? color;
  final Color? borderColor;
  final bool showBorder;
  final Gradient? gradient;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = AppSizes.radiusLg,
    this.color,
    this.borderColor,
    this.showBorder = true,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: showBorder
            ? Border.all(color: borderColor ?? AppColors.borderColor, width: 1)
            : null,
        gradient: gradient,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: color ?? AppColors.bgGlass,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
