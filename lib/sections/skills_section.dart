import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';
import '../widgets/bento_card.dart';
import '../widgets/section_header.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey skillsKey;
  const SkillsSection({super.key, required this.skillsKey});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    final skills = [
      ('Flutter / Dart', 0.95),
      ('Firebase / Hosting', 0.92),
      ('Android / Kotlin', 0.88),
      ('REST / API', 0.90),
      ('UI Systems', 0.93),
      ('State Management', 0.86),
    ];

    return Container(
      key: skillsKey,
      margin: const EdgeInsets.only(bottom: 22),
      child: BentoCard(
        tone: 2,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              label: 'Skills',
              title: 'Core stack.',
              subtitle: 'Compact cards, chip groups, and responsive progress bars.',
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: AppData.focus
                  .map(
                    (f) => Container(
                      width: 260,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: dark ? AppTheme.panelDark.withOpacity(0.35) : AppTheme.panel2Light,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: dark ? AppTheme.borderDark : AppTheme.borderLight),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            f['name']!,
                            style: const TextStyle(
                              color: AppTheme.yellow,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            f['desc']!,
                            style: TextStyle(
                              color: dark ? AppTheme.textDark : AppTheme.textLight,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 22),
            ...skills.map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _SkillBar(name: s.$1, value: s.$2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final String name;
  final double value;

  const _SkillBar({required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: dark ? AppTheme.panelDark.withOpacity(0.28) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: dark ? AppTheme.borderDark : AppTheme.borderLight),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: dark ? AppTheme.textDark : AppTheme.textLight,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text('${(value * 100).round()}%', style: const TextStyle(color: AppTheme.cyan)),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: value),
              duration: const Duration(milliseconds: 1200),
              builder: (_, v, __) {
                return LinearProgressIndicator(
                  value: v,
                  minHeight: 10,
                  backgroundColor: dark ? Colors.white12 : Colors.black12,
                  valueColor: const AlwaysStoppedAnimation(AppTheme.pink),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
