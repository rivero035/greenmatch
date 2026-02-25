import 'package:flutter/material.dart';
import '../widgets/match_card.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8F9FA),
          elevation: 0,
          title: const Text('Matches', style: TextStyle(color: Color(0xFF0B3B24), fontWeight: FontWeight.bold, fontSize: 24)),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Color(0xFF0B3B24),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFFC5A880),
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Find Players'),
              Tab(text: 'My Games'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // --- PESTAÑA 1: Buscar Jugadores ---
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                MatchCard(
                  course: 'Zaudín Golf',
                  time: 'Tomorrow, 10:30 AM',
                  status: '1 player needed',
                  requirement: 'Avg Handicap: 15-20',
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
                MatchCard(
                  course: 'Real Club Pineda',
                  time: 'Sunday, 16:00 PM',
                  status: '3 players needed',
                  requirement: 'Handicap < 15',
                  modality: 'Foursomes',
                  playerImages: [
                    'https://randomuser.me/api/portraits/men/11.jpg'
                  ],
                ),
              ],
            ),

            // --- PESTAÑA 2: Mis Partidas ---
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                MatchCard(
                  course: 'Seville Golf Club',
                  time: 'Today, 17:00 PM',
                  status: 'Foursome complete',
                  requirement: 'Avg Handicap: 18',
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
        // --- BOTÓN FLOTANTE ---
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showCreateMatchBottomSheet(context), // Llama al menú emergente
          backgroundColor: const Color(0xFF0B3B24),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  // --- FUNCIÓN DEL MENÚ EMERGENTE (Estilo Playtomic) ---
  void _showCreateMatchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      backgroundColor: Colors.transparent, 
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75, // Ocupa el 75% de la pantalla
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barra superior para arrastrar
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 24),
              const Text('New Match', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0B3B24))),
              const SizedBox(height: 24),

              // Opciones del formulario
              _buildFormRow(Icons.location_on_outlined, 'Location', 'Select a Golf Course'),
              const Divider(height: 32),
              _buildFormRow(Icons.calendar_month_outlined, 'Date & Time', 'When are we playing?'),
              const Divider(height: 32),
              _buildFormRow(Icons.emoji_events_outlined, 'Modality', 'Stableford, Scramble...'),
              const Divider(height: 32),
              _buildFormRow(Icons.group_add_outlined, 'Players Needed', 'How many spots are left?'),
              
              const Spacer(),

              // Botón de crear gigante
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0B3B24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Cierra el menú al pulsar
                  },
                  child: const Text('Create Match', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  // Pequeño widget reutilizable para las filas del menú
  Widget _buildFormRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFFC5A880)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0B3B24))),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }
}