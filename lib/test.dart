import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';

void main() {
  runApp(const TechnoHadirRoot());
}

/// Root widget — menyimpan state global (theme)
class TechnoHadirRoot extends StatefulWidget {
  const TechnoHadirRoot({super.key});

  @override
  State<TechnoHadirRoot> createState() => _TechnoHadirRootState();
}

class _TechnoHadirRootState extends State<TechnoHadirRoot> {
  bool _isDarkMode = false;

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeController(
      isDarkMode: _isDarkMode,
      toggleTheme: toggleTheme,
      child: MaterialApp(
        title: 'TechnoHadir',
        debugShowCheckedModeBanner: false,
        theme: _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(
            onSplashComplete: (context) {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}

/// InheritedWidget agar bisa akses theme di semua halaman
class ThemeController extends InheritedWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const ThemeController({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required super.child,
  });

  static ThemeController of(BuildContext context) {
    final ThemeController? result = context
        .dependOnInheritedWidgetOfExactType<ThemeController>();
    assert(result != null, 'ThemeController tidak ditemukan di context!');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeController oldWidget) =>
      isDarkMode != oldWidget.isDarkMode;
}
