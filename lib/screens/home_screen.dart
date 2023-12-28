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
            color: Colors.red,
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
          'https://es.web.img3.acsta.net/medias/nmedia/18/74/26/88/20133359.jpg',
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
      imageUrl: 'https://pics.filmaffinity.com/Pulp_Fiction-210382116-mmed.jpg',
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
          'https://ca-times.brightspotcdn.com/dims4/default/8aa9b65/2147483647/strip/true/crop/2093x3000+0+0/resize/1200x1720!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F47%2F95%2Fcbf137037b833a53a724fde3f53e%2Fcfdj8emgq7504ddbn1ibedbziqes-ufxmz-ypi0gordml8oigvx-qxnfyjdexxje48b9jsnhzr2hbbtg9-5bm2ewo-sfvcb9svtpufonjqohy-raixysjlgk7fagt3voiify9grgz0pkj-sysmn1pfblqffyiedjz8nszvhrheowg2imuyrmeklodsplgwx3wmznmclm-gx-cvc7m0lf7h7crd5meu1oztvsd9po-e1pldrzmjwobcwk9h7avlf0y4ew56xkel9filhfyidkf9rpndq4ic7-snlvnin85poimejwzyp6rq-q8qsqvmlvl2xaq3rsy-7axvtxqcpqinvjubaglw5risa6bqkfrpqowvdt29rhgoxnbsbi3dnwzldfjuimuizsg2hody3cu-y1kgk',
    ),
    Movie(
      title: 'Forrest Gump',
      director: 'Robert Zemeckis',
      genres: ['Drama', 'Romance'],
      year: 1994,
      releaseDate: '6 de julio de 1994',
      synopsis:
          'Las presidencias de Kennedy y Johnson, los eventos de Vietnam, Watergate y otras historias se desarrollan desde la perspectiva de un hombre de Alabama con un coeficiente intelectual de 75.',
      imageUrl: '',
    ),
    Movie(
      title: 'Matrix',
      director: 'The Wachowskis',
      genres: ['Action', 'Sci-Fi'],
      year: 1999,
      releaseDate: '31 de marzo de 1999',
      synopsis:
          'Un hacker informático descubre la verdadera naturaleza de su realidad y su papel en la guerra contra sus controladores.',
      imageUrl: '',
    ),
    Movie(
      title: 'La lista de Schindler',
      director: 'Steven Spielberg',
      genres: ['Biography', 'Drama', 'History'],
      year: 1993,
      releaseDate: '15 de diciembre de 1993',
      synopsis:
          'En la Polonia ocupada por los alemanes durante la Segunda Guerra Mundial, el industrial Oskar Schindler se preocupa gradualmente por su fuerza laboral judía después de presenciar su persecución por parte de los nazis.',
      imageUrl: '',
    ),
    Movie(
      title: 'El club de la pelea',
      director: 'David Fincher',
      genres: ['Drama'],
      year: 1999,
      releaseDate: '15 de octubre de 1999',
      synopsis:
          'Un trabajador de oficina insomne y un fabricante de jabón sin preocupaciones forman un club de lucha clandestino que evoluciona hacia algo mucho más.',
      imageUrl: '',
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
      imageUrl: 'https://m.media-amazon.com/images/I/51kTEs6zvdL._AC_.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP Peliculas'),
        centerTitle: true,
        backgroundColor: Colors.red,
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
