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
      biography: 'Frank Darabont, nacido el 28 de enero de 1959 en Montbéliard, Francia, es un director y guionista estadounidense. Reconocido por su impactante obra "Cadena perpetua" (1994) y colaboraciones en películas como "El caballero de la noche" (2008). Su habilidad narrativa ha dejado una marca significativa en la industria cinematográfica.',
      notableMovies: [('Cadena perpetua (1994): Un drama carcelario aclamado.'),
                      ('El viento y el león (1975): Aventura histórica con Sean Connery.'),
                      ('La niebla (2007): Adaptación de la obra de Stephen King.')],
    ),
    Director(
    lastName: 'Nolan',
    firstName: 'Christopher',
    biography: 'Christopher Nolan, destacado director y guionista británico, ha dejado una huella indeleble en el cine con obras maestras como "El origen" y "El caballero de la noche". Con su estilo visual distintivo y narrativas complejas, se ha ganado un lugar destacado en la industria cinematográfica contemporánea.',
    notableMovies: [('El origen" (2010) - Un thriller de ciencia ficción que explora la realidad y los sueños.'),
                    ('El caballero de la noche" (2008) - Un épico de superhéroes que redefinió el género.'),
                    ('Interstellar" (2014) - Una odisea espacial que aborda la exploración del espacio y el tiempo.'),],
    ),
    Director(
      lastName: 'Tarantino',
      firstName: 'Quentin',
      biography: 'Quentin Tarantino, nacido el 27 de marzo de 1963 en Knoxville, Tennessee, es un influyente director y guionista estadounidense. Reconocido por su estilo distintivo, mezcla de violencia, diálogos ingeniosos y referencias cinematográficas. Ganador de múltiples premios, ha dejado una huella duradera en la industria del cine.',
      notableMovies: [('Pulp Fiction (1994): Una obra maestra narrativa que entrelaza historias de criminales, con diálogos ingeniosos y escenas memorables.'),
                      ('Kill Bill: Volumen 1 (2003): Una película de acción intensa sobre una novia vengativa interpretada por Uma Thurman.'),
                      ('Django sin Cadenas (2012): Un western revisionista que aborda temas de esclavitud con la firma estilística de Tarantino.'),],
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Directores'),
        centerTitle: true,
        backgroundColor: Colors.green,
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
              for (String movie in director.notableMovies)
                Text('- $movie'),
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