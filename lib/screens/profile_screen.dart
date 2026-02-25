import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        title: const Text('Profile', style: TextStyle(color: Color(0xFF0B3B24), fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Color(0xFF0B3B24)),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Cabecera: Foto y Estadísticas (Estilo Playtomic) ---
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn('34', 'Matches'),
                        _buildStatColumn('128', 'Followers'),
                        _buildStatColumn('95', 'Following'),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text('Carlos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0B3B24))),
              const Text('Seville, Andalusia', style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 24),

              // --- Botones de Acción ---
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF0B3B24),
                        side: const BorderSide(color: Color(0xFF0B3B24)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC5A880), // Dorado Premium
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Text('Get Premium', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // --- Tarjeta de Nivel (Hándicap) ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0B3B24), Color(0xFF145A38)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF0B3B24).withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 8))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Handicap Level', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    const SizedBox(height: 4),
                    const Text('18.2', style: TextStyle(color: Color(0xFFC5A880), fontSize: 40, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF0B3B24),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {},
                        child: const Text('Play matches to improve', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // --- Preferencias del Jugador ---
              const Text('Player Preferences', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0B3B24))),
              const SizedBox(height: 12),
              _buildPreferenceRow(Icons.wb_sunny_outlined, 'Preferred Time', 'Morning'),
              _buildPreferenceRow(Icons.emoji_events_outlined, 'Favorite Modality', 'Stableford'),
              const SizedBox(height: 32),

              // --- Funciones Exclusivas Premium ---
              Row(
                children: [
                  const Icon(Icons.star, color: Color(0xFFC5A880), size: 20),
                  const SizedBox(width: 8),
                  const Text('Premium Features', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0B3B24))),
                ],
              ),
              const SizedBox(height: 12),
              _buildPremiumRow(Icons.groups, 'Golf Community (Feed)'),
              _buildPremiumRow(Icons.electric_car, 'Reserve "My Buggy"'),
              _buildPremiumRow(Icons.gavel, 'Rules AI Assistant'),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widgets Reutilizables ---
  
  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0B3B24))),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }

  Widget _buildPreferenceRow(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 22),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))),
          Text(value, style: const TextStyle(color: Color(0xFFC5A880), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPremiumRow(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFC5A880).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC5A880).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFC5A880), size: 22),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0B3B24)))),
          const Icon(Icons.lock_outline, color: Color(0xFFC5A880), size: 18), // Candado para indicar que es de pago
        ],
      ),
    );
  }
}