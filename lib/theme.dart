import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//-----------------Light Theme Data-------------------------//
ThemeData light = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.red,
  scaffoldBackgroundColor: Colors.white,
);
//----------------Dark Theme Data--------------------------//
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
);

///Theme Notifier class is used change theme
///updated themes data are added to shared prefs
class ThemeNotifier extends ChangeNotifier{
  //initial declaration fo variable
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;
  //initializing constructor
  ThemeNotifier(){
    _darkTheme = true;
    _loadFromPrefs();
  }
  //get theme value either true or false, if dark true else false
  bool get darkTheme=>_darkTheme;
  //when user press on switch then it will change theme value
  //for e.g. if it dark then it will change to light
  toggleTheme(){
    _darkTheme = !_darkTheme;
    _saveToPrefs();//updated theme data is saved using shared prefs
    notifyListeners();
  }
  //initial prefs
  _initPrefs() async{
    if(_prefs == null){
      _prefs = await SharedPreferences.getInstance();
    }
  }
  //load from shared prefs if it has value
  _loadFromPrefs() async{
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }
  //updated theme data is saved
  _saveToPrefs() async{
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}