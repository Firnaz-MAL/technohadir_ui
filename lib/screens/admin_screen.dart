import 'package:flutter/material.dart';
import '../widgets/admin_components.dart';

class AdminScreen extends StatefulWidget {
  final Function(String, String) onActivityAdded;

  const AdminScreen({super.key, required this.onActivityAdded});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  List<Map<String, dynamic>> permits = [
    {
      "name": "Rizky Aditya",
      "activity": "Kegiatan OSIS",
      "reason": "Sakit, tidak bisa hadir.",
      "imagePath": "assets/images/sample_permit.png",
    },
    {
      "name": "Dewi Lestari",
      "activity": "Rapat Guru Mingguan",
      "reason": "Ada urusan keluarga mendesak.",
      "imagePath": "assets/images/sample_permit.png",
    },
  ];

  void _addActivity() {
    if (_activityController.text.isEmpty || _timeController.text.isEmpty) {
      return;
    }

    widget.onActivityAdded(_activityController.text, _timeController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Kegiatan '${_activityController.text}' berhasil ditambahkan!",
        ),
        backgroundColor: Colors.green,
      ),
    );

    _activityController.clear();
    _timeController.clear();
  }

  void _approvePermit(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Izin dari $name disetujui ✅"),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _rejectPermit(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Izin dari $name ditolak ❌"),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headerStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: theme.brightness == Brightness.dark
          ? Colors.yellow
          : const Color(0xFF0A285F),
    );

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text("Tambah Kegiatan Baru", style: headerStyle),
        const SizedBox(height: 10),

        // 🔹 Form Tambah Kegiatan
        TextField(
          controller: _activityController,
          decoration: const InputDecoration(
            labelText: "Nama Kegiatan",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _timeController,
          decoration: const InputDecoration(
            labelText: "Waktu (misal: 07.00 - 08.30)",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: _addActivity,
          icon: const Icon(Icons.add),
          label: const Text("Tambah Kegiatan"),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0A285F),
            foregroundColor: Colors.white,
          ),
        ),
        const SizedBox(height: 20),

        Text("Daftar Izin Pengguna", style: headerStyle),
        const SizedBox(height: 10),

        // 🔹 List Izin
        ...permits.map(
          (p) => PermitCard(
            name: p['name'],
            activity: p['activity'],
            reason: p['reason'],
            imagePath: p['imagePath'],
            onApprove: () => _approvePermit(p['name']),
            onReject: () => _rejectPermit(p['name']),
          ),
        ),

        const SizedBox(height: 20),

        Text("Laporan Absensi Singkat", style: headerStyle),
        const SizedBox(height: 10),

        // 🔹 Ringkasan
        Row(
          children: const [
            SummaryCard(title: "Hadir", value: "124", color: Colors.green),
            SizedBox(width: 8),
            SummaryCard(title: "Telat", value: "18", color: Colors.orange),
            SizedBox(width: 8),
            SummaryCard(title: "Izin", value: "9", color: Colors.redAccent),
          ],
        ),
        const SizedBox(height: 10),

        // 🔹 Tombol Unduh Laporan
        ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Laporan disiapkan untuk diunduh (mock)"),
                backgroundColor: Colors.blue,
              ),
            );
          },
          icon: const Icon(Icons.download),
          label: const Text("Unduh Laporan PDF"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[800],
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
