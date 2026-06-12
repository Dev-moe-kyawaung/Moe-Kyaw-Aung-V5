import 'package:flutter/material.dart';

class AppTheme {
  static const cyan = Color(0xFF00F5FF);
  static const pink = Color(0xFFFF3DBE);
  static const yellow = Color(0xFFFFE600);
  static const green = Color(0xFF37E38A);

  static const bgDark = Color(0xFF050816);
  static const bgLight = Color(0xFFF4F7FF);

  static const panelDark = Color(0xFF0A1022);
  static const panelLight = Color(0xFFFFFFFF);

  static const panel2Dark = Color(0xFF111838);
  static const panel2Light = Color(0xFFF1F4FF);

  static const textDark = Color(0xFFEAF2FF);
  static const textLight = Color(0xFF0E1324);

  static const mutedDark = Color(0xFF91A2C7);
  static const mutedLight = Color(0xFF687693);

  static const borderDark = Color(0xFF223155);
  static const borderLight = Color(0xFFD7E0F3);

  static const heroGradient = LinearGradient(
    colors: [cyan, pink, yellow],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const cardGradient = LinearGradient(
    colors: [Color(0xFF0C1227), Color(0xFF111838)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: bgLight,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: cyan,
      secondary: pink,
      tertiary: yellow,
      surface: panelLight,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textLight),
      bodyMedium: TextStyle(color: textLight),
      bodySmall: TextStyle(color: mutedLight),
      titleLarge: TextStyle(color: textLight, fontWeight: FontWeight.w800),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bgDark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: cyan,
      secondary: pink,
      tertiary: yellow,
      surface: panelDark,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textDark),
      bodyMedium: TextStyle(color: textDark),
      bodySmall: TextStyle(color: mutedDark),
      titleLarge: TextStyle(color: textDark, fontWeight: FontWeight.w800),
    ),
  );
}
