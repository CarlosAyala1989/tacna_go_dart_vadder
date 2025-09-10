import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class PlaceDetailPage extends StatelessWidget {
  // Recibimos los datos del lugar para mostrarlos
  // En el futuro, esto sería un objeto 'PlaceEntity' del dominio
  final Map<String, String> place;

  const PlaceDetailPage({super.key, required this.place});

  // Función para obtener la descripción específica de cada lugar
  String _getPlaceDescription(String title) {
    switch (title) {
      case 'Arco Parabólico':
        return 'El Arco Parabólico es uno de los monumentos más emblemáticos de Tacna, construido entre 1957 y 1959 para conmemorar a los héroes de la Guerra del Pacífico. Su diseño arquitectónico único en forma de parábola se eleva 18 metros de altura y está hecho de piedra de cantería rosa. En su parte superior se encuentra la escultura de la Victoria alada, obra del escultor español Victorio Macho. Este monumento no solo es un símbolo de la resistencia tacneña, sino también un punto de encuentro y referencia urbana que marca el ingreso al centro histórico de la ciudad. Durante las celebraciones patrias, especialmente en el aniversario de la Reincorporación de Tacna al Perú, el Arco se convierte en el epicentro de las festividades cívicas y patrióticas.';

      case 'Museo Ferroviario Nacional':
        return 'El Museo Ferroviario Nacional de Tacna preserva la rica historia ferroviaria de la región, siendo testigo del importante papel que jugó el ferrocarril en el desarrollo económico y social de Tacna. Ubicado en la antigua estación del ferrocarril Tacna-Arica, el museo alberga una valiosa colección de locomotoras históricas, vagones de época, fotografías, documentos y objetos relacionados con la era dorada del transporte ferroviario. Entre sus piezas más destacadas se encuentra la locomotora a vapor N°3, que funcionó en el tramo Tacna-Arica durante las primeras décadas del siglo XX. El museo también cuenta la historia de cómo el ferrocarril conectó a Tacna con el puerto de Arica, facilitando el comercio y la comunicación en una época crucial para el desarrollo regional.';

      case 'Catedral de Tacna':
        return 'La Catedral de Tacna, oficialmente conocida como Catedral de San Ramón, es el principal templo católico de la ciudad y una obra maestra de la arquitectura neorrenacentista. Construida entre 1875 y 1954, fue diseñada por el arquitecto francés Alejandro Bertrand y destaca por su imponente fachada de piedra rosa extraída de las canteras de Puno. Sus torres gemelas se elevan majestuosamente sobre el paisaje urbano, convirtiéndose en un hito arquitectónico visible desde diversos puntos de la ciudad. En su interior, la catedral alberga hermosas obras de arte religioso, vitrales policromados y un magnífico altar mayor. Durante el período de la ocupación chilena (1880-1929), la catedral sirvió como símbolo de resistencia y mantuvo viva la fe y la identidad peruana de los tacneños.';

      case 'Paseo Civico':
        return 'El Paseo Cívico es el corazón del centro histórico de Tacna, un elegante bulevar peatonal que conecta los principales monumentos y edificios públicos de la ciudad. Inaugurado en 1954, este hermoso paseo está flanqueado por palmeras y jardines cuidadosamente mantenidos, creando un ambiente de tranquilidad en medio del bullicio urbano. A lo largo del paseo se encuentran importantes edificios como la Prefectura, la Casa de la Cultura, el Teatro Municipal y diversos monumentos que rinden homenaje a los héroes tacneños. El Paseo Cívico es también el escenario de importantes eventos culturales, desfiles patrios y manifestaciones cívicas, especialmente durante las celebraciones del 28 de agosto, aniversario de la Reincorporación de Tacna al Perú.';

      case 'Campo de la Alianza':
        return 'El Campo de la Alianza es un sitio histórico de gran importancia nacional, lugar donde se libró la Batalla del Alto de la Alianza el 26 de mayo de 1880, durante la Guerra del Pacífico. En este campo de batalla, las fuerzas peruano-bolivianas, comandadas por el general Narciso Campero, enfrentaron al ejército chileno en uno de los combates más significativos de la guerra. Aunque la batalla resultó en una derrota para las fuerzas aliadas, el valor y heroísmo demostrado por los soldados peruanos y bolivianos quedó grabado en la historia. Hoy en día, el sitio cuenta con un monumento conmemorativo y se ha convertido en un lugar de peregrinaje patriótico. El Campo de la Alianza también alberga el Santuario de la Tirana, donde cada año se realizan importantes festividades religiosas que combinan tradiciones católicas con elementos de la cultura andina.';

      default:
        return 'Este es un lugar histórico importante de Tacna que forma parte del rico patrimonio cultural de la ciudad. Cada rincón de Tacna cuenta una historia de resistencia, cultura y tradición que ha forjado la identidad de la Ciudad Heroica.';
    }
  }

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
                    _getPlaceDescription(place['title']!),
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
