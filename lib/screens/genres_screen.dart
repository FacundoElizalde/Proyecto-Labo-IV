import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class GenreScreen extends StatelessWidget {
  GenreScreen({Key? key}) : super(key: key);

  final Map<String, dynamic> moviesData = {
    "nombre_peliculas": [
      "The Lion King",
      "Toy Story",
      "Finding Nemo",
      "Shrek",
      "Frozen",
      "Moana",
      "The Incredibles",
      "Zootopia",
      "Coco",
      "Up"
    ],
    "generos_lista": [
      "Adventure, Action, Drama",
      "Comedy, Animation, Comedy",
      "Adventure, Action, Drama",
      "Adventure, Action, Drama",
      "Adventure, Action, Drama",
      "Adventure, Action, Drama",
      "Adventure, Action, Drama",
      "Adventure, Action, Drama",
      "Adventure, Action, Drama",
      "Adventure, Action, Drama"
    ]
  };

  final List<String> genres = [
    'Acción',
    'Comedia',
    'Drama',
    'Aventura',
    'Animación'
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
          final genreName = genres[index];
          return ListTile(
            title: Text(genreName),
            onTap: () {
              _showGenreDetails(context, genreName);
            },
          );
        },
      ),
    );
  }

  void _showGenreDetails(BuildContext context, String genreName) {
    // Mapeo de géneros en inglés a español
    Map<String, String> genreTranslations = {
      'Aventura': 'Adventure',
      'Acción': 'Action',
      'Comedia': 'Comedy',
      'Drama': 'Drama',
      'Animación': 'Animation',
    };

    List<String> moviesForGenre = [];
    for (int i = 0; i < moviesData['generos_lista'].length; i++) {
      String genresString = moviesData['generos_lista'][i];

      // Traducir el género de inglés a español
      String translatedGenre = genreTranslations[genreName] ?? genreName;

      if (genresString.contains(translatedGenre)) {
        moviesForGenre.add(moviesData['nombre_peliculas'][i]);
      }
    }

    // Mostrar el diálogo con las películas para el género seleccionado
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(genreName),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Películas para el género $genreName:'),
              for (String movie in moviesForGenre) Text('- $movie'),
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
