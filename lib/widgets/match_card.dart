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
        color: const Color(0xFF0A120D), // Fondo carbón casi negro
        border: Border.all(color: Colors.white12, width: 0.5), // Borde súper fino y sutil
        // Esquinas rectas para mantener el estilo lujo editorial
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(course, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
              Text(modality.toUpperCase(), style: const TextStyle(color: Color(0xFFC5A880), fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.5, fontFamily: 'sans-serif')),
            ],
          ),
          const SizedBox(height: 12),
          
          Row(
            children: [
              const Icon(Icons.schedule, size: 14, color: Colors.white54),
              const SizedBox(width: 8),
              Text(time, style: const TextStyle(color: Colors.white70, fontSize: 13, fontFamily: 'sans-serif')),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.flag_outlined, size: 14, color: Colors.white54),
              const SizedBox(width: 8),
              Text(requirement, style: const TextStyle(color: Colors.white54, fontSize: 13, fontFamily: 'sans-serif')),
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
                  if (playerImages.isEmpty)
                    const Text('Be the first to join', style: TextStyle(color: Colors.white54, fontSize: 13, fontStyle: FontStyle.italic, fontFamily: 'sans-serif'))
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
                                border: Border.all(color: const Color(0xFF0A120D), width: 1.5),
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
                  Text(status, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'sans-serif')),
                ],
              ),
              
              // Botón "Join" dorado con bordes rectos
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFC5A880),
                  side: const BorderSide(color: Color(0xFFC5A880), width: 1),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
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