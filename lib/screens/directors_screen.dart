import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class Director {
  final String lastName;
  final String firstName;
  final String biography;
  final List<String> notableMovies;

  Director({
    required this.lastName,
    required this.firstName,
    required this.biography,
    required this.notableMovies,
  });
}

class DirectorsPage extends StatelessWidget {
  DirectorsPage({Key? key}) : super(key: key);

  final List<Director> directors = [
    Director(
      lastName: 'Darabont',
      firstName: 'Frank',
      biography:
          'Frank Darabont, nacido el 28 de enero de 1959 en Montbéliard, Francia, es un director y guionista estadounidense. Reconocido por su impactante obra "Cadena perpetua" (1994) y colaboraciones en películas como "El caballero de la noche" (2008). Su habilidad narrativa ha dejado una marca significativa en la industria cinematográfica.',
      notableMovies: [
        ('Cadena perpetua (1994): Un drama carcelario aclamado.'),
        ('El viento y el león (1975): Aventura histórica con Sean Connery.'),
        ('La niebla (2007): Adaptación de la obra de Stephen King.')
      ],
    ),
    Director(
      lastName: 'Nolan',
      firstName: 'Christopher',
      biography:
          'Christopher Nolan, destacado director y guionista británico, ha dejado una huella indeleble en el cine con obras maestras como "El origen" y "El caballero de la noche". Con su estilo visual distintivo y narrativas complejas, se ha ganado un lugar destacado en la industria cinematográfica contemporánea.',
      notableMovies: [
        ('El origen" (2010) - Un thriller de ciencia ficción que explora la realidad y los sueños.'),
        ('El caballero de la noche" (2008) - Un épico de superhéroes que redefinió el género.'),
        ('Interstellar" (2014) - Una odisea espacial que aborda la exploración del espacio y el tiempo.'),
      ],
    ),
    Director(
      lastName: 'Tarantino',
      firstName: 'Quentin',
      biography:
          'Quentin Tarantino, nacido el 27 de marzo de 1963 en Knoxville, Tennessee, es un influyente director y guionista estadounidense. Reconocido por su estilo distintivo, mezcla de violencia, diálogos ingeniosos y referencias cinematográficas. Ganador de múltiples premios, ha dejado una huella duradera en la industria del cine.',
      notableMovies: [
        ('Pulp Fiction (1994): Una obra maestra narrativa que entrelaza historias de criminales, con diálogos ingeniosos y escenas memorables.'),
        ('Kill Bill: Volumen 1 (2003): Una película de acción intensa sobre una novia vengativa interpretada por Uma Thurman.'),
        ('Django sin Cadenas (2012): Un western revisionista que aborda temas de esclavitud con la firma estilística de Tarantino.'),
      ],
    ),
    Director(
      lastName: 'Coppola',
      firstName: 'Francis Ford',
      biography:
          'Francis Ford Coppola, nacido el 7 de abril de 1939 en Detroit, es un renombrado cineasta estadounidense. Reconocido por su obra maestra "El Padrino", ha dejado una huella indeleble en el cine. Ganador de múltiples premios, Coppola ha sido una figura influyente en la historia del cine con su enfoque visionario y narrativa distintiva.',
      notableMovies: [
        ('El Padrino (1972): Épica saga mafiosa con una trama magistral y actuaciones icónicas.'),
        ('Apocalypse Now (1979): Es un viaje surrealista en la guerra de Vietnam, sin dudas una obra maestra cinematográfica con un gran impacto duradero.'),
        ('El Padrino: Parte II (1974): Completa la saga con una brillante narrativa dual, explorando el ascenso y caída del patriarca.'),
      ],
    ),
    Director(
      lastName: 'Spielberg',
      firstName: 'Steven',
      biography:
          'Steven Spielberg, nacido el 18 de diciembre de 1946 en Cincinnati, es un influyente cineasta estadounidense. Con una carrera prolífica y versátil, ha impactado significativamente en la industria cinematográfica a través de su habilidad creativa y visión única. Su legado incluye éxitos comerciales y películas aclamadas por la crítica.',
      notableMovies: [
        ('E.T. el Extraterrestre (1982): Conmovedora historia de amistad entre un niño y un extraterrestre, tocando el corazón de audiencias globales.'),
        ('Jurassic Park (1993): Maestro de la aventura, Spielberg revive dinosaurios con efectos revolucionarios, creando un clásico del cine de ciencia ficción.'),
        ('La lista de Schindler (1993): Poderoso retrato del Holocausto, destacando la humanidad en la oscuridad, ganadora de siete premios Oscar, incluido Mejor Director.'),
      ],
    ),
Director(
    lastName: 'Anderson',
    firstName: 'Paul Thomas',
    biography:
        'Paul Thomas Anderson, born on June 26, 1970, is an American filmmaker known for his unique storytelling and visually stunning films. With movies like "There Will Be Blood" and "Boogie Nights," Anderson has established himself as a masterful director in contemporary cinema.',
    notableMovies: [
      ('There Will Be Blood (2007): A gripping drama exploring the dark side of ambition and greed, featuring an outstanding performance by Daniel Day-Lewis.'),
      ('Boogie Nights (1997): An epic tale of the porn industry in the '70s and '80s, showcasing Anderson\'s storytelling prowess.'),
      ('Magnolia (1999): A mosaic of interconnected stories that delve into the complexities of human relationships.'),
    ],
  ),

  Director(
    lastName: 'Villeneuve',
    firstName: 'Denis',
    biography:
        'Denis Villeneuve, born on October 3, 1967, is a Canadian filmmaker known for his visually arresting and thought-provoking films. Notable for directing "Blade Runner 2049" and "Arrival," Villeneuve has made a significant impact on the science fiction genre.',
    notableMovies: [
      ('Blade Runner 2049 (2017): A visually stunning sequel to the iconic "Blade Runner," exploring themes of identity and humanity.'),
      ('Arrival (2016): A cerebral science fiction film that explores language, communication, and the nature of time.'),
      ('Prisoners (2013): A suspenseful thriller with a powerful ensemble cast, showcasing Villeneuve\'s directorial skill.'),
    ],
  ),

  Director(
    lastName: 'Coen',
    firstName: 'Joel and Ethan',
    biography:
        'Joel and Ethan Coen, born on November 29, 1954, and September 21, 1957, respectively, are American filmmakers known for their distinctive style and dark humor. With a collaborative career spanning several decades, the Coen brothers have created a diverse range of films.',
    notableMovies: [
      ('Fargo (1996): A darkly comedic crime film that earned the Coen brothers an Academy Award for Best Original Screenplay.'),
      ('No Country for Old Men (2007): A gripping thriller adapted from Cormac McCarthy\'s novel, winning four Academy Awards, including Best Picture.'),
      ('The Big Lebowski (1998): A cult classic comedy that has achieved iconic status for its memorable characters and dialogue.'),
    ],
  ),
  Director(
    lastName: 'Wong',
    firstName: 'Kar-Wai',
    biography:
        'Wong Kar-Wai, born on July 17, 1958, is a Hong Kong filmmaker known for his visually stylish and emotionally resonant films. With a unique approach to storytelling and cinematography, Wong has gained international acclaim for his work.',
    notableMovies: [
      ('In the Mood for Love (2000): A visually stunning and emotionally powerful exploration of unrequited love in 1960s Hong Kong.'),
      ('Chungking Express (1994): An innovative and stylistically bold film that captures the essence of urban life in Hong Kong.'),
      ('2046 (2004): A visually rich and complex film that serves as a loose sequel to "In the Mood for Love."'),
    ],
  ),

  Director(
    lastName: 'Cuaron',
    firstName: 'Alfonso',
    biography:
        'Alfonso Cuarón, born on November 28, 1961, is a Mexican filmmaker known for his innovative storytelling and technical prowess. Notable for directing "Gravity" and "Roma," Cuarón has received critical acclaim and multiple awards for his work.',
    notableMovies: [
      ('Gravity (2013): A visually stunning and tense space thriller that earned Cuarón the Academy Award for Best Director.'),
      ('Roma (2018): A heartfelt and visually striking film that pays tribute to Cuarón\'s upbringing in Mexico City.'),
      ('Children of Men (2006): A dystopian science fiction film known for its gripping storytelling and long-take sequences.'),
    ],
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Directores'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      drawer: DrawerMenu(),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: directors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(directors[index].lastName),
            subtitle: Text(directors[index].firstName),
            onTap: () {
              _showDirectorDetails(context, directors[index]);
            },
          );
        },
      ),
    );
  }

  void _showDirectorDetails(BuildContext context, Director director) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${director.firstName} ${director.lastName}'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Biografía: ${director.biography}'),
              const SizedBox(height: 8),
              Text('Películas destacadas como director:'),
              for (String movie in director.notableMovies) Text('- $movie'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
