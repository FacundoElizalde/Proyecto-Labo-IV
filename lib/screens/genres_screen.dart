import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class Genre {
  final String name;
  final String description;
  final List<String> topMovies; // Cambiado a lista de nombres de películas
  final List<String> featuredDirectors;

  Genre({
    required this.name,
    required this.description,
    required this.topMovies,
    required this.featuredDirectors,
  });
}

class GenreScreen extends StatelessWidget {
  GenreScreen({Key? key}) : super(key: key);

  final List<Genre> genres = [
    Genre(
      name: 'Accion',
      description:
          'Género cinematográfico emocionante, explosivo y lleno de adrenalina, despliega intensas secuencias de combate y persecución.',
      topMovies: [
        'Duro de Matar',
        'Mad Max: Furia en el Camino',
      ],
      featuredDirectors: [
        'John Woo',
        'Michael Bay',
      ],
    ),
    Genre(
      name: 'Aventura',
      description:
          'Género cinematográfico de emocionante búsqueda con desafíos, descubrimientos y experiencias audaces y entretenidas.',
      topMovies: [
        'Indiana Jones: Raiders of the Lost Ark',
        'El Señor de los anillos: La comunidad del anillo',
      ],
      featuredDirectors: [
        'Steven Spielberg',
        'Gore Verbinski',
      ],
    ),
    Genre(
      name: 'Ciencia Ficción',
      description:
          'Género cinematográfico que explora futuros alternativos, tecnologías avanzadas, y dilemas éticos imaginarios en mundos distópicos.',
      topMovies: [
        '2001: Una odisea del espacio',
        'Matrix',
      ],
      featuredDirectors: [
        'Stanley Kubrick',
        'Christopher Nolan',
      ],
    ),
    Genre(
      name: 'Comedia',
      description:
          'Género cinematográfico humorístico que busca entretener y hacer reír al público.',
      topMovies: [
        'Annie Hall',
        'Groundhog Day',
      ],
      featuredDirectors: [
        'Woody Allen',
        'Charles Chaplin',
      ],
    ),
    Genre(
      name: 'Drama',
      description:
          'Género cinematográfico centrado en representar situaciones emocionales y humanas.',
      topMovies: [
        'Cadena perpetua',
        'El club de la pelea',
      ],
      featuredDirectors: [
        'Frank Darabont',
        'David Fincher',
      ],
    ),
    Genre(
      name: 'Documentales',
      description:
          'Género cinematográfico que da registro real de eventos o personas con propósitos informativos o educativos.',
      topMovies: [
        'Bowling for Columbine',
        'March of the Penguins',
      ],
      featuredDirectors: [
        'Michael Moore',
        'Luc Jacquet',
      ],
    ),
    Genre(
      name: 'Fantasia',
      description:
          'Género cinematográfico que plantea mundos imaginarios con elementos mágicos, criaturas y aventuras extraordinarias.',
      topMovies: [
        'Harry Potter y la piedra filosofal',
        'El Mago de Oz',
      ],
      featuredDirectors: [
        'Peter Jackson',
        'Hayao Miyazaki',
      ],
    ),
    Genre(
      name: 'Musicales',
      description:
          'Género cinematográfico que involucra narrativas que incorporan canciones y coreografías como medio de expresión.',
      topMovies: [
        'La La Land',
        'The Sound of Music',
      ],
      featuredDirectors: [
        'Robert Wise',
        'Damien Chazelle',
      ],
    ),
    Genre(
      name: 'Suspenso',
      description:
          'Género cinematográfico que genera tensión, anticipación y giros sorprendentes en narrativas intrigantes.',
      topMovies: [
        'Psicosis',
        'El silencio de los corderos',
      ],
      featuredDirectors: [
        'Alfred Hitchcock',
        'David Fincher',
      ],
    ),
    Genre(
      name: 'Terror',
      description:
          'Género cinematográfico perturbador que provoca miedo intenso y ansiedad.',
      topMovies: [
        'El Exorcista',
        'Scream',
      ],
      featuredDirectors: [
        'William Friedkin',
        'James Wan',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Géneros'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      drawer: DrawerMenu(),
      body: ListView.builder(
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(genres[index].name),
            subtitle: Text(genres[index].description),
            onTap: () {
              _showGenreDetails(context, genres[index]);
            },
          );
        },
      ),
    );
  }

  void _showGenreDetails(BuildContext context, Genre genre) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(genre.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Descripción: ${genre.description}'),
              const SizedBox(height: 8),
              Text('Mejores películas:'),
              for (String movie in genre.topMovies) Text('- $movie'),
              const SizedBox(height: 8),
              Text('Directores destacados:'),
              for (String director in genre.featuredDirectors)
                Text('- $director'),
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
