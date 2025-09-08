import 'package:flutter/material.dart';
import '../widgets/place_list_item.dart'; // Importamos el widget que acabamos de crear

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({super.key});

  // En un futuro, estos datos vendrán de un BLoC
  final List<Map<String, String>> historicalPlaces = const [
    {
      "title": "Arco Parabólico",
      "subtitle": "Monumento a los héroes de la Guerra del Pacífico",
      "imageUrl": "https://picsum.photos/seed/place1/200/200",
    },
    {
      "title": "Museo Ferroviario Nacional",
      "subtitle": "Museo que exhibe la historia de Tacna",
      "imageUrl": "https://picsum.photos/seed/place2/200/200",
    },
    {
      "title": "Catedral de Tacna",
      "subtitle": "Iglesia histórica con arquitectura neorrenacentista",
      "imageUrl": "https://picsum.photos/seed/place3/200/200",
    },
    {
      "title": "Plaza de Armas",
      "subtitle": "Plaza principal con monumentos y áreas verdes",
      "imageUrl": "https://picsum.photos/seed/place4/200/200",
    },
    {
      "title": "Campo de la Alianza",
      "subtitle": "Sitio histórico de la batalla de Alto de la Alianza",
      "imageUrl": "https://picsum.photos/seed/place5/200/200",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares Históricos'),
        // El back button aparece automáticamente al usar Navigator.push
      ),
      body: ListView.builder(
        itemCount: historicalPlaces.length,
        itemBuilder: (context, index) {
          final place = historicalPlaces[index];
          return PlaceListItem(
            title: place['title']!,
            subtitle: place['subtitle']!,
            imageUrl: place['imageUrl']!,
            onTap: () {
              // TODO: Navegar a la pantalla de detalle de este lugar
              print('Tocado: ${place['title']}');
            },
          );
        },
      ),
    );
  }
}
