import 'package:flutter/material.dart';

class MatchCard extends StatefulWidget {
  final String course;
  final String time;
  final String status;
  final String requirement;
  final String modality;
  final List<String> playerImages;

  const MatchCard({
    super.key,
    required this.course,
    required this.time,
    required this.status,
    required this.requirement,
    this.modality = 'Stableford',
    this.playerImages = const [],
  });

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  // Variables de estado para recordar quién está en el partido
  late List<String> _currentPlayers;
  late bool _hasJoined;
  
  // Tu foto de perfil (El usuario Carlos)
  final String _myProfilePic = 'https://randomuser.me/api/portraits/men/32.jpg';

  @override
  void initState() {
    super.initState();
    // Al cargar la tarjeta, copiamos los jugadores que ya había
    _currentPlayers = List.from(widget.playerImages);
    // Comprobamos si tú ya estabas en este partido (por ejemplo, si lo acabas de crear tú)
    _hasJoined = _currentPlayers.contains(_myProfilePic);
  }

  // La función mágica que se ejecuta al pulsar "JOIN"
  void _joinMatch() {
    if (!_hasJoined) {
      setState(() {
        _currentPlayers.add(_myProfilePic); // Añadimos tu foto a la lista
        _hasJoined = true; // Cambiamos el estado del botón
      });
      
      // Aquí mostraríamos un mensajito de éxito en la vida real
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You joined the match at ${widget.course}! 🏌️‍♂️', style: const TextStyle(fontFamily: 'sans-serif')),
          backgroundColor: const Color(0xFFC5A880),
          behavior: SnackBarBehavior.floating,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0A120D), // Fondo carbón casi negro
        border: Border.all(color: Colors.white12, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.course, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
              Text(widget.modality.toUpperCase(), style: const TextStyle(color: Color(0xFFC5A880), fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5, fontFamily: 'sans-serif')),
            ],
          ),
          const SizedBox(height: 12),
          
          Row(
            children: [
              const Icon(Icons.schedule, size: 14, color: Colors.white54),
              const SizedBox(width: 8),
              Text(widget.time, style: const TextStyle(color: Colors.white70, fontSize: 13, fontFamily: 'sans-serif')),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.flag_outlined, size: 14, color: Colors.white54),
              const SizedBox(width: 8),
              Text(widget.requirement, style: const TextStyle(color: Colors.white54, fontSize: 13, fontFamily: 'sans-serif')),
            ],
          ),
          
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(height: 1, thickness: 0.5, color: Colors.white12),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (_currentPlayers.isEmpty)
                    const Text('Be the first to join', style: TextStyle(color: Colors.white54, fontSize: 13, fontStyle: FontStyle.italic, fontFamily: 'sans-serif'))
                  else
                    SizedBox(
                      height: 28,
                      width: 28.0 * _currentPlayers.length - (_currentPlayers.length > 1 ? 8.0 * (_currentPlayers.length - 1) : 0),
                      child: Stack(
                        children: List.generate(_currentPlayers.length, (index) {
                          return Positioned(
                            left: index * 20.0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xFF0A120D), width: 1.5),
                              ),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage(_currentPlayers[index]),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  const SizedBox(width: 12),
                  // Si te has unido, ocultamos el texto de "X players needed" para simplificar
                  if (!_hasJoined)
                    Text(widget.status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'sans-serif')),
                ],
              ),
              
              // El botón que cambia según si te has unido o no
              _hasJoined
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: const BoxDecoration(
                        color: Color(0xFFC5A880), // Fondo dorado sólido al unirte
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.check, color: Color(0xFF0A120D), size: 14),
                          SizedBox(width: 4),
                          Text('JOINED', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF0A120D), letterSpacing: 1.5, fontFamily: 'sans-serif')),
                        ],
                      ),
                    )
                  : OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFC5A880),
                        side: const BorderSide(color: Color(0xFFC5A880), width: 1),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      onPressed: _joinMatch, // Llamamos a la función al pulsar
                      child: const Text('JOIN', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontFamily: 'sans-serif')),
                    )
            ],
          ),
        ],
      ),
    );
  }
}