import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final String imageUrl;
  final String crestUrl;

  const CourseCard({
    super.key,
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
    this.crestUrl = 'https://cdn-icons-png.flaticon.com/512/3232/3232049.png', 
  });

  @override
  Widget build(BuildContext context) {
    // 🛡️ TRUCO ANTI-CORS: Envolvemos las URLs en un proxy gratuito para que el navegador web no las bloquee
    final String safeImageUrl = 'https://corsproxy.io/?${Uri.encodeComponent(imageUrl)}';
    final String safeCrestUrl = 'https://corsproxy.io/?${Uri.encodeComponent(crestUrl)}';

    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 0.5), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Usamos la URL segura
              Image.network(
                safeImageUrl, 
                height: 160, 
                width: double.infinity, 
                fit: BoxFit.cover,
                // Añadimos esto por si el proxy falla, que no pete la app
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 160, width: double.infinity, color: Colors.grey[200],
                  child: const Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              ),
              
              Positioned(
                bottom: -24, 
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(2), 
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.transparent,
                    // Usamos la URL segura para el escudo
                    backgroundImage: NetworkImage(safeCrestUrl),
                    onBackgroundImageError: (exception, stackTrace) {}, // Evita errores rojos
                  ),
                ),
              )
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 36, 16, 16), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toUpperCase(), 
                  style: const TextStyle(color: Color(0xFF072B15), fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.5)
                ),
                const SizedBox(height: 6),
                Text(
                  location, 
                  style: const TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'sans-serif')
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FROM $price', 
                      style: const TextStyle(color: Color(0xFFB89768), fontWeight: FontWeight.bold, fontSize: 12, fontFamily: 'sans-serif', letterSpacing: 1.0)
                    ),
                    const Icon(Icons.arrow_forward, size: 18, color: Color(0xFF072B15)),
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