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
      name: 'Drama',
      description: 'Género cinematográfico centrado en representar situaciones emocionales y humanas.',
      topMovies: [
        'Cadena perpetua',
        'El club de la pelea',
        // Agrega más nombres de películas de drama
      ],
      featuredDirectors: [
        'Frank Darabont',
        'David Fincher',
        // Agrega más directores destacados de drama
      ],
    ),
    // Agrega más géneros según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Géneros'),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
              for (String movie in genre.topMovies)
                Text('- $movie'),
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