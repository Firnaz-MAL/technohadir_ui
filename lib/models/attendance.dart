class Attendance {
  final String id;
  final String userId;
  final String activityId;
  final DateTime timestamp;
  final String status; // 'Hadir', 'Telat', 'Izin'
  final String? note;

  Attendance({
    required this.id,
    required this.userId,
    required this.activityId,
    required this.timestamp,
    required this.status,
    this.note,
  });
}
