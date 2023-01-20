import 'dart:convert';

import 'package:flutter/material.dart';

class Category {
  final IconData icon;
  final String name;
  Category({
    required this.icon,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'icon': icon.codePoint,
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) => Category.fromMap(json.decode(source));

  @override
  String toString() => 'Category(icon: $icon, name: $name)';

}
