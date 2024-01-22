import 'package:flutter/material.dart';

class HomepageViewModel extends ChangeNotifier{
  bool _isCompleted=false;


  void changeCompleted(){
    _isCompleted !=_isCompleted;
    notifyListeners();
  }


  bool get isCompleted=> _isCompleted;
}