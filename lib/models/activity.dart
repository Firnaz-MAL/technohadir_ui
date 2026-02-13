class Activity {
  final String id;
  final String title;
  final String time;
  bool isAttended;

  Activity({
    required this.id,
    required this.title,
    required this.time,
    this.isAttended = false,
  });
}
