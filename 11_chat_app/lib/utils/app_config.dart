import 'dart:io';

class Configs{
  // static String apiUrl = Platform.isAndroid ? '10.0.2.2:3000' : 'localhost:3000';
  static String apiUrl = Platform.isAndroid ? '192.168.1.160:3000' : 'localhost:3000';
  static String loginPath = '/api/login';
  static String usuarioaPath = '/api/usuarios';
  static String mensajesPath = '/api/mensajes';
  static String registerPath= '/api/login/new';
  static String renewPath= '/api/login/renew';
  // static String socketUrl = Platform.isAndroid ? 'http://10.0.2.2:3000' : 'http://localhost:3000';
  static String socketUrl = 'http://192.168.1.160:3000';
}