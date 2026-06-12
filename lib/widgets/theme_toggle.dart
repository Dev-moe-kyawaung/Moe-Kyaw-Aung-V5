import 'package:flutter/material.dart';
import '../app_theme.dart';

class ThemeToggle extends StatelessWidget {
  final bool dark;
  final VoidCallback onTap;

  const ThemeToggle({
    super.key,
    required this.dark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: dark ? AppTheme.panel2Dark : AppTheme.panel2Light,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: dark ? AppTheme.borderDark : AppTheme.borderLight),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 220),
          alignment: dark ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: dark ? AppTheme.heroGradient : null,
              color: dark ? null : Colors.white,
            ),
            child: Icon(
              dark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
              color: dark ? Colors.black : AppTheme.pink,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
