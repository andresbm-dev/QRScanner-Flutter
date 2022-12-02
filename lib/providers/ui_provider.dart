

import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  int _menuSelected = 1;

  int get menuSelected => _menuSelected;

  set setMenu(int index){
    _menuSelected = index;
    notifyListeners();
  }
}