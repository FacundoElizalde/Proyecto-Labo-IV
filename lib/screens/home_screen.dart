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
          'data:image/jpeg;base64,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',
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
          'data:image/jpeg;base64,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',
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
