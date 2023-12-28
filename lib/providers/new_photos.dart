

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/photo_info.dart';
import '../models/photo_news.dart';

class PhotosProvider extends ChangeNotifier{

  final String _apiKey = dotenv.env['API_KEY_UNSPLASH'].toString();
  final String _baseUrl = 'api.unsplash.com';
  // final String _baseUrl = '10.0.2.2:8080';
  bool isLoading= false;
  int page = 1;

  List<PhotoInfo> photos = [];

  PhotosProvider(){
    print('PhotosProvider   init....................');
    isLoading = false;
    this.getNewPhotos();

  }

  Future<void> getNewPhotos() async{
      isLoading = true;
      notifyListeners();
      final url = Uri.https(_baseUrl, '/photos', {
        'client_id' :_apiKey, 
        'page':page.toString(),       
      });
      /* final url = Uri.http(_baseUrl, '/api/v1/fotos/lastphotos',{
        'page': page.toString(),
      }); */
      
      print('url future: $url');      
      
      final response = await http.get(url); 

      // print(response.body);

      //final data = json.decode(response.body);    
      
      final data = NewPhotosModel.fromJson(response.body);    

      this.photos = [...data];
      isLoading = false;
      page++;
      notifyListeners();
  }

}