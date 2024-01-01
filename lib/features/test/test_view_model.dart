import 'package:flutter/material.dart';

class TestViewModel extends ChangeNotifier {
    int _index=0;
    bool _isClickAnsw=false;

    void clickAnswButton(){
      _isClickAnsw =! _isClickAnsw;
      notifyListeners();
    }

   void increaseIndex(){
      _index++;
      clickAnswButton();
      notifyListeners();
    }

    void decreaseIndex(){
      if(_index!=0){
        _index--;
      } else{
        _index=_index;
      }
      clickAnswButton();
      notifyListeners();
    }

    int get index=> _index;
    bool get isClickAnsw=> _isClickAnsw;
}