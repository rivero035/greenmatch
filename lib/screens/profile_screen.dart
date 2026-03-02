import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // El nuevo plugin
import 'dart:typed_data'; // Para leer la foto real

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // --- VARIABLES DE ESTADO ---
  bool isEnglish = true; 
  String userName = 'RIVERO, CARLOS';
  String userLocation = 'Seville, Andalusia';
  String userHandicap = '18.2';
  String userStatus = 'AMATEUR';
  
  // NUEVO: Variables para la foto real
  final String _defaultImageUrl = 'https://randomuser.me/api/portraits/men/32.jpg';
  Uint8List? _userProfileBytes; // Aquí guardaremos la foto de tu galería

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _handicapController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  // Herramienta para abrir la galería
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _handicapController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  // --- EL FORMULARIO CON GALERÍA REAL ---
  void _showEditProfileModal(BuildContext context) {
    _nameController.text = userName;
    _locationController.text = userLocation;
    _handicapController.text = userHandicap;
    _statusController.text = userStatus;
    
    // Memoria temporal mientras estás en el menú
    Uint8List? tempProfileBytes = _userProfileBytes;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      backgroundColor: Colors.transparent, 
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.85, 
                decoration: BoxDecoration(
                  color: const Color(0xFF0A120D), 
                  border: Border.all(color: const Color(0xFFC5A880).withOpacity(0.3), width: 1),
                ),
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Container(width: 30, height: 2, color: const Color(0xFFC5A880))),
                      const SizedBox(height: 30),
                      Text(isEnglish ? 'Update Official ID' : 'Actualizar ID Oficial', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: -0.5)),
                      const SizedBox(height: 30),

                      // --- SELECTOR DE GALERÍA REAL ---
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            // Abrimos la galería de tu móvil/ordenador
                            final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                            if (image != null) {
                              // Leemos la foto que has elegido
                              final bytes = await image.readAsBytes();
                              setModalState(() {
                                tempProfileBytes = bytes; // La mostramos en el menú
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color(0xFFC5A880), width: 2),
                                    ),
                                    child: CircleAvatar(
                                      radius: 40,
                                      // Si has elegido foto de la galería, la mostramos. Si no, mostramos la de por defecto.
                                      backgroundImage: tempProfileBytes != null 
                                          ? MemoryImage(tempProfileBytes!) as ImageProvider
                                          : NetworkImage(_defaultImageUrl),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(color: Color(0xFFC5A880), shape: BoxShape.circle),
                                    child: const Icon(Icons.camera_alt, color: Color(0xFF0A120D), size: 16),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(isEnglish ? 'CHOOSE FROM GALLERY' : 'ELEGIR DE GALERÍA', style: const TextStyle(color: Color(0xFFC5A880), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontFamily: 'sans-serif')),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      _buildInputField(isEnglish ? 'FULL NAME' : 'NOMBRE COMPLETO', _nameController),
                      const SizedBox(height: 20),
                      _buildInputField(isEnglish ? 'LOCATION' : 'UBICACIÓN', _locationController),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: _buildInputField(isEnglish ? 'HANDICAP' : 'HÁNDICAP', _handicapController)),
                          const SizedBox(width: 20),
                          Expanded(child: _buildInputField(isEnglish ? 'STATUS' : 'ESTADO', _statusController)),
                        ],
                      ),
                      const SizedBox(height: 40),

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
                            setState(() {
                              userName = _nameController.text.toUpperCase(); 
                              userLocation = _locationController.text;
                              userHandicap = _handicapController.text;
                              userStatus = _statusController.text.toUpperCase();
                              _userProfileBytes = tempProfileBytes; // ¡Guardamos la foto de tu galería en el DNI!
                            });
                            Navigator.pop(context); 
                          },
                          child: Text(isEnglish ? 'SAVE CHANGES' : 'GUARDAR CAMBIOS', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0A120D), letterSpacing: 2.0, fontFamily: 'sans-serif')),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        );
      },
    );
  }

  Widget _buildInputField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFFC5A880), letterSpacing: 1.5, fontFamily: 'sans-serif')),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontFamily: 'Georgia', fontSize: 16),
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white12)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFC5A880))),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16231C), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF16231C),
        elevation: 0,
        toolbarHeight: 60,
        title: Text(
          isEnglish ? 'Membership' : 'Membresía',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26, letterSpacing: -0.5)
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 14, bottom: 14, right: 8),
            child: LanguageToggle(
              isEnglish: isEnglish,
              onToggle: () {
                setState(() {
                  isEnglish = !isEnglish; 
                });
              },
            ), 
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFFC5A880), size: 20),
            onPressed: () => _showEditProfileModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- EL DNI DE GOLF DINÁMICO ---
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
                            // AQUÍ CARGAMOS LA FOTO (Tu foto real o la de por defecto)
                            child: _userProfileBytes != null
                                ? Image.memory(_userProfileBytes!, width: 85, height: 110, fit: BoxFit.cover)
                                : Image.network(_defaultImageUrl, width: 85, height: 110, fit: BoxFit.cover), 
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userName, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                              const SizedBox(height: 4),
                              Text(userLocation, style: const TextStyle(color: Colors.white70, fontSize: 12, fontFamily: 'sans-serif')),
                              const SizedBox(height: 12),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildIDStat(isEnglish ? 'HANDICAP' : 'HÁNDICAP', userHandicap),
                                  _buildIDStat(isEnglish ? 'STATUS' : 'ESTADO', userStatus),
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
// COMPONENTE DESLIZADOR 
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
      onTap: onToggle, 
      child: Container(
        width: 60, height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFF0A120D),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFC5A880).withOpacity(0.5), width: 1), 
        ),
        child: Stack(
          children: [
            const Positioned(left: 6, top: 4, child: Text('🇪🇸', style: TextStyle(fontSize: 14))),
            const Positioned(right: 6, top: 4, child: Text('🇬🇧', style: TextStyle(fontSize: 14))),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              left: isEnglish ? 30.0 : 4.0, 
              top: 3,
              child: Container(
                width: 24, height: 24,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFC5A880)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}