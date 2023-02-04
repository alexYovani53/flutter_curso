import 'package:chat/models/mensaje.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/utils/app_config.dart';
import 'package:chat/utils/app_secure_storage.dart';
import 'package:flutter/material.dart';

import 'package:chat/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {

  Usuario user;
  ChatService({
    required this.user,
  });

  Future<List<MensajeModel>> getMensajesChat() async {
    final token = await hasToken();
    final headers = {
      'Authorization': token ?? ""
    };


    final uri = Uri.http(Configs.apiUrl, "${Configs.mensajesPath}/${user.uid}" );
    final resp = await http.get(uri, headers: headers);

    print(uri.path);

    if (resp.statusCode == 200) {
      final listMsg = MensajesResponse.fromJson(resp.body);
      print(listMsg.mensajes);
      return listMsg.mensajes;
    }
    return [];
  }
  
}
