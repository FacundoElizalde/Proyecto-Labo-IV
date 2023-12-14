import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class Movie {
  final String title;
  final String director;
  final int year;

  Movie({
    required this.title,
    required this.director,
    required this.year,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final List<Movie> movies = [
    Movie(
  title: 'Inception',
  director: 'Christopher Nolan',
  year: 2010,
  releaseDate: 'July 16, 2010',
  synopsis: 'A thief who enters the dreams of others to steal their secrets.',
  imageUrl: 'https://mario.nintendo.com/static/f350c31adcd6378b913f7660db299714/7e15c/mario.png', // Asegúrate de que esta URL sea válida
),

    // ... Agrega más películas según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movies[index].title),
            subtitle: Text('${movies[index].director} (${movies[index].year})'),
            onTap: () {
              // Implementa la lógica cuando se selecciona una película
              // Puedes navegar a una pantalla de detalles, por ejemplo
              _showMovieDetails(context, movies[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Hiciste clic en el botón');
        },
        child: const Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _showMovieDetails(BuildContext context, Movie movie) {
    // Implementa la lógica para mostrar los detalles de la película
    // Puedes abrir una nueva pantalla o mostrar un cuadro de diálogo, por ejemplo
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(movie.title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Director: ${movie.director}'),
              Text('Year: ${movie.year}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}