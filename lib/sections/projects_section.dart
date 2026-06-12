import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/bento_card.dart';
import '../widgets/section_header.dart';
import '../widgets/open_url.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey projectsKey;
  const ProjectsSection({super.key, required this.projectsKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: projectsKey,
      margin: const EdgeInsets.only(bottom: 22),
      child: BentoCard(
        tone: 3,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              label: 'Projects',
              title: 'Selected work.',
              subtitle: 'Feature cards with cleaner spacing and stronger visual priority.',
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
                  children: AppData.projects.map((p) {
                    return SizedBox(
                      width: width,
                      child: _ProjectCard(
                        title: p['title']!,
                        tag: p['tag']!,
                        desc: p['desc']!,
                        repo: p['repo']!,
                      ),
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

class _ProjectCard extends StatelessWidget {
  final String title;
  final String tag;
  final String desc;
  final String repo;

  const _ProjectCard({
    required this.title,
    required this.tag,
    required this.desc,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: dark ? AppTheme.panelDark.withOpacity(0.30) : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: dark ? AppTheme.borderDark : AppTheme.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(tag, style: const TextStyle(color: AppTheme.cyan, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: dark ? AppTheme.textDark : AppTheme.textLight,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: TextStyle(
              color: dark ? AppTheme.mutedDark : AppTheme.mutedLight,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          Text('Repo: $repo', style: const TextStyle(color: AppTheme.yellow)),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            children: [
              FilledButton(
                onPressed: () => openUrl('https://github.com/moekyawaung-tech/$repo'),
                child: const Text('Demo'),
              ),
              OutlinedButton(
                onPressed: () => openUrl('https://github.com/moekyawaung-tech/$repo'),
                child: const Text('Source'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
