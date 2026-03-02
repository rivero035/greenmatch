import 'package:flutter/material.dart';
import '../widgets/match_card.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF16231C), // Verde Pino Nocturno
        appBar: AppBar(
          backgroundColor: const Color(0xFF16231C),
          elevation: 0,
          toolbarHeight: 60,
          title: const Text('Tee Times', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26, letterSpacing: -0.5)),
          centerTitle: false,
          bottom: const TabBar(
            labelColor: Color(0xFFC5A880), // Dorado Champán
            unselectedLabelColor: Colors.white54, // Blanco apagado
            indicatorColor: Color(0xFFC5A880),
            indicatorWeight: 2,
            labelStyle: TextStyle(fontFamily: 'sans-serif', fontWeight: FontWeight.bold, letterSpacing: 1.0),
            tabs: [
              Tab(text: 'OPEN MATCHES'),
              Tab(text: 'MY SCHEDULE'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // PESTAÑA 1
            ListView(
              padding: const EdgeInsets.all(20.0),
              children: const [
                MatchCard(
                  course: 'Zaudín Golf',
                  time: 'Tomorrow, 10:30 AM',
                  status: '1 player needed',
                  requirement: 'Handicap: 15-20',
                  modality: 'Scramble',
                  playerImages: [
                    'https://randomuser.me/api/portraits/men/44.jpg',
                    'https://randomuser.me/api/portraits/men/45.jpg',
                    'https://randomuser.me/api/portraits/women/44.jpg'
                  ],
                ),
                MatchCard(
                  course: 'Hato Verde',
                  time: 'Saturday, 09:00 AM',
                  status: '2 players needed',
                  requirement: 'Open (Social)',
                  modality: 'Stableford',
                  playerImages: [
                    'https://randomuser.me/api/portraits/men/22.jpg',
                    'https://randomuser.me/api/portraits/women/23.jpg'
                  ],
                ),
              ],
            ),

            // PESTAÑA 2
            ListView(
              padding: const EdgeInsets.all(20.0),
              children: const [
                MatchCard(
                  course: 'Seville Golf Club',
                  time: 'Today, 17:00 PM',
                  status: 'Foursome complete',
                  requirement: 'Handicap: 18',
                  modality: 'Greensome',
                  playerImages: [
                    'https://randomuser.me/api/portraits/men/32.jpg', 
                    'https://randomuser.me/api/portraits/men/65.jpg',
                    'https://randomuser.me/api/portraits/women/65.jpg',
                    'https://randomuser.me/api/portraits/men/80.jpg'
                  ],
                ),
              ],
            ),
          ],
        ),
        
        // Botón flotante dorado y cuadrado
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showCreateMatchBottomSheet(context),
          backgroundColor: const Color(0xFFC5A880), // Dorado
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
          child: const Icon(Icons.add, color: Color(0xFF0A120D)), // Icono oscuro
        ),
      ),
    );
  }

  // Menú emergente adaptado al Lujo Oscuro
  void _showCreateMatchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      backgroundColor: Colors.transparent, 
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: BoxDecoration(
            color: const Color(0xFF0A120D), // Fondo Carbón
            border: Border.all(color: const Color(0xFFC5A880).withOpacity(0.3), width: 1),
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 30, height: 2, color: const Color(0xFFC5A880), 
                ),
              ),
              const SizedBox(height: 30),
              const Text('Schedule Tee Time', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -0.5)),
              const SizedBox(height: 30),

              _buildEditorialRow('LOCATION', 'Select a Golf Course'),
              const Divider(height: 40, thickness: 0.5, color: Colors.white12),
              _buildEditorialRow('DATE & TIME', 'When are we playing?'),
              const Divider(height: 40, thickness: 0.5, color: Colors.white12),
              _buildEditorialRow('MODALITY', 'Stableford, Scramble...'),
              const Divider(height: 40, thickness: 0.5, color: Colors.white12),
              _buildEditorialRow('PLAYERS NEEDED', 'How many spots are left?'),
              
              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC5A880), // Fondo dorado
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
                    elevation: 0,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('CONFIRM', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0A120D), letterSpacing: 2.0, fontFamily: 'sans-serif')),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildEditorialRow(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFFC5A880), letterSpacing: 1.5, fontFamily: 'sans-serif')),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 14, fontFamily: 'Georgia', fontStyle: FontStyle.italic)),
          ],
        ),
        const Icon(Icons.arrow_forward, size: 16, color: Color(0xFFC5A880)),
      ],
    );
  }
}