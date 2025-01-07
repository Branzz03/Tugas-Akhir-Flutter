import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_screen.dart'; // Import home screen

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JAVA MOUNTAIN',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
    home:  const HomeScreen(), // Set SplashScreen sebagai halaman awal
    );
  }
}
