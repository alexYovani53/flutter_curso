import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:productos_app/models/producto.dart';
import 'package:http/http.dart' as http;

class ProductsServices extends ChangeNotifier{
  final String _baseUrl = "flutter-curso-a225a-default-rtdb.firebaseio.com";
  final String _apiCloudinary = "api.cloudinary.com";
  String? imageUploaded;
  
  final storage = const FlutterSecureStorage();

  final List<Producto> products = [];
  bool isLoading = true;
  bool isSaving = false;
  Producto? selectedProduct;

  ProductsServices(){
    loadProducts();
  }

  Future<List<Producto>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(
      _baseUrl,
      'productos.json',
      {'auth': await storage.read(key: 'token') ?? ''}
    );
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

  Future saveOrCreateProduct(Producto product) async {
    isSaving = true;
    notifyListeners();
    if (product.id == null) {
      await createProduct(product);
    }else{
      await updateProduct(product);
    }
    
    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Producto product) async {
    final url  = Uri.https(
      _baseUrl,
      'productos/${product.id}.json',
      {'auth': await storage.read(key: 'token') ?? ''}
    );
    await http.put(url, body: product.toJson());
    
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;
    notifyListeners();

    return product.id!;
  }

  Future<String> createProduct(Producto product) async {
    final url = Uri.https(
      _baseUrl,
      'productos.json',
      {'auth': await storage.read(key: 'token') ?? ''}
    );
    final resp = await http.post(url, body: product.toJson());
    final decodeData = json.decode(resp.body);

    if (resp.statusCode == 200) {
      product.id = decodeData["name"];
      products.add(product);
      notifyListeners();
    }
    return '';
  }

  Future updateSelectedProductImage(String path) async {
    imageUploaded = path;
  }

  Future<String?> uploadImage() async {
    if (imageUploaded == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.https(_apiCloudinary, "/v1_1/djizt5mr6/image/upload", {"upload_preset":"cqyubzbu"});
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', imageUploaded!);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode == 200 || resp.statusCode == 201) {
      final dataResponse = json.decode(resp.body);
      imageUploaded = null;
      return dataResponse["secure_url"];
    }
    return null;
  }
}