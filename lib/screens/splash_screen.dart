import 'package:flutter/material.dart';
import 'login.dart'; // Import halaman Login

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Splash Screen.png'), // Gambar sebagai background
            fit: BoxFit.cover, // Mengisi seluruh layar
          ),
        ),
        child: Center(
          // Logo di tengah yang dapat diklik
          child: GestureDetector(
            onTap: () {
              // Arahkan ke halaman Login saat logo diklik
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Image.asset(
              'assets/logo utama wildberry.png', // Gambar logo di tengah
              width: 400, // Atur ukuran logo sesuai kebutuhan
              height: 400,
            ),
          ),
        ),
      ),
    );
  }
}
