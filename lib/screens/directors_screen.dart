import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DirectorsPage extends StatefulWidget {
  @override
  _DirectorsPageState createState() => _DirectorsPageState();
}

class _DirectorsPageState extends State<DirectorsPage> {
  List<String> movieNames = [];
  List<String> directorNames = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://peliculas-info.onrender.com/peliculas/directores'),
      headers: {'x-flutter-app': 'true'},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(response.body);
      setState(() {
        movieNames = List<String>.from(data['nombre_peliculas']);
        directorNames = List<String>.from(data['directores_lista']);
      });
      //print(movieNames);
      //print(directorNames);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Directores'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: ListView.builder(
        itemCount: movieNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(movieNames[index]),
            subtitle: Text('Director/es: ${directorNames[index]}'),
          );
        },
      ),
    );
  }
}
