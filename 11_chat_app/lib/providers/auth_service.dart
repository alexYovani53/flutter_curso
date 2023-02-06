

import 'dart:convert';

import 'package:chat/models/login_response.dart';
import 'package:chat/models/usuario_model.dart';
import 'package:chat/utils/app_config.dart';
import 'package:chat/utils/app_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier{

  bool _autenticando = false;
  bool get autenticando => _autenticando;

  Usuario usuario = Usuario.empty();

  set autenticando (bool state) {
    this._autenticando = state;
    notifyListeners();
  }

  Future<LoginResponse> login(String email, String password) async {
    
    final data = {
      'email':email,
      'password': password
    };

    final uri = Uri.http(Configs.apiUrl, Configs.loginPath);
    final resp = await http.post(uri, body: jsonEncode(data), headers: {'Content-Type':'application/json'})
      .timeout(const Duration(seconds: 3), onTimeout: () {
        return http.Response( json.encode({"ok":false, "msg":'Time out, servidor fuera de linea'}), 408);
      });
    final loginData = LoginResponse.fromJson(resp.body);

    if (resp.statusCode == 200) {
      await guardarToken(loginData.token!);
      usuario = loginData.usuario!;
    }

    return loginData;
  }
  Future<LoginResponse> singUp(String name, String email, String password) async {
    
    final data = {
      'nombre':name,
      'email':email,
      'password': password
    };

    final uri = Uri.http(Configs.apiUrl, Configs.registerPath);
    final resp = await http.post(uri, body: jsonEncode(data), headers: {'Content-Type':'application/json'})
      .timeout(const Duration(seconds: 3), onTimeout: () {
        return http.Response( json.encode({"ok":false, "msg":'Time out, servidor fuera de linea'}), 408);
      });
    
    print(resp);
    final loginData = LoginResponse.fromJson(resp.body);

    if (resp.statusCode == 200) {
      usuario = loginData.usuario!;
      await guardarToken(loginData.token!);
    }

    return loginData;
  }

  Future<bool> hasTokenValidate() async {
    final token = await hasToken();

    if (token == null) {
      return false;
    }

    final uri = Uri.http(Configs.apiUrl, Configs.renewPath);
    final resp = await http.get(uri, headers: {'Content-Type':'application/json', 'Authorization': token})
      .timeout(const Duration(seconds: 3), onTimeout: () {
        return http.Response( json.encode({"ok":false, "msg":'Time out, servidor fuera de linea'}), 408);
      });
    
    final loginData = LoginResponse.fromJson(resp.body);

    if (resp.statusCode == 200) {
      usuario = loginData.usuario!;
      await guardarToken(loginData.token!);
      return true;
    }

    return false;
  }

}