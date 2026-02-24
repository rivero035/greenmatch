import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final String imageUrl;

  const CourseCard({
    super.key,
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260, // Tarjeta un poco más ancha
      margin: const EdgeInsets.only(right: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24), // Bordes mucho más redondeados
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0B3B24).withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Imagen de fondo ocupando todo
            Image.network(imageUrl, height: 260, width: double.infinity, fit: BoxFit.cover),
            
            // Degradado oscuro en la parte de abajo para que el texto se lea perfecto
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 120,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  ),
                ),
              ),
            ),

            // Textos sobre la imagen
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name, 
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 0.5)
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFFC5A880), size: 14), // Icono dorado
                      const SizedBox(width: 4),
                      Text(location, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC5A880), // Botón Dorado
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      price, 
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}