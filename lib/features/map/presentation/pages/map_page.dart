import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../historical_places/presentation/pages/place_detail_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  // Coordenadas iniciales centradas en Tacna
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-18.0146, -70.2536),
    zoom: 14.0,
  );

  // Lista de marcadores (puntos de interés)
  final Set<Marker> _markers = {};

  // Estado para el panel inferior
  Map<String, String>? _selectedPlace;

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  // Simula la carga de marcadores
  void _addMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('arco_parabolico'),
          position: const LatLng(-18.0148, -70.2530),
          infoWindow: const InfoWindow(
            title: 'Arco Parabólico',
            snippet: 'Monumento a los héroes',
          ),
          onTap: () {
            setState(() {
              _selectedPlace = {
                "title": "Arco Parabólico",
                "subtitle": "Monumento a los héroes de la Guerra del Pacífico",
                "imageUrl": "https://picsum.photos/seed/place1/200/200",
              };
            });
          },
        ),
      );
      _markers.add(
        Marker(
          markerId: const MarkerId('catedral'),
          position: const LatLng(-18.0140, -70.2520),
          infoWindow: const InfoWindow(
            title: 'Catedral de Tacna',
            snippet: 'Iglesia neorrenacentista',
          ),
          onTap: () {
            setState(() {
              _selectedPlace = {
                "title": "Catedral de Tacna",
                "subtitle":
                    "Iglesia histórica con arquitectura neorrenacentista",
                "imageUrl": "https://picsum.photos/seed/place3/200/200",
              };
            });
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Capa 1: El Mapa
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _markers,
            onTap: (argument) {
              // Oculta el panel si se toca cualquier parte del mapa
              setState(() {
                _selectedPlace = null;
              });
            },
          ),
          // Capa 2: UI superpuesta (barra de búsqueda, botones, etc.)
          _buildOverlayUI(),

          // Capa 3: Panel de información deslizable
          if (_selectedPlace != null) _buildInfoPanel(),
        ],
      ),
    );
  }

  Widget _buildOverlayUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barra de búsqueda (puedes hacerla funcional más adelante)
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Buscar en el mapa...',
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textSecondary,
                ),
                filled: true,
                fillColor: AppColors.background,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoPanel() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                _selectedPlace!['imageUrl']!,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _selectedPlace!['title']!,
                    style: TextStyles.bodyLgMedium,
                  ),
                  Text(
                    _selectedPlace!['subtitle']!,
                    style: TextStyles.bodySm,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 32,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PlaceDetailPage(place: _selectedPlace!),
                            ),
                          );
                        },
                        child: const Text('Ver detalles'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
