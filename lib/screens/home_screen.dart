import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/screens/form_page.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';
import 'package:flutter_repo_guide/screens/profile_page.dart';

class Movie {
  final String id;
  final String title;
  final String imageUrl;
  final String synopsis;
  final List<String> generosPelicula;
  final List<String> directorPelicula;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.synopsis,
    required this.generosPelicula,
    required this.directorPelicula,
  });
}

class MovieDetailScreen extends StatelessWidget {
  final PageController pageController;
  final Movie movie;
  final int index;

  MovieDetailScreen({
    required this.pageController,
    required this.movie,
    required this.index,
  });

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
            color: Colors.red[900],
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${movie.title} (${movie.id})',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                  ),
                  child: Image.network(
                    movie.imageUrl,
                    height: 200,
                  ),
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

          // Segunda página
          Container(
            color: Colors.green,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Género/s: ${movie.generosPelicula.join(', ')}',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Director/es: ${movie.directorPelicula.join(', ')}', // .join(', ') sirve para recorrer la lista y separar.
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

  final Map<String, dynamic> moviesData = {
    "nombre_peliculas": [
      "Cadena perpetua",
      "El caballero de la noche",
      "Pulp Fiction",
      "El Padrino",
      "Forrest Gump",
      "Matrix",
      "La lista de Schindler",
      "El club de la pelea",
      "Los Juegos del Hambre: Balada de Pajaros Cantores y Serpientes",
      "El Señor de los Anillos: El retorno del rey",
      "Harry Potter y la Piedra Filosofal"
    ],
    "imagenes_peliculas": [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN2ky4G-y85pMam-ccRhIzuGp5rVk65fk2Sg&usqp=CAU",
      "https://live.staticflickr.com/3085/2650048909_ee1bbc2a0b_z.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKpjEnZ3a_S1yO47YC54VbmYspVlKX8yrUYg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNTDu43x_AePmF3Dszc3uOYFfLYmSS6XUMjw&usqp=CAU",
      "https://images.cdn2.buscalibre.com/fit-in/360x360/d9/e0/d9e064b59a6c29981af806b3ee87d95b.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTixvJ-5yFL_84VPsG8ZgG9IWnRjSOwauff3wKyAjRyFEIEVzsp5Fh1lLKNS4jDqIyqPko&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRVhnEkec8HtB-43wFp9BPOB3-YPxO7WO7WuPJy_zxCMbZZfIEs17o-i4WzsOvVAKWvhc&usqp=CAU",
      "https://cdn.colombia.com/cine/2012/11/97c52f3ce5084a4da84fa14ace6af697.png",
      "https://archivos-cms.cinecolombia.com/images/5/6/2/2/42265-7-esl-CO/f74b830866e0-2_poster_480x670.png",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScHPzX0DiM3cdEM53lRmdiKpkFPdd5lQW2BXRn3W3V-WDM8E8DJT4rbEuga9sGAZ5UGrM&usqp=CAU",
      "https://i0.wp.com/cineyvaloressj.com/wp-content/uploads/2020/08/42100525172832813e301be5faadbbf1.jpg?fit=873%2C1200&ssl=1&w=640"
    ],
    "id_peliculas": [
      "tt0111161",
      "tt0468569",
      "tt0110912",
      "tt0068646",
      "tt0109830",
      "tt0133093",
      "tt0108052",
      "tt0137523",
      "tt5834204",
      "tt0167260",
      "tt0241527"
    ],
    "sinopsis_peliculas": [
      "Dos hombres encarcelados establecen un vínculo a lo largo de varios años, encontrando consuelo y redención eventual a través de actos de decencia común.",
      "Cuando surge la amenaza conocida como el Joker, Batman debe enfrentarlo para hacer justicia.",
      "Las vidas de dos sicarios, un boxeador, un gánster y su esposa, y un par de bandidos de un restaurante se entrelazan en cuatro relatos de violencia y redención.",
      "El patriarca envejecido de una dinastía del crimen organizado transfiere el control de su imperio clandestino a su renuente hijo.",
      "Las presidencias de Kennedy y Johnson, los eventos de Vietnam, Watergate y otras historias se desarrollan desde la perspectiva de un hombre de Alabama con un coeficiente intelectual de 75.",
      "Un hacker informático descubre la verdadera naturaleza de su realidad y su papel en la guerra contra sus controladores.",
      "En la Polonia ocupada por los alemanes durante la Segunda Guerra Mundial, el industrial Oskar Schindler se preocupa gradualmente por su fuerza laboral judía después de presenciar su persecución por parte de los nazis.",
      "Un trabajador de oficina insomne y un fabricante de jabón sin preocupaciones forman un club de lucha clandestino que evoluciona hacia algo mucho más.",
      "Años antes de convertirse en el tiránico presidente de Panem, Coriolanus Snow, de 18 años de edad, ve una oportunidad para un cambio de suerte cuando es mentor de Lucy Gray Baird, la tributo del Distrito 12.",
      "Mientras el ejército de Sauron ataca Minas Tirith, Frodo y Sam se acercan a Mordor con el anillo único para destruirlo.",
      "Un joven mago, Harry Potter, descubre su identidad en la escuela de magia de Hogwarts y enfrenta el malvado plan de Voldemort para obtener la piedra filosofal."
    ]
  };

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
                // Implementa la lógica para filtrar las películas aquí
                print('Texto ingresado: $value');
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Películas generadas'),
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView.builder(
                        itemCount: moviesData['nombre_peliculas'].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(moviesData['nombre_peliculas'][index]),
                            subtitle: Text(
                              moviesData['sinopsis_peliculas'][index],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailScreen(
                                    movie: Movie(
                                      id: moviesData['id_peliculas'][index],
                                      title: moviesData['nombre_peliculas']
                                          [index],
                                      imageUrl: moviesData['imagenes_peliculas']
                                          [index],
                                      synopsis: moviesData['sinopsis_peliculas']
                                          [index],
                                      generosPelicula: [], // Agrega los géneros si los tienes
                                      directorPelicula: [], // Agrega el director si lo tienes
                                    ),
                                    pageController: pageController,
                                    index: index, // Aquí pasas el índice
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Cerrar el diálogo
                        },
                        child: Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Mostrar películas'),
          ),
        ],
      ),
    );
  }
}
