import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScanModel {
  int? id;
  String tipo;
  String valor;
  
  ScanModel({
    this.id,
    this.tipo = "",
    required this.valor,
  }){
    tipo = valor.contains("http")
      ? tipo = "http"
      : tipo = "geo";
  }

  ScanModel copyWith({
    int? id,
    String? tipo,
    String? valor,
  }) {
    return ScanModel(
      id: id ?? this.id,
      tipo: tipo ?? this.tipo,
      valor: valor ?? this.valor,
    );
  }

  Map<String, dynamic> toMap() =>  {
      'tipo': tipo,
      'valor': valor,
    };
  
  LatLng getLatLng(){
    final latLng = valor.substring(4).split(",");
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);
    return LatLng(lat, lng);
  }

  factory ScanModel.fromMap(Map<String, dynamic> map) {
    return ScanModel(
      id: map['id']?.toInt() ?? 0,
      tipo: map['tipo'] ?? '',
      valor: map['valor'] ?? '',
    );
  }

  factory ScanModel.fromJson(String source) => ScanModel.fromMap(json.decode(source));

  @override
  String toString() => 'ScanModel(id: $id, tipo: $tipo, valor: $valor)';

}
