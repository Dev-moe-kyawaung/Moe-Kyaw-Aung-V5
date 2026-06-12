import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/bento_card.dart';
import '../widgets/section_header.dart';

class AppsSection extends StatelessWidget {
  final GlobalKey appsKey;
  const AppsSection({super.key, required this.appsKey});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      key: appsKey,
      margin: const EdgeInsets.only(bottom: 22),
      child: BentoCard(
        tone: 1,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              label: 'Apps',
              title: 'App gallery.',
              subtitle: 'A compact chip-based showcase for personal apps and side projects.',
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: AppData.apps
                  .map(
                    (app) => Chip(
                      label: Text(app),
                      labelStyle: TextStyle(
                        color: dark ? AppTheme.textDark : AppTheme.textLight,
                        fontWeight: FontWeight.w600,
                      ),
                      backgroundColor: dark ? AppTheme.panelDark.withOpacity(0.32) : AppTheme.panel2Light,
                      side: BorderSide(color: dark ? AppTheme.borderDark : AppTheme.borderLight),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
