import 'package:flutter/material.dart';

class AppTheme {
  static const Color navy = Color(0xFF0A285F);
  static const Color yellow = Color(0xFFFFD100);

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: navy,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: navy,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(color: navy, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: yellow),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: navy,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: navy,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(color: yellow, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: yellow),
  );
}
