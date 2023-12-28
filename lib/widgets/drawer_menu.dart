import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final List<Map<String, String>> _menuItems = <Map<String, String>>[
    {'route': 'home', 'title': 'Home', 'subtitle': 'Peliculas mas solicitadas'},
    {'route': 'directors', 'title': 'Directores', 'subtitle': ''},
    {'route': 'genres', 'title': 'Generos', 'subtitle': ''},
    {'route': 'profile', 'title': 'Login', 'subtitle': ''},
    {'route': 'form_screen', 'title': 'Registrarse', 'subtitle': ''},
  ];

  DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIJiMv-gjUZSEjy4KmItsOTgscCOctneo7Q&usqp=CAU',
              fit: BoxFit.cover,
            ),
          ),
          ...ListTile.divideTiles(
            context: context,
            tiles: _menuItems
                .map((item) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      dense: true,
                      minLeadingWidth: 25,
                      iconColor: Colors.blueGrey,
                      title: Text(item['title']!,
                          style: const TextStyle(fontFamily: 'FuzzyBubbles')),
                      subtitle: Text(item['subtitle'] ?? '',
                          style: const TextStyle(
                              fontFamily: 'RobotoMono', fontSize: 11)),
                      leading: const Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, item['route']!);
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
