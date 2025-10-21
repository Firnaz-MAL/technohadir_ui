import 'package:flutter/material.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.of(context);
    bool isDark = themeController.isDarkMode;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 50,
            backgroundImage:
                const AssetImage('assets/images/profile_placeholder.png'),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(height: 12),
          const Text(
            "Firnaz Mustopa Almursalin",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text("Siswa • XI RPL IDN Malang"),
          const SizedBox(height: 20),

          // 🌗 Switch Tema
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
                color: const Color(0xFF0A285F),
              ),
              title: const Text("Mode Tampilan"),
              subtitle: Text(isDark ? "Gelap" : "Terang"),
              trailing: Switch(
                value: isDark,
                activeColor: const Color(0xFFFFD100),
                onChanged: (value) {
                  themeController.toggleTheme();
                },
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 🚪 Tombol Logout
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
            label: const Text("Keluar Akun"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const Spacer(),

          const Text(
            "TechnoHadir © 2025\nAl-Islamiyyah TechnoVerse",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
