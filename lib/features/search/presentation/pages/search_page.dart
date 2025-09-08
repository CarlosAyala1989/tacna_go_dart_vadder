import 'package:flutter/material.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/search_result_item.dart';

// Datos de ejemplo que simulan toda la información de la app
const List<Map<String, dynamic>> _allData = [
  {'title': 'Arco Parabólico', 'category': 'Lugares', 'icon': Icons.public},
  {
    'title': 'Museo Ferroviario Nacional',
    'category': 'Lugares',
    'icon': Icons.public,
  },
  {'title': 'Catedral de Tacna', 'category': 'Lugares', 'icon': Icons.public},
  {
    'title': 'Jorge Basadre Grohmann',
    'category': 'Personajes Ilustres',
    'icon': Icons.person,
  },
  {
    'title': 'Francisco Bolognesi',
    'category': 'Personajes Ilustres',
    'icon': Icons.person,
  },
];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  List<Map<String, dynamic>> _results = [];

  @override
  void initState() {
    super.initState();
    // Inicialmente mostramos todo o sugerencias [cite: 75]
    _results = _allData;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _results = _allData; // Muestra todo si la búsqueda está vacía
      });
    } else {
      setState(() {
        _results = _allData.where((item) {
          return item['title'].toLowerCase().contains(query);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Agrupamos los resultados por categoría
    final groupedResults = <String, List<Map<String, dynamic>>>{};
    for (var item in _results) {
      (groupedResults[item['category']] ??= []).add(item);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar en Tacna...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => _searchController.clear(),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: groupedResults.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(entry.key, style: TextStyles.heading3),
                    ),
                    ...entry.value.map((item) {
                      return SearchResultItem(
                        iconData: item['icon'],
                        title: item['title'],
                        onTap: () {
                          // TODO: Navegar a la página de detalle del item
                          print('Tocado: ${item['title']}');
                        },
                      );
                    }).toList(),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
