import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Aquí está el cerebro: La variable que controla el idioma de toda la pantalla
  bool isEnglish = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16231C), // Fondo Verde Pino Nocturno
      appBar: AppBar(
        backgroundColor: const Color(0xFF16231C),
        elevation: 0,
        toolbarHeight: 60,
        title: Text(
          isEnglish ? 'Membership' : 'Membresía', // Traducción dinámica
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26, letterSpacing: -0.5)
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 14, right: 8),
            // Le pasamos al botón nuestro idioma y la orden de cambiarlo
            child: LanguageToggle(
              isEnglish: isEnglish,
              onToggle: () {
                setState(() {
                  isEnglish = !isEnglish; // Cambia de verdadero a falso y recarga la pantalla
                });
              },
            ), 
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFFC5A880), size: 20),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- EL DNI DE GOLF ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A120D), 
                  borderRadius: BorderRadius.circular(16), 
                  border: Border.all(color: const Color(0xFFC5A880).withOpacity(0.6), width: 1.5), 
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 10))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isEnglish ? 'GREENMATCH OFFICIAL ID' : 'ID OFICIAL GREENMATCH', 
                          style: const TextStyle(color: Color(0xFFC5A880), fontSize: 10, fontFamily: 'sans-serif', letterSpacing: 2.0, fontWeight: FontWeight.bold)
                        ),
                        Icon(Icons.qr_code_scanner, color: const Color(0xFFC5A880).withOpacity(0.8), size: 20), 
                      ],
                    ),
                    Divider(color: const Color(0xFFC5A880).withOpacity(0.3), height: 24, thickness: 0.5),
                    
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFC5A880), width: 1),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network('https://randomuser.me/api/portraits/men/32.jpg', width: 85, height: 110, fit: BoxFit.cover), 
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('RIVERO, CARLOS', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                              const SizedBox(height: 4),
                              Text(isEnglish ? 'Seville, Andalusia' : 'Sevilla, Andalucía', style: const TextStyle(color: Colors.white70, fontSize: 12, fontFamily: 'sans-serif')),
                              const SizedBox(height: 12),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildIDStat(isEnglish ? 'HANDICAP' : 'HÁNDICAP', '18.2'),
                                  _buildIDStat(isEnglish ? 'STATUS' : 'ESTADO', 'AMATEUR'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildIDStat(isEnglish ? 'PLAYING SINCE' : 'JUGANDO DESDE', '2018'), 
                                  _buildIDStat(isEnglish ? 'APP MATCHES' : 'PARTIDOS APP', '34'),     
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildIDStat(isEnglish ? 'MEMBER SINCE' : 'MIEMBRO DESDE', '2024'), 
                                  _buildIDStat(isEnglish ? 'LICENSE NO.' : 'Nº LICENCIA', 'GM-8492X'),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              Text(isEnglish ? 'PREFERENCES' : 'PREFERENCIAS', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white54, letterSpacing: 2.0, fontFamily: 'sans-serif')),
              const SizedBox(height: 16),
              _buildPreferenceRow(isEnglish ? 'Time' : 'Horario', isEnglish ? 'Morning' : 'Mañana'),
              _buildPreferenceRow(isEnglish ? 'Modality' : 'Modalidad', 'Stableford'),
              const SizedBox(height: 40),

              Text(isEnglish ? 'CLUB PRIVILEGES' : 'PRIVILEGIOS DEL CLUB', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFFC5A880), letterSpacing: 2.0, fontFamily: 'sans-serif')),
              const SizedBox(height: 16),
              _buildPremiumRow(isEnglish ? 'Members Feed' : 'Muro de Miembros'),
              _buildPremiumRow(isEnglish ? 'Buggy Concierge' : 'Reserva de Buggy'),
              _buildPremiumRow(isEnglish ? 'Rules AI Assistant' : 'Asistente IA de Normas'),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIDStat(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFFC5A880), fontSize: 8, fontFamily: 'sans-serif', letterSpacing: 1.0)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'sans-serif')),
        ],
      ),
    );
  }

  Widget _buildPreferenceRow(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF223329), 
        border: Border.all(color: Colors.white12, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontFamily: 'Georgia', fontStyle: FontStyle.italic, color: Colors.white70)),
          Text(value.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11, fontFamily: 'sans-serif', letterSpacing: 1.0)),
        ],
      ),
    );
  }

  Widget _buildPremiumRow(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFC5A880).withOpacity(0.05),
        border: Border.all(color: const Color(0xFFC5A880).withOpacity(0.3), width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
          const Icon(Icons.lock_outline, color: Color(0xFFC5A880), size: 16),
        ],
      ),
    );
  }
}

// =====================================================================
// COMPONENTE DESLIZADOR (Ahora recibe las órdenes de la pantalla principal)
// =====================================================================
class LanguageToggle extends StatelessWidget {
  final bool isEnglish;
  final VoidCallback onToggle;

  const LanguageToggle({
    super.key, 
    required this.isEnglish, 
    required this.onToggle
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle, // Al tocar, avisa a la pantalla entera para que se recargue
      child: Container(
        width: 60,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFF0A120D),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFC5A880).withOpacity(0.5), width: 1), 
        ),
        child: Stack(
          children: [
            const Positioned(
              left: 6,
              top: 4,
              child: Text('🇪🇸', style: TextStyle(fontSize: 14)),
            ),
            const Positioned(
              right: 6,
              top: 4,
              child: Text('🇬🇧', style: TextStyle(fontSize: 14)),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              left: isEnglish ? 30.0 : 4.0, 
              top: 3,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFC5A880), 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}