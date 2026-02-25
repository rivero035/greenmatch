import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'matches_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; 

  final List<Widget> _screens = [
    const HomeScreen(),
    const MatchesScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], 
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: const Color(0xFFC5A880).withOpacity(0.2), width: 0.5)), 
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF16231C), // Nuevo fondo Verde Pino Nocturno
          elevation: 0,
          selectedItemColor: const Color(0xFFC5A880),
          unselectedItemColor: Colors.white38,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5, fontFamily: 'sans-serif'),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5, fontFamily: 'sans-serif'),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped, 
          items: const [
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.explore_outlined)), 
              activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.explore)), 
              label: 'EXPLORE'
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.sports_golf_outlined)), 
              activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.sports_golf)), 
              label: 'TEE TIMES'
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.person_outline)), 
              activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.person)), 
              label: 'CLUB'
            ),
          ],
        ),
      ),
    );
  }
}