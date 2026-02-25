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
      width: 240,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 0.5), // Borde finísimo y elegante
        // Cero BorderRadius = Esquinas rectas, estilo revista
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen limpia
          Image.network(imageUrl, height: 160, width: double.infinity, fit: BoxFit.cover),
          
          // Contenido de texto
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toUpperCase(), // Mayúsculas para dar autoridad
                  style: const TextStyle(color: Color(0xFF072B15), fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.5)
                ),
                const SizedBox(height: 6),
                Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'sans-serif')),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('FROM $price', style: const TextStyle(color: Color(0xFFB89768), fontWeight: FontWeight.bold, fontSize: 11, fontFamily: 'sans-serif', letterSpacing: 1.0)),
                    const Icon(Icons.arrow_forward, size: 16, color: Color(0xFF072B15)), // Flecha clásica
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}