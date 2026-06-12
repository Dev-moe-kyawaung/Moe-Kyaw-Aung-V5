import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'app_theme.dart';
import 'sections/navbar_section.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/services_section.dart';
import 'sections/projects_section.dart';
import 'sections/apps_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final state = AppState();
  await state.load();
  runApp(ChangeNotifierProvider.value(value: state, child: const V5App()));
}

class V5App extends StatelessWidget {
  const V5App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (_, state, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Moe Kyaw Aung V5',
          themeMode: state.themeMode,
          theme: AppTheme.lightTheme.copyWith(
            textTheme: GoogleFonts.interTextTheme(AppTheme.lightTheme.textTheme),
          ),
          darkTheme: AppTheme.darkTheme.copyWith(
            textTheme: GoogleFonts.interTextTheme(AppTheme.darkTheme.textTheme),
          ),
          home: const V5HomePage(),
        );
      },
    );
  }
}

class V5HomePage extends StatefulWidget {
  const V5HomePage({super.key});

  @override
  State<V5HomePage> createState() => _V5HomePageState();
}

class _V5HomePageState extends State<V5HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final servicesKey = GlobalKey();
  final projectsKey = GlobalKey();
  final appsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final bg = dark ? AppTheme.bgDark : AppTheme.bgLight;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: bg,
      drawer: _MobileDrawer(
        onGoHome: () => _scrollTo(heroKey),
        onGoAbout: () => _scrollTo(aboutKey),
        onGoSkills: () => _scrollTo(skillsKey),
        onGoServices: () => _scrollTo(servicesKey),
        onGoProjects: () => _scrollTo(projectsKey),
        onGoApps: () => _scrollTo(appsKey),
        onGoContact: () => _scrollTo(contactKey),
      ),
      body: Stack(
        children: [
          _BackgroundGlow(dark: dark),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1320),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NavbarSection(
                          scaffoldKey: scaffoldKey,
                          heroKey: heroKey,
                          aboutKey: aboutKey,
                          skillsKey: skillsKey,
                          servicesKey: servicesKey,
                          projectsKey: projectsKey,
                          appsKey: appsKey,
                          contactKey: contactKey,
                        ),
                        HeroSection(heroKey: heroKey),
                        AboutSection(aboutKey: aboutKey),
                        SkillsSection(skillsKey: skillsKey),
                        ServicesSection(servicesKey: servicesKey),
                        ProjectsSection(projectsKey: projectsKey),
                        AppsSection(appsKey: appsKey),
                        ContactSection(contactKey: contactKey),
                        const FooterSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _scrollTo(GlobalKey key) async {
    Navigator.of(context).pop();
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 850),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  final VoidCallback onGoHome;
  final VoidCallback onGoAbout;
  final VoidCallback onGoSkills;
  final VoidCallback onGoServices;
  final VoidCallback onGoProjects;
  final VoidCallback onGoApps;
  final VoidCallback onGoContact;

  const _MobileDrawer({
    required this.onGoHome,
    required this.onGoAbout,
    required this.onGoSkills,
    required this.onGoServices,
    required this.onGoProjects,
    required this.onGoApps,
    required this.onGoContact,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final bg = dark ? AppTheme.panelDark : Colors.white;

    return Drawer(
      backgroundColor: bg,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Text(
                'MKA V5',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppTheme.cyan,
                ),
              ),
            ),
            _DrawerItem(label: 'Home', onTap: onGoHome),
            _DrawerItem(label: 'About', onTap: onGoAbout),
            _DrawerItem(label: 'Skills', onTap: onGoSkills),
            _DrawerItem(label: 'Services', onTap: onGoServices),
            _DrawerItem(label: 'Projects', onTap: onGoProjects),
            _DrawerItem(label: 'Apps', onTap: onGoApps),
            _DrawerItem(label: 'Contact', onTap: onGoContact),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: Text(label),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
        onTap: onTap,
      ),
    );
  }
}

class _BackgroundGlow extends StatelessWidget {
  final bool dark;
  const _BackgroundGlow({required this.dark});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.6, -0.8),
            radius: 1.3,
            colors: dark
                ? [
                    AppTheme.cyan.withOpacity(0.16),
                    AppTheme.bgDark,
                  ]
                : [
                    AppTheme.cyan.withOpacity(0.10),
                    AppTheme.bgLight,
                  ],
          ),
        ),
      ),
    );
  }
}
