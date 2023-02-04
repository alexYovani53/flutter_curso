import 'dart:convert';

class Usuario {
  late bool online;
  late String email;
  late String nombre;
  late String uid;
  Usuario({
    required this.online,
    required this.email,
    required this.nombre,
    required this.uid,
  });

  Usuario copyWith({
    bool? online,
    String? email,
    String? nombre,
    String? uid,
  }) {
    return Usuario(
      online: online ?? this.online,
      email: email ?? this.email,
      nombre: nombre ?? this.nombre,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'online': online,
      'email': email,
      'nombre': nombre,
      'uid': uid,
    };
  }

  Usuario.empty();

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      online: map['online'] ?? false,
      email: map['email'] ?? '',
      nombre: map['nombre'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  String getIniciales() => this.nombre.substring(0,2).toUpperCase();

  factory Usuario.fromJson(String source) => Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(online: $online, email: $email, nombre: $nombre, uid: $uid)';
  }
}
