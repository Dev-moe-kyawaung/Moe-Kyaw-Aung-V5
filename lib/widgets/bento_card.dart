import 'package:flutter/material.dart';
import '../app_theme.dart';

class BentoCard extends StatelessWidget {
  final Widget child;
  final int tone;
  final double radius;
  final EdgeInsets padding;

  const BentoCard({
    super.key,
    required this.child,
    this.tone = 0,
    this.radius = 28,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final border = [AppTheme.cyan, AppTheme.pink, AppTheme.yellow, AppTheme.green][tone % 4];
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      padding: padding,
      decoration: BoxDecoration(
        gradient: dark ? AppTheme.cardGradient : null,
        color: dark ? null : AppTheme.panel2Light,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: border.withOpacity(dark ? 0.32 : 0.18)),
        boxShadow: [
          BoxShadow(
            color: border.withOpacity(dark ? 0.12 : 0.08),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: child,
    );
  }
}
