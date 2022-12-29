import 'package:flutter/material.dart';

class PageStateProvider with ChangeNotifier{
  int _selectedmenuOpt = 0;

  int get selectedMenuOp => _selectedmenuOpt;
  
  set selectedMenuOp(int i){
    _selectedmenuOpt = i;
    notifyListeners();
  }
}