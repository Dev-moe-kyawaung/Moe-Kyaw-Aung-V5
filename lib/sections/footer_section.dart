import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../app_data.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: dark ? AppTheme.panelDark.withOpacity(0.35) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: dark ? AppTheme.borderDark : AppTheme.borderLight),
        ),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 12,
          children: [
            Text(
              AppData.tagline,
              style: TextStyle(
                color: dark ? AppTheme.textDark : AppTheme.textLight,
              ),
            ),
            const Text(
              'Flutter V5 • Bento Cyber Portfolio',
              style: TextStyle(color: AppTheme.cyan, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
