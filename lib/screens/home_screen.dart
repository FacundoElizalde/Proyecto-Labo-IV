import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class Movie {
  final String title;
  final String director;
  final int year;
  final String releaseDate;
  final String synopsis;
  final String imageUrl;

  Movie({
    required this.title,
    required this.director,
    required this.year,
    required this.releaseDate,
    required this.synopsis,
    required this.imageUrl,
  });
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Movie> movies = [
    Movie(
      title: 'Inception',
      director: 'Christopher Nolan',
      year: 2010,
      releaseDate: '16 de julio de 2010',
      synopsis:
          'Un ladrón que entra en los sueños de otros para robar sus secretos.',
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_.jpg',
    ),
    Movie(
      title: 'Cadena perpetua',
      director: 'Frank Darabont',
      year: 1994,
      releaseDate: '23 de septiembre de 1994',
      synopsis:
          'Dos hombres encarcelados establecen un vínculo a lo largo de varios años, encontrando consuelo y redención eventual a través de actos de decencia común.',
      imageUrl: '',
    ),
    Movie(
      title: 'El caballero de la noche',
      director: 'Christopher Nolan',
      year: 2008,
      releaseDate: '18 de julio de 2008',
      synopsis:
          'Cuando surge la amenaza conocida como el Joker, Batman debe enfrentarlo para hacer justicia.',
      imageUrl: '',
    ),
    Movie(
      title: 'Pulp Fiction',
      director: 'Quentin Tarantino',
      year: 1994,
      releaseDate: '21 de mayo de 1994',
      synopsis:
          'Las vidas de dos sicarios, un boxeador, un gánster y su esposa, y un par de bandidos de un restaurante se entrelazan en cuatro relatos de violencia y redención.',
      imageUrl: '',
    ),
    Movie(
      title: 'El Padrino',
      director: 'Francis Ford Coppola',
      year: 1972,
      releaseDate: '24 de marzo de 1972',
      synopsis:
          'El patriarca envejecido de una dinastía del crimen organizado transfiere el control de su imperio clandestino a su renuente hijo.',
      imageUrl: '',
    ),
    Movie(
      title: 'Forrest Gump',
      director: 'Robert Zemeckis',
      year: 1994,
      releaseDate: '6 de julio de 1994',
      synopsis:
          'Las presidencias de Kennedy y Johnson, los eventos de Vietnam, Watergate y otras historias se desarrollan desde la perspectiva de un hombre de Alabama con un coeficiente intelectual de 75.',
      imageUrl: '',
    ),
    Movie(
      title: 'Matrix',
      director: 'The Wachowskis',
      year: 1999,
      releaseDate: '31 de marzo de 1999',
      synopsis:
          'Un hacker informático descubre la verdadera naturaleza de su realidad y su papel en la guerra contra sus controladores.',
      imageUrl: '',
    ),
    Movie(
      title: 'La lista de Schindler',
      director: 'Steven Spielberg',
      year: 1993,
      releaseDate: '15 de diciembre de 1993',
      synopsis:
          'En la Polonia ocupada por los alemanes durante la Segunda Guerra Mundial, el industrial Oskar Schindler se preocupa gradualmente por su fuerza laboral judía después de presenciar su persecución por parte de los nazis.',
      imageUrl: '',
    ),
    Movie(
      title: 'El club de la pelea',
      director: 'David Fincher',
      year: 1999,
      releaseDate: '15 de octubre de 1999',
      synopsis:
          'Un trabajador de oficina insomne y un fabricante de jabón sin preocupaciones forman un club de lucha clandestino que evoluciona hacia algo mucho más.',
      imageUrl: '',
    ),
    Movie(
      title: 'Los Juegos del Hambre: Balada de Pajaros Cantores y Serpientes',
      director: 'Francis Lawrence',
      year: 2023,
      releaseDate: '16 de Noviembre de 2023',
      synopsis:
          'Años antes de convertirse en el tiránico presidente de Panem, Coriolanus Snow, de 18 años de edad, ve una oportunidad para un cambio de suerte cuando es mentor de Lucy Gray Baird, la tributo del Distrito 12.',
      imageUrl:
          'https://archivos-cms.cinecolombia.com/images/5/6/2/2/42265-7-esl-CO/f74b830866e0-2_poster_480x670.png',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP Peliculas'),
        centerTitle: true,
        backgroundColor: (Colors.red),
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
              Text('Año: ${movie.year}'),
              Text('Sinopsis: ${movie.synopsis}'),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Image.network(
                  movie.imageUrl,
                  height: 200,
                ),
              ),
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
