import 'package:flutter/material.dart';
import '../widgets/match_card.dart'; // ¡Importamos nuestra tarjeta reciclable!

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos DefaultTabController para crear las pestañas de arriba mágicamente
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Matches', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Color(0xFF1B5E20),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF1B5E20),
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
                ),
                MatchCard(
                  course: 'Hato Verde',
                  time: 'Saturday, 09:00 AM',
                  status: '2 players needed',
                  requirement: 'Open (Social)',
                ),
                MatchCard(
                  course: 'Real Club Pineda',
                  time: 'Sunday, 16:00 PM',
                  status: '3 players needed',
                  requirement: 'Handicap < 15',
                ),
              ],
            ),

            // --- PESTAÑA 2: Mis Partidas (Confirmadas) ---
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                MatchCard(
                  course: 'Seville Golf Club',
                  time: 'Today, 17:00 PM',
                  status: 'Confirmed',
                  requirement: 'Foursome complete',
                ),
              ],
            ),
          ],
        ),
        // Botón flotante para crear una partida nueva
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Aquí irá la lógica para crear una partida en el futuro
          },
          backgroundColor: const Color(0xFF1B5E20),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}