import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final List<Map<String, String>> _menuItems = <Map<String, String>>[
    {'route': 'home', 'title': 'Home', 'subtitle': 'Peliculas mas solicitadas'},
    {'route': 'design', 'title': 'Diseños', 'subtitle': 'Estructura y diseño'},
    {'route': 'animated', 'title': 'Animated Cointainer', 'subtitle': ''},
    {'route': 'counter', 'title': 'Counter', 'subtitle': ''},
    {'route': 'flexbox', 'title': 'Ejemplos de Flexbox', 'subtitle': ''},
    {'route': 'qr_code', 'title': 'QR Scanner', 'subtitle': ''},
    {'route': 'swipper', 'title': 'Card Swipper', 'subtitle': ''},
    {'route': 'slivers', 'title': 'Slivers', 'subtitle': ''},
    {'route': 'profile', 'title': 'Perfil Usuario', 'subtitle': ''},
    {'route': 'alert', 'title': 'Alertas', 'subtitle': ''},
    {
      'route': 'provider',
      'title': 'Demo Provider',
      'subtitle': 'bonus: BottomNavigationBar'
    },
    {'route': 'photo_provider', 'title': 'Unsplash', 'subtitle': ''},
    {'route': 'pageview', 'title': 'Pageviews', 'subtitle': ''},
    {'route': 'infinite_scroll', 'title': 'Infinite Scroll', 'subtitle': ''},
    {'route': 'future_builder1', 'title': 'Future Builder Ej1', 'subtitle': ''},
    {'route': 'future_builder2', 'title': 'Future Builder Ej2', 'subtitle': ''},
    {'route': 'form_screen', 'title': 'Form Screen', 'subtitle': ''},
    {'route': 'fingerprint_screen', 'title': 'Huella Digital', 'subtitle': ''},
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
