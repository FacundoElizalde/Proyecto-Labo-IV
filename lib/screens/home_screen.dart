import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/screens/form_page.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';
import 'package:flutter_repo_guide/screens/profile_page.dart';

class Movie {
  final String title;
  final String director;
  final List<String> genres;
  final int year;
  final String releaseDate;
  final String synopsis;
  final String imageUrl;

  Movie({
    required this.title,
    required this.director,
    required this.genres,
    required this.year,
    required this.releaseDate,
    required this.synopsis,
    required this.imageUrl,
  });
}

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  final PageController pageController;

  MovieDetailScreen({required this.movie, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: PageView(
        controller: pageController,
        children: [
          // Primera página
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${movie.title} (${movie.year})',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 20),
                Image.network(
                  movie.imageUrl,
                  height: 200,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text('Ver Detalles'),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.green,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Género: ${movie.genres.join(', ')}',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Director: ${movie.director}',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Sinopsis: ${movie.synopsis}',
                  style: const TextStyle(
                    color: Colors.white,
                    wordSpacing: 4,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text('Volver'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Movie> movies = [
    Movie(
      title: 'Cadena perpetua',
      director: 'Frank Darabont',
      genres: ['Drama'],
      year: 1994,
      releaseDate: '23 de septiembre de 1994',
      synopsis:
          'Dos hombres encarcelados establecen un vínculo a lo largo de varios años, encontrando consuelo y redención eventual a través de actos de decencia común.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN2ky4G-y85pMam-ccRhIzuGp5rVk65fk2Sg&usqp=CAU',
    ),
    Movie(
      title: 'El caballero de la noche',
      director: 'Christopher Nolan',
      genres: ['Action', 'Crime', 'Drama'],
      year: 2008,
      releaseDate: '18 de julio de 2008',
      synopsis:
          'Cuando surge la amenaza conocida como el Joker, Batman debe enfrentarlo para hacer justicia.',
      imageUrl:
          'https://live.staticflickr.com/3085/2650048909_ee1bbc2a0b_z.jpg',
    ),
    Movie(
      title: 'Pulp Fiction',
      director: 'Quentin Tarantino',
      genres: ['Crime', 'Drama'],
      year: 1994,
      releaseDate: '21 de mayo de 1994',
      synopsis:
          'Las vidas de dos sicarios, un boxeador, un gánster y su esposa, y un par de bandidos de un restaurante se entrelazan en cuatro relatos de violencia y redención.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKpjEnZ3a_S1yO47YC54VbmYspVlKX8yrUYg&usqp=CAU',
    ),
    Movie(
      title: 'El Padrino',
      director: 'Francis Ford Coppola',
      genres: ['Crime', 'Drama'],
      year: 1972,
      releaseDate: '24 de marzo de 1972',
      synopsis:
          'El patriarca envejecido de una dinastía del crimen organizado transfiere el control de su imperio clandestino a su renuente hijo.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNTDu43x_AePmF3Dszc3uOYFfLYmSS6XUMjw&usqp=CAU',
    ),
    Movie(
      title: 'Forrest Gump',
      director: 'Robert Zemeckis',
      genres: ['Drama', 'Romance'],
      year: 1994,
      releaseDate: '6 de julio de 1994',
      synopsis:
          'Las presidencias de Kennedy y Johnson, los eventos de Vietnam, Watergate y otras historias se desarrollan desde la perspectiva de un hombre de Alabama con un coeficiente intelectual de 75.',
      imageUrl:
          'https://images.cdn2.buscalibre.com/fit-in/360x360/d9/e0/d9e064b59a6c29981af806b3ee87d95b.jpg',
    ),
    Movie(
      title: 'Matrix',
      director: 'The Wachowskis',
      genres: ['Action', 'Sci-Fi'],
      year: 1999,
      releaseDate: '31 de marzo de 1999',
      synopsis:
          'Un hacker informático descubre la verdadera naturaleza de su realidad y su papel en la guerra contra sus controladores.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTixvJ-5yFL_84VPsG8ZgG9IWnRjSOwauff3wKyAjRyFEIEVzsp5Fh1lLKNS4jDqIyqPko&usqp=CAU',
    ),
    Movie(
      title: 'La lista de Schindler',
      director: 'Steven Spielberg',
      genres: ['Biography', 'Drama', 'History'],
      year: 1993,
      releaseDate: '15 de diciembre de 1993',
      synopsis:
          'En la Polonia ocupada por los alemanes durante la Segunda Guerra Mundial, el industrial Oskar Schindler se preocupa gradualmente por su fuerza laboral judía después de presenciar su persecución por parte de los nazis.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRVhnEkec8HtB-43wFp9BPOB3-YPxO7WO7WuPJy_zxCMbZZfIEs17o-i4WzsOvVAKWvhc&usqp=CAU',
    ),
    Movie(
      title: 'El club de la pelea',
      director: 'David Fincher',
      genres: ['Drama'],
      year: 1999,
      releaseDate: '15 de octubre de 1999',
      synopsis:
          'Un trabajador de oficina insomne y un fabricante de jabón sin preocupaciones forman un club de lucha clandestino que evoluciona hacia algo mucho más.',
      imageUrl:
          'https://cdn.colombia.com/cine/2012/11/97c52f3ce5084a4da84fa14ace6af697.png',
    ),
    Movie(
      title: 'Los Juegos del Hambre: Balada de Pajaros Cantores y Serpientes',
      director: 'Francis Lawrence',
      genres: ['Action', 'Adventure', 'Drama'],
      year: 2023,
      releaseDate: '16 de Noviembre de 2023',
      synopsis:
          'Años antes de convertirse en el tiránico presidente de Panem, Coriolanus Snow, de 18 años de edad, ve una oportunidad para un cambio de suerte cuando es mentor de Lucy Gray Baird, la tributo del Distrito 12.',
      imageUrl:
          'https://archivos-cms.cinecolombia.com/images/5/6/2/2/42265-7-esl-CO/f74b830866e0-2_poster_480x670.png',
    ),
    Movie(
      title: 'El Señor de los Anillos: El retorno del rey',
      director: 'Peter Jackson',
      genres: ['Action', 'Adventure', 'Drama'],
      year: 2003,
      releaseDate: '17 de diciembre de 2003',
      synopsis:
          'Mientras el ejército de Sauron ataca Minas Tirith, Frodo y Sam se acercan a Mordor con el anillo único para destruirlo.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScHPzX0DiM3cdEM53lRmdiKpkFPdd5lQW2BXRn3W3V-WDM8E8DJT4rbEuga9sGAZ5UGrM&usqp=CAU',
    ),
    Movie(
      title: 'Harry Potter y la Piedra Filosofal',
      director: 'Chris Columbus',
      genres: ['Adventure', 'Family', 'Fantasy'],
      year: 2001,
      releaseDate: '22 de noviembre de 2001',
      synopsis:
          'Un joven mago, Harry Potter, descubre su identidad en la escuela de magia de Hogwarts y enfrenta el malvado plan de Voldemort para obtener la piedra filosofal.',
      imageUrl:
          'https://i0.wp.com/cineyvaloressj.com/wp-content/uploads/2020/08/42100525172832813e301be5faadbbf1.jpg?fit=873%2C1200&ssl=1&w=640',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

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
            icon: const Icon(Icons.login), // Replace with your login icon
            onPressed: () {
              // Implement the action when the login icon is pressed
              // For example, navigate to the login screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              // Implement the action when the registration icon is pressed
              // For example, navigate to the registration screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormScreen()),
              );
            },
          ),
        ], // Remove this extra closing bracket
      ),
      drawer: DrawerMenu(),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movies[index].title),
            subtitle: Text('${movies[index].director} (${movies[index].year})'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(
                    movie: movies[index],
                    pageController: pageController,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
