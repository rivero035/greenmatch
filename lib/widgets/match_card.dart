import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 0.5),
        // Esquinas rectas de nuevo
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título y Modalidad
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(course, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF072B15))),
              Text(modality.toUpperCase(), style: const TextStyle(color: Color(0xFFB89768), fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5, fontFamily: 'sans-serif')),
            ],
          ),
          const SizedBox(height: 12),
          
          // Detalles
          Row(
            children: [
              const Icon(Icons.schedule, size: 14, color: Colors.grey),
              const SizedBox(width: 8),
              Text(time, style: const TextStyle(color: Colors.black87, fontSize: 13, fontFamily: 'sans-serif')),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.flag_outlined, size: 14, color: Colors.grey),
              const SizedBox(width: 8),
              Text(requirement, style: const TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'sans-serif')),
            ],
          ),
          
          // Línea separadora ultra fina
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(height: 1, thickness: 0.5, color: Colors.black12),
          ),

          // Jugadores y botón
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (playerImages.isEmpty)
                    const Text('Be the first to join', style: TextStyle(color: Colors.grey, fontSize: 13, fontStyle: FontStyle.italic, fontFamily: 'sans-serif'))
                  else
                    SizedBox(
                      height: 28,
                      width: 28.0 * playerImages.length - (playerImages.length > 1 ? 8.0 * (playerImages.length - 1) : 0),
                      child: Stack(
                        children: List.generate(playerImages.length, (index) {
                          return Positioned(
                            left: index * 20.0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 1.5),
                              ),
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: NetworkImage(playerImages[index]),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  const SizedBox(width: 12),
                  Text(status, style: const TextStyle(color: Color(0xFF072B15), fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'sans-serif')),
                ],
              ),
              
              // Botón "Join" con esquinas rectas y texto espaciado
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF072B15),
                  side: const BorderSide(color: Color(0xFF072B15), width: 1),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // ¡Bordes 100% rectos!
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {},
                child: const Text('JOIN', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontFamily: 'sans-serif')),
              )
            ],
          ),
        ],
      ),
    );
  }
}