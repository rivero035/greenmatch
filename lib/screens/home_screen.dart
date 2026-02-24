import 'package:flutter/material.dart';
import '../widgets/course_card.dart';
import '../widgets/match_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, Carlos 👋', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Handicap 18.2', style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'), 
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Where do you want to play today?',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Featured Courses
              const Text('Courses near you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CourseCard(
                      name: 'Seville Golf Club',
                      location: 'Andalusia • 12 km away',
                      price: 'From €65',
                      imageUrl: 'https://images.unsplash.com/photo-1587174486073-ae5e1c47f4a9?auto=format&fit=crop&w=400&q=80',
                    ),
                    CourseCard(
                      name: 'Real Club Pineda',
                      location: 'Andalusia • 5 km away',
                      price: 'From €85',
                      imageUrl: 'https://images.unsplash.com/photo-1535136140558-542617300c14?auto=format&fit=crop&w=400&q=80',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Matchmaking
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Matchmaking: Join now!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('See all', style: TextStyle(color: Color(0xFF1B5E20), fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 12),
              const MatchCard(
                course: 'Zaudín Golf',
                time: 'Tomorrow, 10:30 AM',
                status: '1 player needed',
                requirement: 'Avg Handicap: 15-20',
              ),
              const MatchCard(
                course: 'Hato Verde',
                time: 'Saturday, 09:00 AM',
                status: '2 players needed',
                requirement: 'Open (Social)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}