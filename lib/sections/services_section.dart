import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/bento_card.dart';
import '../widgets/section_header.dart';

class ServicesSection extends StatelessWidget {
  final GlobalKey servicesKey;
  const ServicesSection({super.key, required this.servicesKey});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      key: servicesKey,
      margin: const EdgeInsets.only(bottom: 22),
      child: BentoCard(
        tone: 0,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              label: 'Services',
              title: 'What I offer.',
              subtitle: 'A premium service block with compact cards and clear value messaging.',
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, c) {
                final mobile = c.maxWidth < 700;
                final tablet = c.maxWidth >= 700 && c.maxWidth < 1100;
                final width = mobile
                    ? c.maxWidth
                    : tablet
                        ? (c.maxWidth - 16) / 2
                        : (c.maxWidth - 32) / 3;

                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: AppData.services.map((s) {
                    return SizedBox(
                      width: width,
                      child: _ServiceCard(title: s),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  const _ServiceCard({required this.title});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: dark ? AppTheme.panelDark.withOpacity(0.28) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: dark ? AppTheme.borderDark : AppTheme.borderLight),
      ),
      child: Row(
        children: [
          const Icon(Icons.auto_awesome_rounded, color: AppTheme.cyan),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
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
