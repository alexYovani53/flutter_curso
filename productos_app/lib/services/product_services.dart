import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/producto.dart';
import 'package:http/http.dart' as http;

class ProductsServices extends ChangeNotifier{
  final String _baseUrl = "flutter-curso-a225a-default-rtdb.firebaseio.com";
  final List<Producto> products = [];
  bool isLoading = true;
  Producto? selectedProduct;

  ProductsServices(){
    loadProducts();
  }

  Future<List<Producto>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url  = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.get(url);

    final Map<String, dynamic> producstMap = json.decode(resp.body);

    producstMap.forEach((key, value) {
      final tempProduct = Producto.fromFromService(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });
    
    isLoading = false;
    notifyListeners();
    return products;
  }
  
}