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
        // Fondo gris perlado muy sutil, más elegante que el blanco puro
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B3B24), // Verde oscuro premium
          primary: const Color(0xFF0B3B24),
          secondary: const Color(0xFFC5A880), // Dorado/Champán
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF8F9FA),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF0B3B24)),
          titleTextStyle: TextStyle(color: Color(0xFF0B3B24), fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      home: const MainScreen(),
    );
  }
}