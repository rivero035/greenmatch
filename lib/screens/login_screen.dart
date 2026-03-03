import 'package:flutter/material.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Para cambiar entre buscar por Licencia o por Nombre
  bool _searchByLicense = true;
  bool _isLoading = false;

  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surname1Controller = TextEditingController();
  final TextEditingController _surname2Controller = TextEditingController();

  // Función que simula la conexión con la RFEG
  void _verifyFederation() async {
    // Escondemos el teclado
    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
    });

    // Simulamos que el servidor está buscando en la web de la RFEG (espera 2.5 segundos)
    await Future.delayed(const Duration(milliseconds: 2500));

    if (!mounted) return;

    // Navegamos a la pantalla principal de la app
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16231C), // Verde Pino Nocturno
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo de la App
              const Icon(Icons.golf_course, color: Color(0xFFC5A880), size: 60),
              const SizedBox(height: 16),
              const Text(
                'GREENMATCH',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4.0,
                  fontFamily: 'Georgia',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'OFFICIAL CLUB ACCESS',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFC5A880), fontSize: 10, letterSpacing: 2.0, fontFamily: 'sans-serif'),
              ),
              const SizedBox(height: 60),

              // Selector: Licencia o Nombre
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildToggleBtn('LICENSE NO.', _searchByLicense, () => setState(() => _searchByLicense = true)),
                  const SizedBox(width: 20),
                  _buildToggleBtn('FULL NAME', !_searchByLicense, () => setState(() => _searchByLicense = false)),
                ],
              ),
              const SizedBox(height: 40),

              // Formulario Dinámico
              if (_searchByLicense)
                _buildInputField('RFEG LICENSE NUMBER', _licenseController, 'e.g. AM00123456')
              else
                Column(
                  children: [
                    _buildInputField('NAME', _nameController, 'e.g. Carlos'),
                    const SizedBox(height: 20),
                    _buildInputField('FIRST SURNAME', _surname1Controller, 'e.g. Rivero'),
                    const SizedBox(height: 20),
                    _buildInputField('SECOND SURNAME', _surname2Controller, 'e.g. García'),
                  ],
                ),
              
              const SizedBox(height: 50),

              // Botón de Verificar o Animación de Carga
              _isLoading
                  ? Column(
                      children: const [
                        CircularProgressIndicator(color: Color(0xFFC5A880)),
                        SizedBox(height: 16),
                        Text('Connecting to RFEG Database...', style: TextStyle(color: Colors.white54, fontSize: 12, fontStyle: FontStyle.italic)),
                      ],
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC5A880),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                      onPressed: _verifyFederation,
                      child: const Text('VERIFY FEDERATION STATUS', style: TextStyle(color: Color(0xFF0A120D), fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 12)),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // Mini-componentes para que el código quede limpio
  Widget _buildToggleBtn(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? const Color(0xFFC5A880) : Colors.white38,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(width: 20, height: 2, color: const Color(0xFFC5A880))
        ],
      ),
    );
  }

  Widget _buildInputField(String title, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white54, letterSpacing: 1.5, fontFamily: 'sans-serif')),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontFamily: 'Georgia', fontSize: 18),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white24, fontStyle: FontStyle.italic, fontSize: 16),
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