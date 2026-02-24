import 'package:flutter/material.dart';
import 'screens/main_screen.dart'; 

void main() {
  runApp(const GreenMatchApp());
}

class GreenMatchApp extends StatelessWidget {
  const GreenMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenMatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1B5E20),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20)),
        useMaterial3: true,
      ),
      home: const MainScreen(), 
    );
  }
}