import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class ListViewScreen extends StatelessWidget {
   
  const ListViewScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View'),
      ),
      drawer: DrawerMenu(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: const [
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
          ListTile(
            title: Text('Maria Fernanda Garcia'),
            subtitle: Text('mfgarcia@gmail.com'),
            leading: Icon(Icons.check_box),
            trailing: Icon(Icons.arrow_right_alt_rounded),
          ),
        ],
      )
    );
  }
}