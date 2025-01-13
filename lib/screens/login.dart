import 'package:flutter/material.dart';
import 'home_page.dart'; // Import halaman utama (Home Page)
import 'RegistrationPage.dart'; // Import halaman Registrasi
import 'package:flutter/gestures.dart'; // Untuk TapGestureRecognizer
import 'package:planner/screens/home_page.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar sebagai background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/registrasi.png'), // Path ke gambar
                fit: BoxFit.cover, // Mengisi seluruh layar
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
                  controller: _usernameController,
                  style: TextStyle(color: Colors.black), // Teks berwarna hitam
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.black), // Warna label hitam
                    fillColor: Colors.white.withOpacity(0.8), // Latar belakang input teks semi transparan
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // Input untuk Password
                TextField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.black), // Teks berwarna hitam
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black), // Warna label hitam
                    fillColor: Colors.white.withOpacity(0.8), // Latar belakang input teks semi transparan
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true, // Untuk menyembunyikan teks password
                ),
                SizedBox(height: 20),
                // Tombol Login
                ElevatedButton(
                  onPressed: () {
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    // Implementasi logika login (misalnya verifikasi username dan password)
                    if (username.isNotEmpty && password.isNotEmpty) {
                      // Jika login berhasil, arahkan ke halaman utama (Home Page)
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      // Jika input kosong, tampilkan pesan error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter both username and password')),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 20),
                // Teks Registrasi
                RichText(
                  text: TextSpan(
                    text: "Belum punya akun? ",
                    style: TextStyle(color: Colors.black), // Teks biasa berwarna hitam
                    children: [
                      TextSpan(
                        text: "Registrasi",
                        style: TextStyle(
                          color: Colors.blue, // Teks bisa diklik berwarna biru
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Arahkan ke halaman Registrasi
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
