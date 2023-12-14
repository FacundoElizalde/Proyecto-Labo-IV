import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_repo_guide/models/photo_info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FuturePhotoScreen extends StatelessWidget {
   
  FuturePhotoScreen({super.key});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
         centerTitle:true,
         title: const Text('FuturePhotoScreen'),
         elevation:10,
      ),
      body: ListaPhotos()
    );
  }
}

class ListaPhotos extends StatefulWidget {
  ListaPhotos({
    Key? key,
  }) : super(key: key);

  @override
  State<ListaPhotos> createState() => _ListaPhotosState();
}


class _ListaPhotosState extends State<ListaPhotos> {
  late Future<PhotoInfo> futurePhoto;
  final String _apiKey   = dotenv.env['API_KEY_UNSPLASH'].toString();


  Future<PhotoInfo> fetchPhoto() async {
    
    final url = await Uri.https( 'api.unsplash.com', '/photos/K47_kmiJJFs',{
      'client_id':_apiKey
    });

    final response = await http.get(url);


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      return PhotoInfo.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load photo');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePhoto = fetchPhoto();    
  }


  @override
  Widget build(BuildContext context) {
   return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<PhotoInfo>(
        future: futurePhoto, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<PhotoInfo> snapshot) {
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
                
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/loading.gif'),
                  image: NetworkImage(snapshot.data!.urls.small),
                )                
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