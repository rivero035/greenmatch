import 'package:flutter/material.dart';
import 'dart:math';
import '../widgets/course_card.dart';
import '../widgets/match_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _quotes = [
    "Grip it and rip it!",
    "Tee it high, let it fly!",
    "Own the course.",
    "Chase birdies, not excuses.",
    "Swing bold.",
    "Play fearless.",
    "Weekend forecast: 100% chance of golf.",
    "See you on the first tee."
  ];
  
  late String _splashText;

  @override
  void initState() {
    super.initState();
    final random = Random();
    _splashText = _quotes[random.nextInt(_quotes.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16231C), // Nuevo fondo Verde Pino Nocturno
      appBar: AppBar(
        backgroundColor: const Color(0xFF16231C),
        elevation: 0,
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Good evening,', style: TextStyle(color: Colors.white54, fontSize: 14, fontFamily: 'sans-serif', letterSpacing: 1.2)),
            const Text('Carlos Rivero', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
            const SizedBox(height: 4),
            Text('“$_splashText”', style: const TextStyle(color: Color(0xFFC5A880), fontSize: 13, fontStyle: FontStyle.italic)),
          ],
        ),
        actions: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFC5A880), width: 1),
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFFC5A880).withOpacity(0.1),
              ),
              child: const Row(
                children: [
                  Icon(Icons.workspace_premium, color: Color(0xFFC5A880), size: 16),
                  SizedBox(width: 4),
                  Text('CLUB MEMBER', style: TextStyle(color: Color(0xFFC5A880), fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5, fontFamily: 'sans-serif')),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: const Color(0xFFC5A880).withOpacity(0.2), width: 0.5),
                    bottom: BorderSide(color: const Color(0xFFC5A880).withOpacity(0.2), width: 0.5),
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLuxuryAction(Icons.golf_course, 'Reserve\nTee Time'),
                    _buildLuxuryAction(Icons.handshake_outlined, 'Join\nMatch'),
                    _buildLuxuryAction(Icons.electric_car_outlined, 'My\nBuggy', isPremium: true),
                    _buildLuxuryAction(Icons.balance_outlined, 'Rules\nAI', isPremium: true),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Exclusive Courses', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('VIEW ALL', style: TextStyle(color: Color(0xFFC5A880), fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 1.5, fontFamily: 'sans-serif')),
                  )
                ],
              ),
              const SizedBox(height: 16),
              
              SizedBox(
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none, // Permite que el escudo no se corte por abajo
                  children: const [
                    CourseCard(
                      name: 'Seville Golf Club',
                      location: 'Andalusia',
                      price: '€65',
                      imageUrl: 'https://images.unsplash.com/photo-1587174486073-ae5e1c47f4a9?auto=format&fit=crop&w=600&q=80',
                      // --- AQUÍ ESTÁ EL ESCUDO ---
                      crestUrl: 'https://cdn-icons-png.flaticon.com/512/3232/3232049.png', 
                    ),
                    CourseCard(
                      name: 'Real Club Pineda',
                      location: 'Andalusia',
                      price: '€85',
                      imageUrl: 'https://images.unsplash.com/photo-1535136140558-542617300c14?auto=format&fit=crop&w=600&q=80',
                      // --- Y AQUÍ EL OTRO ESCUDO ---
                      crestUrl: 'https://cdn-icons-png.flaticon.com/512/1041/1041127.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              const Text('Upcoming Matches', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 20),
              
              const MatchCard(
                course: 'Zaudín Golf',
                time: 'Tomorrow, 10:30 AM',
                status: '1 player needed',
                requirement: 'Handicap: 15-20',
              ),
              const MatchCard(
                course: 'Hato Verde',
                time: 'Saturday, 09:00 AM',
                status: '2 players needed',
                requirement: 'Open (Social)',
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLuxuryAction(IconData icon, String label, {bool isPremium = false}) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFC5A880), width: 1), 
              ),
              child: Icon(icon, color: const Color(0xFFC5A880), size: 22), 
            ),
            if (isPremium)
              Positioned(
                top: -4,
                right: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.star, color: Color(0xFF16231C), size: 10),
                ),
              )
          ],
        ),
        const SizedBox(height: 12),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, color: Colors.white70, fontFamily: 'sans-serif', fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ],
    );
  }
}