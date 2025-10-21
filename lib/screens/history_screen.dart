import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Dummy data riwayat absensi
  List<Map<String, String>> history = [
    {
      "date": "2025-10-14",
      "activity": "Rapat Guru Mingguan",
      "status": "Hadir",
    },
    {
      "date": "2025-10-13",
      "activity": "Kegiatan OSIS",
      "status": "Izin",
    },
    {
      "date": "2025-10-12",
      "activity": "Kelas RPL XI",
      "status": "Telat",
    },
  ];

  String? _selectedDate;

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Hadir":
        return Colors.green;
      case "Telat":
        return Colors.orange;
      case "Izin":
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredHistory = _selectedDate == null
        ? history
        : history.where((h) => h['date'] == _selectedDate).toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔍 Filter tanggal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Riwayat Absensi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0xFF0A285F),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A285F),
                  foregroundColor: Colors.white,
                ),
                onPressed: _pickDate,
                icon: const Icon(Icons.calendar_today, size: 18),
                label: const Text("Filter"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (_selectedDate != null)
            Text(
              "Menampilkan tanggal: $_selectedDate",
              style: const TextStyle(color: Colors.black54),
            ),
          const SizedBox(height: 10),

          // 📋 Daftar riwayat
          Expanded(
            child: filteredHistory.isEmpty
                ? const Center(
                    child: Text("Tidak ada data absensi untuk tanggal ini."),
                  )
                : ListView.builder(
                    itemCount: filteredHistory.length,
                    itemBuilder: (context, index) {
                      final item = filteredHistory[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: Icon(
                            item['status'] == "Hadir"
                                ? Icons.check_circle
                                : item['status'] == "Telat"
                                    ? Icons.access_time
                                    : Icons.cancel,
                            color: _getStatusColor(item['status']!),
                          ),
                          title: Text(
                            item['activity']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          subtitle: Text("Tanggal: ${item['date']}"),
                          trailing: Text(
                            item['status']!,
                            style: TextStyle(
                              color: _getStatusColor(item['status']!),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
