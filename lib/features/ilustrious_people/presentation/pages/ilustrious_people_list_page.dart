import 'package:flutter/material.dart';
import '../widgets/person_list_item.dart';
import 'person_detail_page.dart';

class IlustriousPeopleListPage extends StatelessWidget {
  const IlustriousPeopleListPage({super.key});

  // Datos de los personajes ilustres de Tacna
  final List<Map<String, String>> ilustriousPeople = const [
    {
      "name": "Francisco Antonio de Zela y Arizaga",
      "description":
          "Reconocido como el Primer Grito de Libertad del Perú. Lideró una insurrección en Tacna el 20 de junio de 1811, el primer levantamiento armado contra el dominio español en el país. Aunque la rebelión fue sofocada, su acto encendió la llama de la independencia y posicionó a Tacna como cuna de la emancipación peruana.",
      "imageUrl":
          "https://munilabaya.gob.pe/site/wp-content/uploads/2024/07/cropped-hst_9432.jpg", // TODO: Agregar URL de imagen
    },
    {
      "name": "Jorge Basadre Grohmann",
      "description":
          "Considerado el \"Historiador de la República\". Fue un destacado historiador, educador y político cuya obra monumental, \"Historia de la República del Perú\", es una referencia obligatoria para entender el país. Su profundo análisis del periodo republicano y su amor por el Perú lo convierten en uno de los intelectuales peruanos más importantes del siglo XX.",
      "imageUrl":
          "https://www.limaeasy.com/media/reviews/photos/original/15/63/23/jorge-basadre-grohmann1-85-1614960957.jpg", // TODO: Agregar URL de imagen
    },
    {
      "name": "Federico Barreto Bustíos",
      "description":
          "Conocido como el \"Poeta del Cautiverio\". Fue un célebre poeta y escritor que vivió durante el periodo de la ocupación chilena. A través de sus versos, llenos de profundo patriotismo y melancolía, mantuvo viva la identidad peruana y la esperanza del retorno de Tacna al seno de la patria. Su poema más famoso es \"Mi Patria y mi Bandera\".",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMTY7qwF0EPoGEDpEN8qI95NRhFURqaLUpXg&s", // TODO: Agregar URL de imagen
    },
    {
      "name": "Modesto Molina",
      "description":
          "Fue un destacado poeta, periodista y político, considerado una de las voces más importantes de la resistencia tacneña durante la ocupación. Sus escritos y poemas, al igual que los de Barreto, fueron un pilar para sostener el espíritu patriótico de los tacneños durante los casi 50 años de cautiverio.",
      "imageUrl":
          "https://tiojuan.wordpress.com/wp-content/uploads/2020/05/modesto-molina023-2.jpg", // TODO: Agregar URL de imagen
    },
    {
      "name": "José Joaquín Inclán",
      "description":
          "Fue un valiente militar tacneño, héroe de la Batalla de Arica. Como jefe de la 7ª División del ejército, defendió el Morro de Arica junto a Francisco Bolognesi, sacrificando su vida el 7 de junio de 1880. Es un símbolo del honor, el valor y el sacrificio por la patria.",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnZmaKzQHVoZo71elkTt04sj0MIuYToC-v0Q&s", // TODO: Agregar URL de imagen
    },
    {
      "name": "Gregorio Albarracín Lanchipa",
      "description":
          "Apodado el \"Centauro de las Vilcas\", fue un intrépido coronel y héroe tacneño de la Guerra del Pacífico. Lideró escuadrones de caballería que mantuvieron en jaque al ejército invasor en la región, convirtiéndose en una leyenda por su valentía y pericia como jinete. Es el máximo exponente de la resistencia tacneña en la guerra.",
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWQ4fjOzzTkT_g364-AXQZZWA0QEdbP2dnbQ&s", // TODO: Agregar URL de imagen
    },
    {
      "name": "Lastenia Rejas de Castañón",
      "description":
          "Compositora y pianista, es la autora de la música de la polka \"Mi Tacna Hermosa\", considerada el segundo himno de la ciudad. Su melodía es un símbolo de identidad y amor por la tierra tacneña, entonada con fervor en cada aniversario de la Reincorporación.",
      "imageUrl":
          "https://ik.imagekit.io/smdxc0e2g3/userscontent2-endpoint/images/5b034986-6f9c-4e29-8fa0-e8965ac6301d/b998381f3e29d9c9fbf205521db96623.png?tr=w-200,rt-auto", // TODO: Agregar URL de imagen
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personajes Ilustres')),
      body: ListView.builder(
        itemCount: ilustriousPeople.length,
        itemBuilder: (context, index) {
          final person = ilustriousPeople[index];
          return PersonListItem(
            name: person['name']!,
            description: person['description']!,
            imageUrl: person['imageUrl']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonDetailPage(person: person),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
