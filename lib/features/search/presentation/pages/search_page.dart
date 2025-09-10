import 'package:flutter/material.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/search_result_item.dart';
import '../../../historical_places/presentation/pages/places_list_page.dart';
import '../../../historical_places/presentation/pages/place_detail_page.dart';
import '../../../ilustrious_people/presentation/pages/ilustrious_people_list_page.dart';
import '../../../ilustrious_people/presentation/pages/person_detail_page.dart';
import '../../../gastronomy/presentation/pages/gastronomy_list_page.dart';
import '../../../gastronomy/presentation/pages/dish_detail_page.dart';

// Datos completos de toda la información de la app
const List<Map<String, dynamic>> _allData = [
  // Lugares Históricos
  {
    'title': 'Arco Parabólico',
    'category': 'Lugares Históricos',
    'icon': Icons.public,
    'type': 'place',
  },
  {
    'title': 'Museo Ferroviario Nacional',
    'category': 'Lugares Históricos',
    'icon': Icons.public,
    'type': 'place',
  },
  {
    'title': 'Catedral de Tacna',
    'category': 'Lugares Históricos',
    'icon': Icons.public,
    'type': 'place',
  },
  {
    'title': 'Paseo Civico',
    'category': 'Lugares Históricos',
    'icon': Icons.public,
    'type': 'place',
  },
  {
    'title': 'Campo de la Alianza',
    'category': 'Lugares Históricos',
    'icon': Icons.public,
    'type': 'place',
  },

  // Personajes Ilustres
  {
    'title': 'Francisco Antonio de Zela y Arizaga',
    'category': 'Personajes Ilustres',
    'icon': Icons.person,
    'type': 'person',
  },
  {
    'title': 'Jorge Basadre Grohmann',
    'category': 'Personajes Ilustres',
    'icon': Icons.person,
    'type': 'person',
  },
  {
    'title': 'Federico Barreto Bustíos',
    'category': 'Personajes Ilustres',
    'icon': Icons.person,
    'type': 'person',
  },
  {
    'title': 'Modesto Molina',
    'category': 'Personajes Ilustres',
    'icon': Icons.person,
    'type': 'person',
  },
  {
    'title': 'José Joaquín Inclán',
    'category': 'Personajes Ilustres',
    'icon': Icons.person,
    'type': 'person',
  },
  {
    'title': 'Gregorio Albarracín Lanchipa',
    'category': 'Personajes Ilustres',
    'icon': Icons.person,
    'type': 'person',
  },
  {
    'title': 'Lastenia Rejas de Castañón',
    'category': 'Personajes Ilustres',
    'icon': Icons.person,
    'type': 'person',
  },

  // Gastronomía
  {
    'title': 'Picante a la Tacneña',
    'category': 'Gastronomía',
    'icon': Icons.restaurant,
    'type': 'dish',
  },
  {
    'title': 'Adobo de Chancho a la Tacneña',
    'category': 'Gastronomía',
    'icon': Icons.restaurant,
    'type': 'dish',
  },
  {
    'title': 'Patasca a la Tacneña',
    'category': 'Gastronomía',
    'icon': Icons.restaurant,
    'type': 'dish',
  },
  {
    'title': 'Cordero Candaraveño a la Parrilla',
    'category': 'Gastronomía',
    'icon': Icons.restaurant,
    'type': 'dish',
  },
  {
    'title': 'Pastel de Choclo a la Tacneña',
    'category': 'Gastronomía',
    'icon': Icons.restaurant,
    'type': 'dish',
  },
  {
    'title': 'Cuy Chactado',
    'category': 'Gastronomía',
    'icon': Icons.restaurant,
    'type': 'dish',
  },
  {
    'title': 'Charquicán Tacneño',
    'category': 'Gastronomía',
    'icon': Icons.restaurant,
    'type': 'dish',
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

  // Datos de lugares históricos (copiados de places_list_page.dart)
  final List<Map<String, String>> _historicalPlaces = const [
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

  // Datos de personajes ilustres (copiados de ilustrious_people_list_page.dart)
  final List<Map<String, String>> _ilustriousPeople = const [
    {
      "name": "Francisco Antonio de Zela y Arizaga",
      "description":
          "Reconocido como el Primer Grito de Libertad del Perú. Lideró una insurrección en Tacna el 20 de junio de 1811, el primer levantamiento armado contra el dominio español en el país. Aunque la rebelión fue sofocada, su acto encendió la llama de la independencia y posicionó a Tacna como cuna de la emancipación peruana.",
      "imageUrl":
          "https://munilabaya.gob.pe/site/wp-content/uploads/2024/07/cropped-hst_9432.jpg",
    },
    {
      "name": "Jorge Basadre Grohmann",
      "description":
          "Considerado el \"Historiador de la República\". Fue un destacado historiador, educador y político cuya obra monumental, \"Historia de la República del Perú\", es una referencia obligatoria para entender el país. Su profundo análisis del periodo republicano y su amor por el Perú lo convierten en uno de los intelectuales peruanos más importantes del siglo XX.",
      "imageUrl":
          "https://www.limaeasy.com/media/reviews/photos/original/15/63/23/jorge-basadre-grohmann1-85-1614960957.jpg",
    },
    {
      "name": "Federico Barreto Bustíos",
      "description":
          "Conocido como el \"Poeta del Cautiverio\". Fue un célebre poeta y escritor que vivió durante el periodo de la ocupación chilena. A través de sus versos, llenos de profundo patriotismo y melancolía, mantuvo viva la identidad peruana y la esperanza del retorno de Tacna al seno de la patria. Su poema más famoso es \"Mi Patria y mi Bandera\".",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMTY7qwF0EPoGEDpEN8qI95NRhFURqaLUpXg&s",
    },
    {
      "name": "Modesto Molina",
      "description":
          "Fue un destacado poeta, periodista y político, considerado una de las voces más importantes de la resistencia tacneña durante la ocupación. Sus escritos y poemas, al igual que los de Barreto, fueron un pilar para sostener el espíritu patriótico de los tacneños durante los casi 50 años de cautiverio.",
      "imageUrl":
          "https://tiojuan.wordpress.com/wp-content/uploads/2020/05/modesto-molina023-2.jpg",
    },
    {
      "name": "José Joaquín Inclán",
      "description":
          "Fue un valiente militar tacneño, héroe de la Batalla de Arica. Como jefe de la 7ª División del ejército, defendió el Morro de Arica junto a Francisco Bolognesi, sacrificando su vida el 7 de junio de 1880. Es un símbolo del honor, el valor y el sacrificio por la patria.",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnZmaKzQHVoZo71elkTt04sj0MIuYToC-v0Q&s",
    },
    {
      "name": "Gregorio Albarracín Lanchipa",
      "description":
          "Apodado el \"Centauro de las Vilcas\", fue un intrépido coronel y héroe tacneño de la Guerra del Pacífico. Lideró escuadrones de caballería que mantuvieron en jaque al ejército invasor en la región, convirtiéndose en una leyenda por su valentía y pericia como jinete. Es el máximo exponente de la resistencia tacneña en la guerra.",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWQ4fjOzzTkT_g364-AXQZZWA0QEdbP2dnbQ&s",
    },
    {
      "name": "Lastenia Rejas de Castañón",
      "description":
          "Compositora y pianista, es la autora de la música de la polka \"Mi Tacna Hermosa\", considerada el segundo himno de la ciudad. Su melodía es un símbolo de identidad y amor por la tierra tacneña, entonada con fervor en cada aniversario de la Reincorporación.",
      "imageUrl":
          "https://ik.imagekit.io/smdxc0e2g3/userscontent2-endpoint/images/5b034986-6f9c-4e29-8fa0-e8965ac6301d/b998381f3e29d9c9fbf205521db96623.png?tr=w-200,rt-auto",
    },
  ];

  // Datos de gastronomía (copiados de gastronomy_list_page.dart)
  final List<Map<String, String>> _dishes = const [
    {
      "title": "Picante a la Tacneña",
      "subtitle": "Plato emblemático preparado con mondongo y aderezo de ají",
      "description":
          "Considerado el plato más representativo de la gastronomía tacneña, el Picante a la Tacneña es un guiso contundente que refleja la identidad culinaria de la región.",
      "information":
          "Este plato nació de la necesidad y la creatividad de los arrieros y campesinos, quienes utilizaban las partes menos nobles de la res. Con el tiempo, se convirtió en un símbolo de la identidad tacneña.",
      "ingredients":
          "Sus componentes principales son el mondongo (estómago de res) y la pata de res, cocidos lentamente hasta alcanzar una textura suave. El corazón de su sabor reside en un aderezo a base de ají panca y ají amarillo, que le otorga su característico color rojizo y un picor equilibrado. Se suele acompañar con papas deshidratadas (chuño) o frescas y arroz.",
      "preparation":
          "La cocción es un proceso largo que puede durar varias horas a fuego lento, tradicionalmente a leña, para que las carnes absorban todo el sabor del aderezo. El resultado es un guiso espeso y de sabor profundo.",
      "occasion":
          "Es un plato festivo, indispensable en celebraciones familiares, aniversarios y especialmente durante el mes de agosto, en el que se celebra la Reincorporación de Tacna al Perú. De hecho, cada tercer domingo de agosto se celebra el \"Día del Picante a la Tacneña\".",
      "imageUrl":
          "https://th.bing.com/th/id/OIP.IC6xTR8vuTw-PX5RdRNGhAHaEN?w=319&h=181&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
    },
    {
      "title": "Adobo de Chancho a la Tacneña",
      "subtitle":
          "Herencia de técnicas españolas adaptadas con insumos locales",
      "description":
          "Este plato es una herencia directa de las técnicas de conservación españolas, adaptadas con insumos locales para crear un sabor único y distintivo de la región.",
      "information":
          "El adobo es una técnica de marinado que permite ablandar y dar sabor a la carne. En Tacna, esta preparación adquiere una personalidad propia gracias al uso de ingredientes locales.",
      "ingredients":
          "Se utiliza carne de cerdo, preferiblemente panceta o costilla, que se macera durante horas, a veces desde la víspera, en una mezcla de vinagre, ají panca molido, ajo, comino y orégano.",
      "preparation":
          "Una vez macerada, la carne se cocina a fuego lento en una olla, a menudo de barro, hasta que esté tierna y el líquido del adobo haya espesado, formando una salsa agridulce y aromática. Se sirve tradicionalmente con pan marraqueta, ideal para absorber la jugosa salsa.",
      "occasion":
          "Es un desayuno dominical por excelencia en Tacna. Las familias suelen congregarse para disfrutar de este contundente y reconfortante plato para empezar el día.",
      "imageUrl":
          "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgYXG3GRSr1Q9gq7FTsNPw8j0S2GacB0n5v2snGJti8enXLtaHsKc_Ll1oWbch2gFXOltnaCzQg24hDSn4cyHYAIxfDkoWdjiI9pWk1zSp9Nb9HHm68ByKxrHWML1gyi2XD4kfIOV0X5HY/s1600/c14e27c0e2cacc5a59d6e6dbcb054655.jpg",
    },
    {
      "title": "Patasca a la Tacneña",
      "subtitle": "Sopa robusta y nutritiva ideal para combatir el frío andino",
      "description":
          "La patasca es una sopa robusta y nutritiva, ideal para combatir el frío de las zonas andinas de la región. Su nombre proviene del quechua \"phatasqa\", que significa reventado o partido, en alusión al maíz.",
      "information":
          "De origen prehispánico, esta sopa ha evolucionado incorporando ingredientes traídos por los españoles, como la carne de res y de cerdo.",
      "ingredients":
          "Su base es el mote (maíz pelado y cocido), acompañado de diversas carnes como cabeza de chancho, carne de res y cordero. Se enriquece con hierbas aromáticas como la hierbabuena, que le aporta un frescor característico.",
      "preparation":
          "La elaboración de la patasca es laboriosa. Las carnes y el mote se cocinan por separado durante varias horas hasta que estén muy suaves. Luego se integran en un solo caldo sustancioso, aderezado con ají y otras especias.",
      "occasion":
          "Se consume típicamente en celebraciones comunales, fiestas patronales y durante la temporada de invierno para reponer energías.",
      "imageUrl":
          "https://www.machupicchu.biz/imagenes/articulos/plato-tipico.jpg",
    },
    {
      "title": "Cordero Candaraveño a la Parrilla",
      "subtitle":
          "Cordero de calidad excepcional criado en pastizales de altura",
      "description":
          "La provincia de Candarave es famosa por la calidad de su cordero, criado en pastizales de altura que le confieren un sabor y una terneza excepcionales.",
      "information":
          "Este plato resalta la calidad del producto local, con una preparación sencilla que busca enaltecer el sabor natural de la carne.",
      "ingredients":
          "El protagonista absoluto es el cordero de Candarave. La sazón es simple, generalmente solo con sal, aunque a veces se le añade un ligero aderezo de hierbas locales.",
      "preparation":
          "La carne se cocina lentamente a las brasas de la parrilla, lo que le otorga un exterior dorado y crujiente y un interior jugoso y tierno. Se sirve con papas doradas, choclo y ensalada fresca.",
      "occasion":
          "Es un plato típico de los restaurantes campestres y picanterías de Tacna, ideal para disfrutar en un almuerzo de fin de semana en familia o con amigos.",
      "imageUrl":
          "https://consultasenlinea.mincetur.gob.pe/fichaInventario/foto.aspx?cod=469304",
    },
    {
      "title": "Pastel de Choclo a la Tacneña",
      "subtitle":
          "Postre dulce que resalta la importancia del maíz en la dieta andina",
      "description":
          "A diferencia de otras versiones que se encuentran en Perú y Latinoamérica, el pastel de choclo de Tacna se caracteriza por su sabor predominantemente dulce.",
      "information":
          "Este postre o acompañamiento es una muestra de la importancia del maíz (choclo) en la dieta andina, presentado aquí en una faceta dulce y delicada.",
      "ingredients":
          "Se elabora con choclos frescos y tiernos molidos, a los que se les añade leche, azúcar, anís en grano, canela y, en ocasiones, pasas.",
      "preparation":
          "La mezcla se vierte en un molde y se hornea lentamente hasta que cuaje y la superficie esté dorada. El resultado es una especie de budín húmedo y aromático.",
      "occasion":
          "Se puede disfrutar como postre, a media tarde acompañando un café o incluso como parte de un almuerzo especial.",
      "imageUrl":
          "https://cloudfront-us-east-1.images.arcpublishing.com/infobae/5HCR3EP3CVEOTIOGLAAXLTDBEI.jpg",
    },
    {
      "title": "Cuy Chactado",
      "subtitle": "Técnica ancestral de preparación del conejillo de indias",
      "description":
          "El cuy, un conejillo de indias domesticado, ha sido una fuente de alimento en los Andes desde tiempos preincaicos. El cuy chactado es una de las formas más populares y sabrosas de prepararlo.",
      "information":
          "La palabra \"chactado\" proviene del quechua y hace referencia a la técnica de aplastar la carne con una piedra mientras se fríe.",
      "ingredients":
          "Se utiliza un cuy entero, previamente aderezado con ajo, comino, sal y pimienta. A menudo se pasa por harina de maíz antes de freírlo para obtener una piel más crujiente.",
      "preparation":
          "El cuy se fríe en abundante aceite caliente, presionándolo con una piedra plana y pesada para asegurar una cocción uniforme y evitar que la carne se encoja. Esto da como resultado una piel crujiente y una carne tierna y sabrosa.",
      "occasion":
          "Considerado un manjar, se sirve en ocasiones especiales y festividades. Se acompaña tradicionalmente con papas sancochadas, ensalada de cebolla y ají.",
      "imageUrl":
          "https://jameaperu.com/assets/images/cuy-chactado_800x534.webp",
    },
    {
      "title": "Charquicán Tacneño",
      "subtitle": "Guiso ancestral con charqui (carne deshidratada)",
      "description":
          "Un guiso ancestral que tiene como ingrediente principal el charqui, una técnica de conservación de carne mediante el secado al sol con sal.",
      "information":
          "Este plato es un testimonio de las antiguas prácticas de los arrieros y viajeros que necesitaban alimentos duraderos para sus largas travesías por los Andes.",
      "ingredients":
          "El charqui (carne de res o cordero deshidratada) se hidrata y se deshilacha. Luego se cocina en un guiso con papas, zapallo, choclo y un aderezo de ají colorado, cebolla y ajo.",
      "preparation":
          "El charqui se remoja para quitarle el exceso de sal y rehidratarlo. Luego se cocina lentamente con las verduras hasta que todos los ingredientes estén tiernos y los sabores se hayan fusionado en un guiso espeso y reconfortante.",
      "occasion":
          "Es un plato casero, muy nutritivo y tradicional, que evoca los sabores de la sierra de Tacna. Se suele servir con arroz blanco.",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUpimpd-P1PIMLCs73CBm-8sZpo-ETZdz3tw&s",
    },
  ];

  // Función para navegar a la página de detalle según el tipo de item
  void _navigateToDetail(Map<String, dynamic> item) {
    final String type = item['type'];
    final String title = item['title'];

    switch (type) {
      case 'place':
        final place = _historicalPlaces.firstWhere(
          (p) => p['title'] == title,
          orElse: () => {'title': title, 'subtitle': '', 'imageUrl': ''},
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailPage(place: place),
          ),
        );
        break;
      case 'person':
        final person = _ilustriousPeople.firstWhere(
          (p) => p['name'] == title,
          orElse: () => {'name': title, 'description': '', 'imageUrl': ''},
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonDetailPage(person: person),
          ),
        );
        break;
      case 'dish':
        final dish = _dishes.firstWhere(
          (d) => d['title'] == title,
          orElse: () => {
            'title': title,
            'subtitle': '',
            'description': '',
            'imageUrl': '',
          },
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DishDetailPage(dish: dish)),
        );
        break;
    }
  }

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
      backgroundColor: AppColors.getBackground(context),
      appBar: AppBar(
        title: Text('Buscar', style: TextStyles.getHeading3(context)),
      ),
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
                      child: Text(
                        entry.key,
                        style: TextStyles.getHeading3(context),
                      ),
                    ),
                    ...entry.value.map((item) {
                      return SearchResultItem(
                        iconData: item['icon'],
                        title: item['title'],
                        onTap: () => _navigateToDetail(item),
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
