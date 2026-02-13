class User {
  final String id;
  final String name;
  final String email;
  final String role; // e.g., 'Siswa', 'Guru', 'Admin'
  final String? className;
  final String? profileImage;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.className,
    this.profileImage,
  });
}
