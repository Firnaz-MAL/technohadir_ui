import 'package:flutter/material.dart';

/// 🔹 Card untuk daftar izin user
class PermitCard extends StatelessWidget {
  final String name;
  final String activity;
  final String reason;
  final String imagePath;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const PermitCard({
    super.key,
    required this.name,
    required this.activity,
    required this.reason,
    required this.imagePath,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text("Kegiatan: $activity",
                style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 8),
            Text("Alasan: $reason"),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath, height: 100, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onReject,
                  icon: const Icon(Icons.cancel, color: Colors.red),
                  label: const Text("Tolak",
                      style: TextStyle(color: Colors.red)),
                ),
                TextButton.icon(
                  onPressed: onApprove,
                  icon: const Icon(Icons.check_circle, color: Colors.green),
                  label: const Text("Setujui",
                      style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Card kecil untuk laporan singkat
class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
