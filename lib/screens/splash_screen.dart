import 'package:flutter/material.dart';
import 'dart:async'; // Import untuk menggunakan Timer/Future.delayed
import 'package:myapp/screens/dashboard_screen.dart';
// import 'package:myapp/screens/login_screen.dart'; // Import untuk Justduitpage

class SplashScreen extends StatefulWidget {
  // Nama route untuk Navigasi
  static const String route = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk Navigasi setelah beberapa detik
    _navigateToDashboard();
  }

  // Fungsi untuk pindah ke Dashboard setelah delay
  void _navigateToDashboard() {
    // Tunggu selama 5 detik untuk menampilkan Splash Screen
    Future.delayed(const Duration(seconds: 5), () {
      // Gunakan pushReplacementNamed agar pengguna tidak bisa kembali ke Splash Screen
      Navigator.pushReplacementNamed(context, DashboardScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Beri warna latar belakang yang sama dengan tema aplikasi
      backgroundColor: const Color(0xFFF8F8FB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. Menggunakan kembali widget logo yang sudah ada
            const JustduitLogo(),
            const SizedBox(height: 24),

            // 2. Indikator loading yang berputar
            const CircularProgressIndicator(
              color: Color(0xFF1E88FF), // warna biru sesuai tema
            ),
            const SizedBox(height: 16),

            // 3. Teks Loading
            Text(
              'Loading...',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class JustduitLogo extends StatelessWidget {
  const JustduitLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo-mola.png', // sesuaikan path asset Anda
      width: 240,
      height: 240,
      errorBuilder: (context, error, stackTrace) => const FlutterLogo(size: 120),
    );
  }
}