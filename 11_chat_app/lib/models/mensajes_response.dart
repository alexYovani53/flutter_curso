import 'dart:convert';


import 'package:chat/models/mensaje.dart';

class MensajesResponse {
  bool ok;
  List<MensajeModel> mensajes;
  MensajesResponse({
    required this.ok,
    required this.mensajes,
  });

  Map<String, dynamic> toMap() {
    return {
      'ok': ok,
      'mensajes': mensajes.map((x) => x.toMap()).toList(),
    };
  }

  factory MensajesResponse.fromMap(Map<String, dynamic> map) {
    return MensajesResponse(
      ok: map['ok'] ?? false,
      mensajes: List<MensajeModel>.from(map['mensajes']?.map((x) => MensajeModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MensajesResponse.fromJson(String source) => MensajesResponse.fromMap(json.decode(source));

  @override
  String toString() => 'MensajesResponse(ok: $ok, mensajes: $mensajes)';
}
