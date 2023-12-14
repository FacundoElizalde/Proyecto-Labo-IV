import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';


class ListBuilderScreen extends StatelessWidget {
   
  const ListBuilderScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder Screen...'),
      ),      
      drawer: DrawerMenu(),
      body: ListView.separated(
        itemBuilder: (_, index) {
          print('..........: $index');
          
         return ListTile(
            title: Text('Texto de prueba $index'),
            leading: const Icon(Icons.check_box),
            trailing: const Icon(Icons.arrow_forward_rounded),
            subtitle: const Text('help block'),
          );
        }, 
        separatorBuilder: (_, __) {
          return const Divider(height: 5);
        }, 
        itemCount: 10
    ),
    );
  }
}