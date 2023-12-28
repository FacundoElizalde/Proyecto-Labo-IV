import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/widgets/drawer_menu.dart';

class ContainerPage extends StatefulWidget {
    const ContainerPage({super.key});
  @override
  State<ContainerPage> createState() => _ContainerStatePage();
}

class _ContainerStatePage extends State<ContainerPage> {
  double _width = 250;
  double _height = 250;

  BorderRadius _borderRaduis = BorderRadius.circular(20);

  Color _color = Colors.red;

  void refreshContainer(){
    final random = Random();
    
    
    setState(() {
      _width = random.nextInt(250).toDouble() + 50;
      _height = random.nextInt(250).toDouble() + 50;
      _borderRaduis = BorderRadius.circular(random.nextInt(20).toDouble());
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(250), 
        random.nextInt(250), 1.0
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Page'),
      ),
      drawer: DrawerMenu(),
      body: Center(
         child: AnimatedContainer(
            duration: const Duration(milliseconds: 800 ),
            curve: Curves.bounceOut,
            width: _width,
            height: _height,         
            transform: Matrix4.rotationZ(6.1),   
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRaduis
            ),
            child: Center(child: Text('PRUEBA')),
         ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshContainer,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}