import 'package:flutter/material.dart';
import '../widgets/dish_list_item.dart';
import 'dish_detail_page.dart';

class GastronomyListPage extends StatelessWidget {
  const GastronomyListPage({super.key});

  // Datos de los platos típicos de Tacna basados en la información proporcionada
  final List<Map<String, String>> dishes = const [
    {
      "title": "Picante a la Tacneña",
      "subtitle": "Plato bandera de la región con mondongo y pata de res",
      "description":
          "Considerado el plato bandera de la región, el Picante a la Tacneña es una preparación contundente y sabrosa que tiene sus orígenes en las zonas altoandinas de Tarata y Candarave.",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gastronomía de Tacna')),
      body: ListView.builder(
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          final dish = dishes[index];
          return DishListItem(
            title: dish['title']!,
            subtitle: dish['subtitle']!,
            imageUrl: dish['imageUrl']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DishDetailPage(dish: dish),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
