import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureBuilderScreen extends StatelessWidget {
   
  FutureBuilderScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
         centerTitle:true,
         title: const Text('FutureBuilderScreen'),
         elevation:10,
      ),
      body: TextFuture()
    );
  }
}

class TextFuture extends StatefulWidget {
  TextFuture({
    Key? key,
  }) : super(key: key);

  @override
  State<TextFuture> createState() => _TextFutureState();
}

class _TextFutureState extends State<TextFuture> {
  late Future<Album> futureAlbum;
  late Future<Map<String, String>> futureData;
  

  Future<Album> fetchAlbum() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  final Future<Map<String,String>> _calculation = Future<Map<String,String>>.delayed(
    const Duration(seconds: 2),
    () => {'title':'Data Loaded'},
  );



  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futureData = _calculation;
  }


  @override
  Widget build(BuildContext context) {
   return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<Album>(
        future: futureAlbum, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Album> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            print(snapshot.data);
            children = <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                
                child: Text('Result: ${snapshot.data?.title}'),
              ),
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}