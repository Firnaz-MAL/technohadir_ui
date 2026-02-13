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

  // Lifted state for activities to be shared between ActivitiesScreen and AdminScreen
  final List<Map<String, dynamic>> _activities = [
    {
      'title': 'Rapat Guru Mingguan',
      'time': '07.30 - 08.30',
      'attended': false,
    },
    {'title': 'Kegiatan OSIS', 'time': '09.00 - 10.00', 'attended': true},
    {'title': 'Kelas RPL XI', 'time': '10.30 - 12.00', 'attended': false},
  ];

  void _addActivity(String title, String time) {
    setState(() {
      _activities.add({'title': title, 'time': time, 'attended': false});
    });
  }

  void _updateActivityStatus(String title, bool attended) {
    setState(() {
      for (var activity in _activities) {
        if (activity['title'] == title) {
          activity['attended'] = attended;
        }
      }
    });
  }

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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ActivitiesScreen(
            activities: _activities,
            onStatusChanged: _updateActivityStatus,
          ),
          const HistoryScreen(),
          AdminScreen(onActivityAdded: _addActivity),
          const ProfileScreen(),
        ],
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
