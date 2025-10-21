import 'package:flutter/material.dart';
import 'activities_screen.dart';
import 'history_screen.dart';
import 'admin_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ActivitiesScreen(),
    HistoryScreen(),
    AdminScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo/technohadir_logo.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(
              _selectedIndex == 0
                  ? "Kegiatan"
                  : _selectedIndex == 1
                      ? "Riwayat"
                      : _selectedIndex == 2
                          ? "Admin"
                          : "Profil",
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFFD100),
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFF0A285F),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Kegiatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
