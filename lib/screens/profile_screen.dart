import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('My Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            
            // --- Avatar e Información principal ---
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Carlos', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Andalusia, Spain', style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 24),

            // --- Tarjeta de Estadísticas ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn('Handicap', '18.2'),
                    _buildDivider(),
                    _buildStatColumn('Matches', '34'),
                    _buildDivider(),
                    _buildStatColumn('Avg Score', '92'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // --- Opciones del Menú ---
            _buildMenuOption(Icons.history, 'Match History'),
            _buildMenuOption(Icons.bar_chart, 'Statistics & Progress'),
            _buildMenuOption(Icons.group, 'My Friends'),
            _buildMenuOption(Icons.payment, 'Payment Methods'),
            const SizedBox(height: 24),
            
            // --- Botón de Cerrar Sesión ---
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text('Log Out', style: TextStyle(color: Colors.red, fontSize: 16)),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget reutilizable para los números de estadísticas
  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1B5E20))),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  // Widget reutilizable para la línea separadora vertical
  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }

  // Widget reutilizable para las filas del menú
  Widget _buildMenuOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1B5E20)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {}, // Aquí irá la acción en el futuro
      ),
    );
  }
}