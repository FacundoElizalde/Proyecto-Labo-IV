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
    required String releaseDate,
    required String synopsis,
    required String imageUrl,
  });
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Movie> movies = [
    Movie(
      title: 'Inception',
      director: 'Christopher Nolan',
      year: 2010,
      releaseDate: 'July 16, 2010',
      synopsis:
          'A thief who enters the dreams of others to steal their secrets.',
      imageUrl:
          'https://mario.nintendo.com/static/f350c31adcd6378b913f7660db299714/7e15c/mario.png',
    ),
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
