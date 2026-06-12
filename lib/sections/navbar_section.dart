import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_state.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/open_url.dart';

class NavbarSection extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final GlobalKey heroKey;
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey servicesKey;
  final GlobalKey projectsKey;
  final GlobalKey appsKey;
  final GlobalKey contactKey;

  const NavbarSection({
    super.key,
    required this.scaffoldKey,
    required this.heroKey,
    required this.aboutKey,
    required this.skillsKey,
    required this.servicesKey,
    required this.projectsKey,
    required this.appsKey,
    required this.contactKey,
  });

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 850),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final state = context.read<AppState>();
    final mobile = MediaQuery.of(context).size.width < 980;

    final items = [
      ('Home', heroKey),
      ('About', aboutKey),
      ('Skills', skillsKey),
      ('Services', servicesKey),
      ('Projects', projectsKey),
      ('Apps', appsKey),
      ('Contact', contactKey),
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: dark ? AppTheme.panelDark.withOpacity(0.86) : AppTheme.panelLight.withOpacity(0.92),
        border: Border.all(color: dark ? AppTheme.borderDark : AppTheme.borderLight),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.cyan.withOpacity(dark ? 0.08 : 0.05),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _scrollTo(heroKey),
            child: const Text(
              'MKA',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: AppTheme.cyan,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(width: 14),
          if (!mobile)
            Wrap(
              spacing: 8,
              children: items
                  .map(
                    (e) => TextButton(
                      onPressed: () => _scrollTo(e.$2),
                      child: Text(
                        e.$1,
                        style: TextStyle(
                          color: dark ? AppTheme.textDark : AppTheme.textLight,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          const Spacer(),
          ThemeToggle(
            dark: dark,
            onTap: state.toggleTheme,
          ),
          const SizedBox(width: 10),
          if (mobile)
            IconButton(
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
              icon: Icon(Icons.menu_rounded, color: dark ? AppTheme.textDark : AppTheme.textLight),
            )
          else
            TextButton.icon(
              onPressed: () => openUrl('https://github.com/'),
              icon: const Icon(Icons.code_rounded, size: 18),
              label: const Text('GitHub'),
            ),
        ],
      ),
    );
  }
}
