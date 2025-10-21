import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String time;
  final bool isAttended;
  final VoidCallback onAttend;
  final VoidCallback onPermit;

  const ActivityCard({
    super.key,
    required this.title,
    required this.time,
    required this.isAttended,
    required this.onAttend,
    required this.onPermit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      color: isDark ? const Color(0xFF1C1C1E) : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        subtitle: Text(
          "Jam: $time",
          style: TextStyle(
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
            fontSize: 13,
          ),
        ),
        trailing: isAttended
            ? const Icon(Icons.check_circle, color: Colors.green, size: 28)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.blue),
                    onPressed: onAttend,
                    tooltip: "Absen sekarang",
                  ),
                  IconButton(
                    icon: const Icon(Icons.note_add, color: Colors.orange),
                    onPressed: onPermit,
                    tooltip: "Ajukan izin",
                  ),
                ],
              ),
      ),
    );
  }
}
