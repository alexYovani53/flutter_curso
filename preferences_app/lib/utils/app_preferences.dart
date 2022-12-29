
import 'package:shared_preferences/shared_preferences.dart';

class Preferences{
  static late SharedPreferences _prefs;
  
  static const String keyName = "name";
  static const String keyGender = "gender";
  static const String keyMode = "mode";

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name => _getString(keyName);
  static int get gender => _getInt(keyName);
  static bool get mode => _getBool(keyName);
  

  static String _getString(String name) => _prefs.getString(name) ?? "";
  static bool _getBool(String name) => _prefs.getBool(name) ?? false;
  static int _getInt(String name) => _prefs.getInt(name) ?? 1;

  static setPreference(String key, Object value){
    if(value.runtimeType == int) {
      _prefs.setInt(key, value as int);
    } else if(value.runtimeType == String) {
      _prefs.setString(key, value as String);
    } else if(value.runtimeType == bool) {
      _prefs.setBool(key, value as bool);
    }
  }
}


class Preferences2{

  Preferences2._();
  static final Preferences2 shared = Preferences2._();

  late SharedPreferences _prefs;

  final String _keyName = "name";
  final String _keyGender = "gender";
  final String _keyMode = "mode";

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get name => _getString(_keyName);
  int get gender => _getInt(_keyGender);
  String get genderString => _getInt(_keyGender) == 1 ? "Masculino" : "Femenino";
  bool get mode => _getBool(_keyMode);

  set setname(String name) => setPreference(_keyName,name);
  set setGender(int gender) => setPreference(_keyGender,gender);
  set setMode(bool modeDark) => setPreference(_keyMode,modeDark);
  

  String _getString(String name) => _prefs.getString(name) ?? "";
  bool _getBool(String name) => _prefs.getBool(name) ?? false;
  int _getInt(String name) => _prefs.getInt(name) ?? 1;

  setPreference(String key, Object value){
    if(value.runtimeType == int) {
      _prefs.setInt(key, value as int);
    } else if(value.runtimeType == String) {
      _prefs.setString(key, value as String);
    } else if(value.runtimeType == bool) {
      _prefs.setBool(key, value as bool);
    }
  }
}