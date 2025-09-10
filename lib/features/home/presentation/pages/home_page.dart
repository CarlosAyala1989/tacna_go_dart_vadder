import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart'; // Asegúrate que la ruta sea correcta
import '../../../../core/theme/text_styles.dart'; // Asegúrate que la ruta sea correcta
import '../../../historical_places/presentation/pages/places_list_page.dart';
import '../../../events/presentation/pages/events_page.dart';
import '../../../map/presentation/pages/map_page.dart';
import '../../../search/presentation/pages/search_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos el color de fondo dinámico según el tema
      backgroundColor: AppColors.getBackground(context),
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      // El AppBar ya toma los colores y estilos de nuestro AppTheme
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Tacna', style: TextStyles.getHeading3(context)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings_outlined,
            color: AppColors.getTextPrimary(context),
          ),
          onPressed: () {
            // --- NAVEGACIÓN A LA PÁGINA DE CONFIGURACIÓN AQUÍ ---
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            _buildSearchBar(context),
            const SizedBox(height: 24),
            _buildHeroBanner(context),
            const SizedBox(height: 24),
            _buildDidYouKnowCard(context),
            const SizedBox(height: 24),
            Text('Categorías', style: TextStyles.getHeading3(context)),
            const SizedBox(height: 16),
            _buildCategoriesList(context),
            const SizedBox(height: 24),
            _buildMapPreview(context),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        // El estilo base viene del AppTheme, solo añadimos el icono
        hintText: 'Buscar en Tacna...',
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.getTextSecondary(context),
        ),
      ),
    );
  }

  Widget _buildHeroBanner(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const NetworkImage(
            'https://blog.redbus.pe/wp-content/uploads/2018/08/Tacna-Peru-3.jpg',
          ), // Imagen de placeholder
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Descubre la Heroica Ciudad',
          style: TextStyles.heading1.copyWith(color: AppColors.white),
        ),
      ),
    );
  }

  Widget _buildDidYouKnowCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: const NetworkImage(
            'https://peru.info/archivos/publicacion/178-imagen-930171942022.jpg',
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

  Widget _buildCategoriesList(BuildContext context) {
    final categories = {
      'Lugares Históricos':
          'https://www.infobae.com/resizer/v2/2LT5EG5WAJANFC7MPWTTORFCAM.jpg?auth=f86df2bfac62f1384d87a52541c8468f1b98e58bac69ab4ee350c7293adc2771&smart=true&width=1200&height=1200&quality=85',
      'Efemérides':
          'https://www.cronicaviva.com.pe/wp-content/uploads/2015/05/batalla-alianza-1.jpg',
      'Gastronomía':
          'https://portal.andina.pe/EDPfotografia3/Thumbnail/2023/09/13/000994052W.webp',
      'Personajes Ilustres':
          'https://www.tacnaperu.net/images/jorge-basadre-grohmann.jpg',
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
              if (title == 'Efemérides') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EventsPage()),
                );
              }
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
                  Text(title, style: TextStyles.getBodyLgMedium(context)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMapPreview(BuildContext context) {
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

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.getBackground(context),
        border: Border(
          top: BorderSide(color: AppColors.getSurface(context), width: 1.5),
        ),
      ),
      // Quitamos el 'const' porque ahora los hijos tienen funciones
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomNavItem(
            icon: Icons.home,
            isActive: true,
            onPressed:
                () {}, // El botón de Home no hace nada porque ya estamos ahí
          ),
          _BottomNavItem(
            icon: Icons.map_outlined,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapPage()),
              );
            },
          ),
          _BottomNavItem(
            icon: Icons.calendar_today_outlined,
            // AQUÍ VA LA LÓGICA DE NAVEGACIÓN
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EventsPage()),
              );
            },
          ),
          _BottomNavItem(
            icon: Icons.search,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Widget auxiliar para los items de la barra de navegación
class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onPressed; // <-- 1. AÑADE ESTA LÍNEA

  const _BottomNavItem({
    required this.icon,
    this.isActive = false,
    required this.onPressed, // <-- 2. AÑADE ESTO AL CONSTRUCTOR
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: isActive
            ? AppColors.getTextPrimary(context)
            : AppColors.getTextSecondary(context),
        size: 28,
      ),
      onPressed: onPressed,
    );
  }
}
