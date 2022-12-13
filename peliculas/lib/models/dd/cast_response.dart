import 'cast.dart';

class CastREsponse {
  int? id;
  List<Cast> cast;
  CastREsponse({this.id, required this.cast});

  factory CastREsponse.fromJson(Map<String, dynamic> json) => CastREsponse(
        id: json['id'] as int?,
        cast: (json['cast'] as List<dynamic>).map((e) => Cast.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() => {'id': id, 'cast': cast.map((e) => e.toJson()).toList()};
}
