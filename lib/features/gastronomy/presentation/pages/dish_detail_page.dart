import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class DishDetailPage extends StatelessWidget {
  final Map<String, String> dish;

  const DishDetailPage({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
            // --- Imagen del plato ---
            Container(
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.textSecondary.withOpacity(0.2),
              ),
              child: dish['imageUrl']!.isNotEmpty
                  ? Image.network(
                      dish['imageUrl']!,
                      height: 320,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 320,
                          width: double.infinity,
                          color: AppColors.textSecondary.withOpacity(0.2),
                          child: const Icon(
                            Icons.restaurant,
                            color: AppColors.textSecondary,
                            size: 64,
                          ),
                        );
                      },
                    )
                  : const Icon(
                      Icons.restaurant,
                      color: AppColors.textSecondary,
                      size: 64,
                    ),
            ),
            const SizedBox(height: 24),

            // --- Título y Descripción ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dish['title']!, style: TextStyles.heading2),
                  const SizedBox(height: 16),
                  if (dish['description'] != null &&
                      dish['description']!.isNotEmpty)
                    Text(dish['description']!, style: TextStyles.bodyLg),
                ],
              ),
            ),

            // --- Secciones adicionales si están disponibles ---
            if (dish['information'] != null &&
                dish['information']!.isNotEmpty) ...[
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Información', style: TextStyles.heading3),
                    const SizedBox(height: 8),
                    Text(dish['information']!, style: TextStyles.bodyLg),
                  ],
                ),
              ),
            ],

            if (dish['ingredients'] != null &&
                dish['ingredients']!.isNotEmpty) ...[
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ingredientes', style: TextStyles.heading3),
                    const SizedBox(height: 8),
                    Text(dish['ingredients']!, style: TextStyles.bodyLg),
                  ],
                ),
              ),
            ],

            if (dish['preparation'] != null &&
                dish['preparation']!.isNotEmpty) ...[
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Preparación', style: TextStyles.heading3),
                    const SizedBox(height: 8),
                    Text(dish['preparation']!, style: TextStyles.bodyLg),
                  ],
                ),
              ),
            ],

            if (dish['occasion'] != null && dish['occasion']!.isNotEmpty) ...[
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ocasión de Consumo', style: TextStyles.heading3),
                    const SizedBox(height: 8),
                    Text(dish['occasion']!, style: TextStyles.bodyLg),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            // --- Placeholder para imagen adicional ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  height: 180,
                  width: double.infinity,
                  color: AppColors.textSecondary.withOpacity(0.1),
                  child: const Icon(
                    Icons.image,
                    color: AppColors.textSecondary,
                    size: 48,
                  ),
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
                        // TODO: Implementar 'Buscar restaurantes' con url_launcher
                      },
                      child: const Text('Buscar restaurantes'),
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
