import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_repo_guide/screens/form_page.dart'; // Importa tus pantallas necesarias
import 'package:flutter_repo_guide/screens/profile_page.dart'; // Importa tus pantallas necesarias
import 'package:flutter_repo_guide/widgets/drawer_menu.dart'; // Importa tus widgets necesarios

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP Peliculas'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormScreen()),
              );
            },
          ),
        ],
      ),
      drawer: DrawerMenu(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar película',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                _searchMovies(context, value);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Muestra el indicador de carga circular
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );

              // Obtener los datos de las películas
              final moviesData = await fetchData();

              // Oculta el indicador de carga circular
              Navigator.pop(context);

              // Navega a la lista de películas
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoviesList(data: moviesData),
                ),
              );
            },
            child: const Text('Mostrar películas'),
          ),
        ],
      ),
    );
  }

  Future<void> _searchMovies(BuildContext context, String searchTerm) async {
    // Muestra el indicador de carga circular
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      final url =
          Uri.parse('https://peliculas-info.onrender.com/peliculas/buscar');
      final response = await http.post(
        url,
        headers: {'x-flutter-app': 'true'},
        body: {'busqueda': '$searchTerm'},
      );

      if (response.statusCode == 200) {
        print(searchTerm);
        print(response.body);
        final searchData = json.decode(response.body);
        Navigator.pop(context); // Oculta el indicador de carga circular

        // Navega a la lista de películas con los resultados de la búsqueda
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviesList(data: searchData),
          ),
        );
      } else {
        throw Exception('No se encontró la película con nombre: $searchTerm');
      }
    } catch (e) {
      print('Error searching movies: $e');
      Navigator.pop(context); // Oculta el indicador de carga circular
      // Muestra un diálogo o mensaje de error al usuario
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
                'No se encontró ninguna película con el nombre: $searchTerm'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse('https://peliculas-info.onrender.com/peliculas'),
      headers: {'x-flutter-app': 'true'},
    );
    if (response.statusCode == 200) {
      //print(response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class MoviesList extends StatelessWidget {
  final Map<String, dynamic> data;

  const MoviesList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Películas'),
      ),
      body: ListView.builder(
        itemCount: data['nombre_peliculas'].length,
        itemBuilder: (context, index) {
          final movieName = data['nombre_peliculas'][index];
          final movieId = data['id_peliculas'][index];
          final movieSynopsis = data['sinopsis_peliculas'][index];
          final movieImage = data['imagenes_peliculas'][index];
          return ListTile(
            leading: Image.network(
              movieImage,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(movieName),
            subtitle: Text(
              movieSynopsis.length <= 120
                  ? movieSynopsis
                  : movieSynopsis.substring(0, 117) +
                      '...', // Limita la sinopsis a 117 caracteres
              overflow: TextOverflow
                  .ellipsis, // Usa los 3 puntos si se corta el texto
            ),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(
                      movieTitle: movieName, movieId: movieId),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final String movieTitle;
  final String movieId;

  const MovieDetailScreen({
    Key? key,
    required this.movieTitle,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$movieTitle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar a la URL `/peliculas/id`
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieInfoScreen(movieId: movieId),
                  ),
                );
              },
              child: Text('Mostrar información'),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieInfoScreen extends StatefulWidget {
  final String movieId;

  const MovieInfoScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieInfoScreenState createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {
  bool _isLoading = true;
  Map<String, dynamic>? _movieData;

  @override
  void initState() {
    super.initState();
    fetchMovieInfo(widget.movieId);
  }

  Future<void> fetchMovieInfo(String movieId) async {
    try {
      //print(movieId);
      final response = await http.get(
        Uri.parse('https://peliculas-info.onrender.com/pelicula/$movieId'),
        headers: {'x-flutter-app': 'true'},
      );
      if (response.statusCode == 200) {
        //print(response.body);
        final data = json.decode(response.body);
        setState(() {
          _movieData = data;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load movie info');
      }
    } catch (e) {
      print('Error fetching movie info: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Película'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _movieData != null
              ? ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    ListTile(
                      title: Text(
                        _movieData!['Title'],
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetail('Año', _movieData!['Year']),
                          _buildDetail('Sinopsis', _movieData!['Plot']),
                          _buildDetail('Director(s)', _movieData!['Director']),
                          _buildDetail('Género', _movieData!['Genre']),
                          _buildDetail('Idioma', _movieData!['Language']),
                          _buildDetail('País', _movieData!['Country']),
                          _buildDetail('Premios', _movieData!['Awards']),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    'No se pudo cargar la información de la película',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.red,
                    ),
                  ),
                ),
    );
  }

  Widget _buildDetail(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
