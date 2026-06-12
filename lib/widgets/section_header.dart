import 'package:flutter/material.dart';
import '../app_theme.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final muted = dark ? AppTheme.mutedDark : AppTheme.mutedLight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: AppTheme.cyan,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 10),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (r) => AppTheme.heroGradient.createShader(r),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 42,
              height: 1.05,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(subtitle!, style: TextStyle(color: muted, height: 1.6)),
        ],
      ],
    );
  }
}
