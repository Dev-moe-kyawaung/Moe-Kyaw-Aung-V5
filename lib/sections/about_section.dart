import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/bento_card.dart';
import '../widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey aboutKey;
  const AboutSection({super.key, required this.aboutKey});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      key: aboutKey,
      margin: const EdgeInsets.only(bottom: 22),
      child: BentoCard(
        tone: 1,
        padding: const EdgeInsets.all(24),
        child: LayoutBuilder(
          builder: (context, c) {
            final mobile = c.maxWidth < 900;
            return Flex(
              direction: mobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionHeader(
                        label: 'About',
                        title: 'Developer by passion.',
                        subtitle: 'A premium bento-style portfolio with stronger hierarchy and cleaner flow.',
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'I build polished Flutter applications with strong UX, scalable structure, and a premium visual identity. '
                        'My focus is on responsive interfaces, Firebase workflows, and mobile-first product thinking.',
                        style: TextStyle(
                          color: dark ? AppTheme.textDark : AppTheme.textLight,
                          height: 1.7,
                          fontSize: 15.5,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'This V5 direction is designed to feel compact, expensive, and modern — using bento cards, bold contrast, and fluid layout behavior.',
                        style: TextStyle(
                          color: dark ? AppTheme.mutedDark : AppTheme.mutedLight,
                          height: 1.7,
                          fontSize: 14.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20, height: 20),
                Expanded(
                  flex: 4,
                  child: BentoCard(
                    tone: 2,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Current Focus',
                          style: TextStyle(
                            color: AppTheme.yellow,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _InfoRow('Name', AppData.name),
                        _InfoRow('Role', 'Flutter Developer'),
                        _InfoRow('Location', AppData.location),
                        _InfoRow('Build', AppData.currentBuild),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: Text(
              label,
              style: TextStyle(
                color: dark ? AppTheme.mutedDark : AppTheme.mutedLight,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: dark ? AppTheme.textDark : AppTheme.textLight,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
