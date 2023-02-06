import 'dart:convert';

import 'package:chat/models/usuario_model.dart';

class LoginResponse {
  bool ok;
  Usuario? usuario;
  String? token;
  String? msg;
  LoginResponse({
    required this.ok,
    this.usuario,
    this.token,
    this.msg
  });

  Map<String, dynamic> toMap() {
    return {
      'ok': ok,
      'usuario': usuario!.toMap(),
      'token': token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      ok: map['ok'] ?? false,
      usuario: map['usuario'] == null? null :  Usuario.fromMap(map['usuario']) ,
      token: map['token'],
      msg: map['msg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) => LoginResponse.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponse(ok: $ok, usuario: $usuario, token: $token)';


}
