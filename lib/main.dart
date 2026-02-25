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
        // Nuevo fondo: Verde Pino Nocturno (más suave que el negro)
        scaffoldBackgroundColor: const Color(0xFF16231C),
        
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color(0xFFC5A880), // Oro Champán
          primary: const Color(0xFFC5A880),
          surface: const Color(0xFF223329), // Gris verdoso un pelín más claro para las tarjetas
        ),
        
        fontFamily: 'Georgia',
        
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF16231C),
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFFC5A880)),
          titleTextStyle: TextStyle(
            color: Colors.white, 
            fontSize: 24, 
            fontWeight: FontWeight.w600,
            fontFamily: 'Georgia', 
            letterSpacing: 0.5,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}