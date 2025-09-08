import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart'; // Asegúrate que la ruta sea correcta
import '../../../../core/theme/text_styles.dart'; // Asegúrate que la ruta sea correcta
import '../../../historical_places/presentation/pages/places_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos el color de fondo de nuestro tema
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      // El AppBar ya toma los colores y estilos de nuestro AppTheme
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text('Tacna', style: TextStyles.heading3),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.settings_outlined,
            color: AppColors.textPrimary,
          ),
          onPressed: () {
            // TODO: Navegar a la pantalla de configuración
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            _buildSearchBar(),
            const SizedBox(height: 24),
            _buildHeroBanner(),
            const SizedBox(height: 24),
            _buildDidYouKnowCard(),
            const SizedBox(height: 24),
            const Text('Categorías', style: TextStyles.heading3),
            const SizedBox(height: 16),
            _buildCategoriesList(),
            const SizedBox(height: 24),
            _buildMapPreview(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextFormField(
      decoration: InputDecoration(
        // El estilo base viene del AppTheme, solo añadimos el icono
        hintText: 'Buscar en Tacna...',
        prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const NetworkImage(
            'https://picsum.photos/seed/tacna1/800/600',
          ), // Imagen de placeholder
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: const Align(
        alignment: Alignment.bottomLeft,
        child: Text('Descubre la Heroica Ciudad', style: TextStyles.heading1),
      ),
    );
  }

  Widget _buildDidYouKnowCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const NetworkImage(
            'https://picsum.photos/seed/tacna2/800/600',
          ), // Imagen de placeholder
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¿Sabías que...?',
            style: TextStyles.heading2.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 8),
          Text(
            "Tacna es conocida como la 'Ciudad Heroica' por su papel en la Guerra del Pacífico.",
            style: TextStyles.bodyLg.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList() {
    final categories = {
      'Lugares Históricos': 'https://picsum.photos/seed/cat1/200/200',
      'Efemérides': 'https://picsum.photos/seed/cat2/200/200',
      'Gastronomía': 'https://picsum.photos/seed/cat3/200/200',
      'Personajes Ilustres': 'https://picsum.photos/seed/cat4/200/200',
    };

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final title = categories.keys.elementAt(index);
          final imageUrl = categories.values.elementAt(index);

          // AÑADIMOS EL GESTUREDETECTOR PARA LA NAVEGACIÓN
          return GestureDetector(
            onTap: () {
              // Verificamos si es la categoría correcta para navegar
              if (title == 'Lugares Históricos') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlacesListPage(),
                  ),
                );
              }
              // Aquí podríamos añadir más `if` para otras categorías en el futuro
            },
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(title, style: TextStyles.bodyLgMedium),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMapPreview() {
    return Column(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/seed/map/800/400'),
              fit: BoxFit.cover,
            ),
            // TODO: Aquí iría el widget de mapa real
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: () {
            // TODO: Navegar a la pantalla de mapa completo
          },
          // Este botón ya toma el estilo de nuestro AppTheme
          child: const Text('Ver mapa completo'),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.surface, width: 1.5)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomNavItem(icon: Icons.home, isActive: true),
          _BottomNavItem(icon: Icons.map_outlined),
          _BottomNavItem(icon: Icons.calendar_today_outlined),
          _BottomNavItem(icon: Icons.search),
        ],
      ),
    );
  }
}

// Widget auxiliar para los items de la barra de navegación
class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const _BottomNavItem({required this.icon, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
        size: 28,
      ),
      onPressed: () {
        // TODO: Lógica de navegación
      },
    );
  }
}
