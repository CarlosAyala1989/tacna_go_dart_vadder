import 'package:flutter/material.dart';
import '../widgets/place_list_item.dart'; // Importamos el widget que acabamos de crear
import 'place_detail_page.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({super.key});

  // En un futuro, estos datos vendrán de un BLoC
  final List<Map<String, String>> historicalPlaces = const [
    {
      "title": "Arco Parabólico",
      "subtitle": "Monumento a los héroes de la Guerra del Pacífico",
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/d/d6/5TR7A64LSBHVLI2RHAUGT2ZNI4.jpg",
    },
    {
      "title": "Museo Ferroviario Nacional",
      "subtitle": "Museo que exhibe la historia de Tacna",
      "imageUrl": "https://peru.viajandox.com/uploads/attractive_381.jpg",
    },
    {
      "title": "Catedral de Tacna",
      "subtitle": "Iglesia histórica con arquitectura neorrenacentista",
      "imageUrl":
          "https://images.mnstatic.com/6b/38/6b38bdbddcf7add2457b15413113b54a.jpg",
    },
    {
      "title": "Paseo Civico",
      "subtitle": "Plaza principal con monumentos y áreas verdes",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_3rGYj00IjLnYZl_i6hzUznb0ect9sWpzSw&s",
    },
    {
      "title": "Campo de la Alianza",
      "subtitle": "Sitio histórico de la batalla de Alto de la Alianza",
      "imageUrl":
          "https://www.ytuqueplanes.com/imagenes/fotos/festividades/Aniversario-de-la-Batalla-del-Campo-de-la-Alianza-400x400.jpg",
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlaceDetailPage(place: place),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
