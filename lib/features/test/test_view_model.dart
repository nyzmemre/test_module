import 'package:flutter/material.dart';

class TestViewModel extends ChangeNotifier {
    int index=0;

   void increaseIndex(){
      index++;
      notifyListeners();
    }
}