import 'package:flutter/material.dart';

class LoginFromProvider extends ChangeNotifier{
  
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){
    print("$email - $password");
    return formState.currentState?.validate() ?? false;
  }

}