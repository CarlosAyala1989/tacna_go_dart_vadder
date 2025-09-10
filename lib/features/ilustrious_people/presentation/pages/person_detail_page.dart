import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class PersonDetailPage extends StatelessWidget {
  final Map<String, String> person;

  const PersonDetailPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.getTextPrimary(context)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              color: AppColors.getTextPrimary(context),
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
            // --- Imagen del Personaje ---
            Container(
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(person['imageUrl']!),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    // En caso de error, se muestra un placeholder
                  },
                ),
              ),
              child: person['imageUrl']!.isEmpty
                  ? Container(
                      color: AppColors.getTextSecondary(
                        context,
                      ).withOpacity(0.2),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 120,
                          color: AppColors.getTextSecondary(context),
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 24),

            // --- Nombre y Descripción ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(person['name']!, style: TextStyles.getHeading2(context)),
                  const SizedBox(height: 16),
                  Text(
                    person['description']!,
                    style: TextStyles.getBodyLg(context),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Información Adicional (Placeholder) ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Legado histórico',
                    style: TextStyles.getHeading3(context),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Su contribución a la historia de Tacna y del Perú trasciende generaciones, siendo recordado como uno de los personajes más importantes de nuestra región.',
                    style: TextStyles.getBodyLg(context),
                    textAlign: TextAlign.justify,
                  ),
                ],
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
                        // TODO: Implementar funcionalidad adicional
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Funcionalidad próximamente'),
                          ),
                        );
                      },
                      child: const Text('Más información'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Implementar lógica para compartir
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Compartir próximamente'),
                          ),
                        );
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
