import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static String _email = '';
  static String _nombre = '';  
  static String _dni = '';  
  static String _genero = '';  
  static bool _darkmode = false;


  static late SharedPreferences _prefs;
  

  static Future<void> initShared() async {
    _prefs = await SharedPreferences.getInstance();     
  }


  static String get email{
    return _prefs.getString('email') ?? _email;
  }
  static String get nombre{
    return _prefs.getString('nombre') ?? _nombre;
  }
  static String get dni{
    return _prefs.getString('dni') ?? _dni;
  }
  static bool get darkmode{
    return _prefs.getBool('darkmode') ?? _darkmode;
  }
  static String get genero{
    return _prefs.getString('genero') ?? _genero;
  }

  static set email(String value){
    _email = value;
    _prefs.setString('email', value);
  }
  static set nombre(String value){
    _nombre = value;
    _prefs.setString('nombre', value);
  }
  static set dni(String value){
    _dni = value;
    _prefs.setString('dni', value);
  }
  static set darkmode(bool value){    
    _darkmode = value;
    _prefs.setBool('darkmode', value);
  }
  static set genero(String value){    
    _genero = value;
    _prefs.setString('genero', value).then((value) => null);  
  }


}