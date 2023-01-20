import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = "identitytoolkit.googleapis.com";
  final String _firebaseToken = "AIzaSyDzikpddysRmOxUjUL0Yjs-uymGH4QPDC8";

  final storage = const FlutterSecureStorage();

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken":true
    };

    final url = Uri.https(_baseUrl, "/v1/accounts:signInWithPassword", {"key": _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      // Guardar token en algun lugar
      await storage.write(key: 'token', value: decodeResp["idToken"]);
      return null;
    }
    return decodeResp['error']['message'];
  }

  // Si se devuelve algo es un error, null es que todo salio bien
  Future<String?> createuser(String email, String password) async {
    final Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };

    final url = Uri.https(_baseUrl, "/v1/accounts:signUp", {"key": _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodeResp["idToken"]);
      return null;
    }

    return decodeResp['error']['message'];
  }

  Future logout() async {
    await storage.delete(key: 'token');
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
