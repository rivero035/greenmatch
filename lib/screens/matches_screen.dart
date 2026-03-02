import 'package:flutter/material.dart';
import '../widgets/match_card.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  // 🧠 NUESTRA BASE DE DATOS LOCAL (Aquí se guardan los partidos)
  final List<Map<String, dynamic>> _openMatches = [
    {
      'course': 'Zaudín Golf',
      'time': 'Tomorrow, 10:30 AM',
      'status': '1 player needed',
      'requirement': 'Handicap: 15-20',
      'modality': 'Scramble',
      'playerImages': [
        'https://randomuser.me/api/portraits/men/44.jpg',
        'https://randomuser.me/api/portraits/men/45.jpg',
        'https://randomuser.me/api/portraits/women/44.jpg'
      ],
    },
    {
      'course': 'Hato Verde',
      'time': 'Saturday, 09:00 AM',
      'status': '2 players needed',
      'requirement': 'Open (Social)',
      'modality': 'Stableford',
      'playerImages': [
        'https://randomuser.me/api/portraits/men/22.jpg',
        'https://randomuser.me/api/portraits/women/23.jpg'
      ],
    },
  ];

  // Controladores para leer lo que el usuario escribe en el formulario
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _modalityController = TextEditingController();

  @override
  void dispose() {
    // Limpiamos la memoria cuando se cierra la pantalla
    _courseController.dispose();
    _timeController.dispose();
    _modalityController.dispose();
    super.dispose();
  }

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
            unselectedLabelColor: Colors.white54,
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
            // --- PESTAÑA 1: LISTA DINÁMICA DE PARTIDOS ---
            ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: _openMatches.length,
              itemBuilder: (context, index) {
                final match = _openMatches[index];
                return MatchCard(
                  course: match['course'],
                  time: match['time'],
                  status: match['status'],
                  requirement: match['requirement'],
                  modality: match['modality'],
                  playerImages: List<String>.from(match['playerImages']),
                );
              },
            ),

            // --- PESTAÑA 2: MIS PARTIDOS (Estático por ahora) ---
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
        
        // Botón flotante para crear partido
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showCreateMatchBottomSheet(context),
          backgroundColor: const Color(0xFFC5A880), 
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
          child: const Icon(Icons.add, color: Color(0xFF0A120D)), 
        ),
      ),
    );
  }

  // --- EL FORMULARIO DE CREACIÓN DE PARTIDOS ---
  void _showCreateMatchBottomSheet(BuildContext context) {
    // Limpiamos los campos antes de abrir
    _courseController.clear();
    _timeController.clear();
    _modalityController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Para que el teclado no tape el formulario
      backgroundColor: Colors.transparent, 
      builder: (context) {
        return Padding(
          // Esto empuja el menú hacia arriba cuando sale el teclado del móvil
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.70,
            decoration: BoxDecoration(
              color: const Color(0xFF0A120D), // Fondo Carbón
              border: Border.all(color: const Color(0xFFC5A880).withOpacity(0.3), width: 1),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(width: 30, height: 2, color: const Color(0xFFC5A880)),
                ),
                const SizedBox(height: 30),
                const Text('Schedule Tee Time', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -0.5)),
                const SizedBox(height: 30),

                // Campos de texto interactivos estilo Lujo
                _buildInputField('LOCATION', _courseController, 'e.g. Real Club Pineda'),
                const SizedBox(height: 24),
                _buildInputField('DATE & TIME', _timeController, 'e.g. Sunday, 08:30 AM'),
                const SizedBox(height: 24),
                _buildInputField('MODALITY', _modalityController, 'e.g. Foursomes'),
                
                const Spacer(),

                // EL BOTÓN MÁGICO QUE GUARDA LOS DATOS
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC5A880), 
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
                      elevation: 0,
                    ),
                    onPressed: () {
                      // 1. Añadimos el nuevo partido a nuestra "Base de Datos"
                      setState(() {
                        _openMatches.insert(0, {
                          'course': _courseController.text.isEmpty ? 'Unknown Course' : _courseController.text,
                          'time': _timeController.text.isEmpty ? 'TBD' : _timeController.text,
                          'status': '3 players needed', // Por defecto, faltan 3
                          'requirement': 'Open (Social)', 
                          'modality': _modalityController.text.isEmpty ? 'Stableford' : _modalityController.text,
                          'playerImages': [
                            'https://randomuser.me/api/portraits/men/32.jpg' // Tu foto de perfil
                          ],
                        });
                      });
                      // 2. Cerramos el menú desplegable
                      Navigator.pop(context);
                    },
                    child: const Text('CONFIRM', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0A120D), letterSpacing: 2.0, fontFamily: 'sans-serif')),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Componente reutilizable para los campos de texto del formulario
  Widget _buildInputField(String title, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFFC5A880), letterSpacing: 1.5, fontFamily: 'sans-serif')),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontFamily: 'Georgia', fontSize: 18),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38, fontStyle: FontStyle.italic, fontSize: 16),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white12)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFC5A880))),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ],
    );
  }
}