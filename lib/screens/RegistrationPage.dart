import 'package:flutter/material.dart';
import 'login.dart'; // Pastikan import halaman Login yang benar

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar sebagai background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/registration.png'), // Gambar background
                fit: BoxFit.cover, // Menyesuaikan gambar agar memenuhi layar
              ),
            ),
          ),
          // Konten di atas background
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Input untuk Username
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true, // Mengisi background pada input field
                    fillColor: Colors.white.withOpacity(0.5), // Background putih dengan transparansi
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // Input untuk Password
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5), // Background putih dengan transparansi
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true, // Menyembunyikan teks password
                ),
                SizedBox(height: 20),
                // Input untuk Konfirmasi Password
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5), // Background putih dengan transparansi
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true, // Menyembunyikan teks password
                ),
                SizedBox(height: 20),
                // Tombol Registrasi dengan warna putih
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Warna latar belakang tombol putih
                    foregroundColor: Colors.black, // Warna teks hitam
                  ),
                  onPressed: () {
                    // Arahkan ke halaman success setelah registrasi
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationSuccessPage(),
                      ),
                    );
                  },
                  child: Text('Registrasi'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RegistrationSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar sebagai background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/registrasi.png'), // Gambar background
                fit: BoxFit.cover, // Menyesuaikan gambar agar memenuhi layar
              ),
            ),
          ),
          // Konten di atas background
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Pesan sukses
                Text(
                  'Selamat! Anda telah berhasil registrasi.',
                  style: TextStyle(fontSize: 24, color: Colors.black), // Warna teks hitam
                  textAlign: TextAlign.center, // Teks ditengah
                ),
                SizedBox(height: 20), // Jarak antar elemen
                // Pesan login
                Text(
                  'You can now login with your account',
                  style: TextStyle(fontSize: 18, color: Colors.black), // Warna teks hitam
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40), // Jarak sebelum tombol
                // Tombol GO TO LOGIN berwarna putih
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Warna latar belakang tombol putih
                    foregroundColor: Colors.black, // Warna teks hitam
                  ),
                  onPressed: () {
                    // Arahkan ke halaman login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(), // Halaman login
                      ),
                    );
                  },
                  child: Text('GO TO LOGIN'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
