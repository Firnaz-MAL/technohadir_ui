import 'package:flutter/material.dart';
import '../widgets/header_card.dart';
import '../widgets/activity_card.dart';

class ActivitiesScreen extends StatefulWidget {
  final List<Map<String, dynamic>> activities;
  final Function(String, bool) onStatusChanged;

  const ActivitiesScreen({
    super.key,
    required this.activities,
    required this.onStatusChanged,
  });

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  // Pura-pura upload → langsung centang ✅
  void _handleAttend(String title) {
    widget.onStatusChanged(title, true);
  }

  // Izin (tetap gimik, tapi warna beda aja)
  void _handlePermit(String title) {
    widget.onStatusChanged(title, false);
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
              color: theme.brightness == Brightness.dark
                  ? Colors.yellow
                  : theme.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          ...widget.activities.map(
            (a) => ActivityCard(
              title: a['title'],
              time: a['time'],
              isAttended: a['attended'],
              onAttend: () => _handleAttend(a['title']),
              onPermit: () => _handlePermit(a['title']),
            ),
          ),
        ],
      ),
    );
  }
}
