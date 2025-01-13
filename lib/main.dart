import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import SplashScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Splash Screen Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(), // Menetapkan SplashScreen sebagai halaman utama
        );
    }
}