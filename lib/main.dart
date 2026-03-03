import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Importamos la nueva pantalla

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
        scaffoldBackgroundColor: const Color(0xFFF8F5F0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF072B15), 
          primary: const Color(0xFF072B15),
          secondary: const Color(0xFFB89768), 
        ),
        fontFamily: 'Georgia', 
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF8F5F0),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF072B15)),
          titleTextStyle: TextStyle(
            color: Color(0xFF072B15), 
            fontSize: 24, 
            fontWeight: FontWeight.bold,
            fontFamily: 'Georgia', 
          ),
        ),
      ),
      // AQUÍ ESTÁ EL CAMBIO: La app arranca en la pantalla de Login
      home: const LoginScreen(),
    );
  }
}