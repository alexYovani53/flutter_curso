import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:chat/models/usuario_model.dart';

class UsuariosListResponse {
  bool ok;
  List<Usuario> usuarios;
  UsuariosListResponse({
    required this.ok,
    required this.usuarios,
  });

  Map<String, dynamic> toMap() => {
      'ok': ok,
      'usuarios': usuarios.map((x) => x.toMap()).toList(),
    };


  factory UsuariosListResponse.fromMap(Map<String, dynamic> map) => UsuariosListResponse(
      ok: map['ok'] ?? false,
      usuarios:  List<Usuario>.from(map['usuarios']?.map((x) => Usuario.fromMap(x))),
    );

  String toJson() => json.encode(toMap());

  factory UsuariosListResponse.fromJson(String source) => UsuariosListResponse.fromMap(json.decode(source));

  @override
  String toString() => 'UsuariosListResponse(ok: $ok, usuarios: $usuarios)';

}
