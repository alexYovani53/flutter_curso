import 'dart:convert';

class MensajeModel {
  String de;
  String para;
  String mensaje;
  String cheatedAt;
  String updateAt;
  MensajeModel({
    required this.de,
    required this.para,
    required this.mensaje,
    required this.cheatedAt,
    required this.updateAt,
  });


  Map<String, dynamic> toMap() {
    return {
      'de': de,
      'para': para,
      'mensaje': mensaje,
      'cheatedAt': cheatedAt,
      'updateAt': updateAt,
    };
  }

  factory MensajeModel.fromMap(Map<String, dynamic> map) {
    return MensajeModel(
      de: map['de'] ?? '',
      para: map['para'] ?? '',
      mensaje: map['mensaje'] ?? '',
      cheatedAt: map['cheatedAt'] ?? '',
      updateAt: map['updateAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MensajeModel.fromJson(String source) => MensajeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MensajeModel(de: $de, para: $para, mensaje: $mensaje, cheatedAt: $cheatedAt, updateAt: $updateAt)';
  }

  
}
