import 'package:flutter/material.dart';
import '../widgets/header_card.dart';
import '../widgets/activity_card.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  List<Map<String, dynamic>> activities = [
    {
      'title': 'Rapat Guru Mingguan',
      'time': '07.30 - 08.30',
      'attended': false,
    },
    {
      'title': 'Kegiatan OSIS',
      'time': '09.00 - 10.00',
      'attended': true,
    },
    {
      'title': 'Kelas RPL XI',
      'time': '10.30 - 12.00',
      'attended': false,
    },
  ];

  // Pura-pura upload → langsung centang ✅
  void _handleAttend(String title) {
    setState(() {
      activities = activities.map((a) {
        if (a['title'] == title) a['attended'] = true;
        return a;
      }).toList();
    });
  }

  // Izin (tetap gimik, tapi warna beda aja)
  void _handlePermit(String title) {
    setState(() {
      activities = activities.map((a) {
        if (a['title'] == title) a['attended'] = false;
        return a;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const HeaderCard(
            userName: "Firnaz Mustopa Almursalin",
            userRole: "Siswa",
            userClass: "XI RPL IDN Malang",
          ),
          const SizedBox(height: 10),
          Text(
            "Kegiatan Hari Ini",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 10),
          ...activities.map((a) => ActivityCard(
                title: a['title'],
                time: a['time'],
                isAttended: a['attended'],
                onAttend: () => _handleAttend(a['title']),
                onPermit: () => _handlePermit(a['title']),
              )),
        ],
      ),
    );
  }
}
