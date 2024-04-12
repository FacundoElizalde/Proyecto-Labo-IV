import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class DirectorsPage extends StatelessWidget {
  DirectorsPage({Key? key}) : super(key: key);

  final Map<String, dynamic> moviesData = {
    "nombre_peliculas": [
      "Sky",
      "Inception",
      "Pulp Fiction",
      "The Shawshank Redemption",
      "The Godfather",
      "Interstellar",
      "The Dark Knight",
      "Titanic",
      "Avatar",
      "Jurassic Park"
    ],
    "directores_lista": [
      "Fabienne Berthaud",
      "Christopher Nolan",
      "Quentin Tarantino",
      "Frank Darabont",
      "Francis Ford Coppola",
      "Christopher Nolan",
      "Christopher Nolan",
      "James Cameron",
      "James Cameron",
      "Steven Spielberg"
    ]
  };

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
        itemCount: moviesData['nombre_peliculas'].length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(moviesData['nombre_peliculas'][index]),
            onTap: () {
              _showDirectorDetails(
                  context, index); // Pasar el índice como un entero
            },
          );
        },
      ),
    );
  }

  void _showDirectorDetails(BuildContext context, int index) {
    String movieTitle = moviesData['nombre_peliculas'][index];
    String directorName = moviesData['directores_lista'][index];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(movieTitle),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Director/es: $directorName'),
              const SizedBox(height: 8)
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
