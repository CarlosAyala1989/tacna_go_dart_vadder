import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class PlaceDetailPage extends StatelessWidget {
  // Recibimos los datos del lugar para mostrarlos
  // En el futuro, esto sería un objeto 'PlaceEntity' del dominio
  final Map<String, String> place;

  const PlaceDetailPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos un truco para tener un AppBar transparente sobre el contenido
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // El ícono de 'atrás' se colorea automáticamente por el tema
        // pero podemos asegurarnos de que sea del color correcto
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {
              // TODO: Implementar lógica para compartir
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Galería de Imágenes ---
            Image.network(
              place['imageUrl']!,
              height: 320,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),

            // --- Título y Descripción ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place['title']!, style: TextStyles.heading2),
                  const SizedBox(height: 16),
                  Text(
                    // Usamos una descripción más larga de placeholder
                    'The Parabolic Arch of Tacna is a monument erected in honor of the heroes of the War of the Pacific. It is located in the Civic Square of Tacna and is one of the most emblematic symbols of the city. The arch is made of reinforced concrete and has a parabolic shape, hence its name.',
                    style: TextStyles.bodyLg,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Mapa Embebido (Placeholder) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/d/d6/5TR7A64LSBHVLI2RHAUGT2ZNI4.jpg',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- Botones de Acción ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implementar 'Cómo llegar' con url_launcher
                      },
                      child: const Text('Cómo llegar'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Implementar lógica para compartir
                      },
                      child: const Text('Compartir'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
