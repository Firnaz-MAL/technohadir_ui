class Permit {
  final String id;
  final String userName;
  final String activityTitle;
  final String reason;
  final String imagePath;
  final DateTime date;
  String status; // 'Pending', 'Approved', 'Rejected'

  Permit({
    required this.id,
    required this.userName,
    required this.activityTitle,
    required this.reason,
    required this.imagePath,
    required this.date,
    this.status = 'Pending',
  });
}
