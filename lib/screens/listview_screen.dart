import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class ListViewScreen extends StatelessWidget {

  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Directores'),
      ),
      drawer: DrawerMenu(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: const [
          ListTile(
            title: Text('Darabont'),
            subtitle: Text('Frank'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Nolan'),
            subtitle: Text('Christopher'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Tarantino'),
            subtitle: Text('Quentin'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Ford Coppola'),
            subtitle: Text('Francis'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Zemeckis'),
            subtitle: Text('Robert'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('The Wachowskis'),
            subtitle: Text('Brothers'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Spielberg'),
            subtitle: Text('Steven'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Fincher'),
            subtitle: Text('David'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Lawrence'),
            subtitle: Text('Francis'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Jackson'),
            subtitle: Text('Peter'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
        ],
      )
    );
  }
}