import 'package:flutter/material.dart';
import 'package:productos_app/models/producto.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey();
  Producto producto;

  ProductFormProvider({
    required this.producto,
  });

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }

  updateAvailability( bool value){
    producto.available = value;
    notifyListeners();
  }
}
