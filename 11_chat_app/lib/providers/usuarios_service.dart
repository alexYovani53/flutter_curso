import 'dart:convert';

import 'package:chat/models/usuario_model.dart';
import 'package:chat/models/usuarios_list_response.dart';
import 'package:chat/utils/app_config.dart';
import 'package:chat/utils/app_secure_storage.dart';
import 'package:http/http.dart' as http;

class UsuariosService{

  Future<List<Usuario>> getUsuarios() async {

    final token  = await hasToken();

    final headers = {
      'Content-Type':"application/json",
      'Authorization': token ?? ""
    };

    final uri = Uri.http(Configs.apiUrl, Configs.usuarioaPath);
    final resp = await http.get(uri, headers: headers)
      .timeout(const Duration(seconds: 3), onTimeout: () {
        return http.Response( json.encode({"ok":false, "msg":'Time out, servidor fuera de linea'}), 408);
      });


    if (resp.statusCode == 200) {
      final list = UsuariosListResponse.fromJson(resp.body);
      print(list.usuarios);
      return list.usuarios;
    }

    return [];
  }

}