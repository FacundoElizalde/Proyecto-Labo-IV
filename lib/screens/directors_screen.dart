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
          'Paul Thomas Anderson, nacido el 26 de junio de 1970, es un cineasta estadounidense conocido por su narrativa única y películas visualmente impactantes. Con filmes como "There Will Be Blood" y "Boogie Nights", Anderson se ha establecido como un director magistral en el cine contemporáneo.',
      notableMovies: [
        ('There Will Be Blood (2007): Un épico drama sobre la avaricia y la obsesión durante la fiebre del petróleo en California.'),
        ('Boogie Nights (1997): Una exploración del mundo del cine para adultos en los años 70 y 80.'),
        ('Magnolia (1999): Una narrativa interconectada que aborda temas de conexión humana, destino y redención.'),
      ],
    ),
    Director(
      lastName: 'Villeneuve',
      firstName: 'Denis',
      biography:
          'Denis Villeneuve, nacido el 3 de octubre de 1967, es un cineasta canadiense reconocido por sus películas visualmente impactantes y reflexivas. Destacado por dirigir "Blade Runner 2049" y "Arrival", Villeneuve ha dejado una huella significativa en el género de ciencia ficción.',
      notableMovies: [
        ('Blade Runner 2049 (2017): Una secuela visualmente impactante del icónico "Blade Runner", que explora temas de identidad y humanidad.'),
        ('Arrival (2016): Una película de ciencia ficción cerebral que explora el lenguaje, la comunicación y la naturaleza del tiempo.'),
        ('Prisoners (2013): Un thriller lleno de suspense con un poderoso elenco, que destaca la habilidad directiva de Villeneuve.'),
      ],
    ),
    Director(
      lastName: 'Coen',
      firstName: 'Joel y Ethan',
      biography:
          'Joel y Ethan Coen, nacidos el 29 de noviembre de 1954 y el 21 de septiembre de 1957, respectivamente, son cineastas estadounidenses conocidos por su estilo distintivo y humor oscuro. Con una carrera colaborativa que abarca varias décadas, los hermanos Coen han creado una amplia gama de películas.',
      notableMovies: [
        ('Fargo (1996): Una película de crimen oscura y cómica que valió a los hermanos Coen un Premio de la Academia al Mejor Guión Original.'),
        ('No Country for Old Men (2007): Un thriller impactante adaptado de la novela de Cormac McCarthy, ganador de cuatro premios de la Academia, incluyendo Mejor Película.'),
        ('The Big Lebowski (1998): Una comedia de culto que ha alcanzado estatus icónico por sus personajes y diálogos memorables..'),
      ],
    ),
    Director(
      lastName: 'Wong',
      firstName: 'Kar-Wai',
      biography:
          'Wong Kar-Wai, nacido el 17 de julio de 1958, es un cineasta de Hong Kong conocido por sus películas visualmente elegantes y emocionalmente resonantes. Con un enfoque único para contar historias y cinematografía, Wong ha ganado reconocimiento internacional por su trabajo.',
      notableMovies: [
        ('In the Mood for Love (2000): Una exploración visualmente impactante y emocionalmente poderosa del amor no correspondido en el Hong Kong de la década de 1960.'),
        ('Chungking Express (1994): Una película innovadora y audaz desde el punto de vista estilístico que captura la esencia de la vida urbana en Hong Kong.'),
        ('2046 (2004): Una película visualmente rica y compleja que sirve como una secuela no oficial de "In the Mood for Love".'),
      ],
    ),
    Director(
      lastName: 'Cuarón',
      firstName: 'Alfonso',
      biography:
          'Alfonso Cuarón, nacido el 28 de noviembre de 1961, es un cineasta mexicano conocido por su narrativa innovadora y destreza técnica. Notable por dirigir "Gravity" y "Roma", Cuarón ha recibido aclamación crítica y múltiples premios por su trabajo.',
      notableMovies: [
        ('Gravity (2013): Un thriller espacial visualmente impactante y tenso que le valió a Cuarón el Premio de la Academia al Mejor Director.'),
        ('Roma (2018): Una película conmovedora y visualmente impactante que rinde homenaje a la infancia de Cuarón en la Ciudad de México.'),
        ('Children of Men (2006): Una película de ciencia ficción distópica conocida por su narrativa envolvente y secuencias de tomas largas.'),
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
