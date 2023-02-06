import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _storage = FlutterSecureStorage();

Future<void> guardarToken(String token) async {
  return await _storage.write(key: "token", value: token);
}

Future<void> logOut() async {
  return await _storage.delete(key: "token");
}


Future<String?> hasToken() async {
  return await _storage.read(key: "token");
}