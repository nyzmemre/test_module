import 'package:flutter/material.dart';
import 'package:test_module/product/utility/constants/color_constants.dart';

class TestViewModel extends ChangeNotifier {
    int _index=0;
    bool _isClickAnsw=false;
    Color _btnColor=Colors.white;
    int _trueCounter=0;
    int _falseCounter=0;

    void clickAnswButton(){
      _isClickAnsw =! _isClickAnsw;
      notifyListeners();
    }

   void increaseIndex(){
      _index++;
      clickAnswButton();
      btnColorClear();
      notifyListeners();
    }

    void decreaseIndex(){
      if(_index!=0){
        _index--;
      } else{
        _index=_index;
      }

      clickAnswButton();
      btnColorClear();
      notifyListeners();
    }

    void btnColorClear(){
      _btnColor=Colors.white;
      notifyListeners();
    }

    void scoreCounter(String trueAnswer, String userAnswer, int selectedIndex){
      if(trueAnswer==userAnswer){
        _trueCounter++;
        _btnColor=ColorConstants.trueAnswerCOLOR;

        print(_trueCounter);
        clickAnswButton();
      }else {
        _falseCounter++;
        _btnColor=ColorConstants.falseAnswerCOLOR;
        print(_falseCounter);
        clickAnswButton();
      }
      notifyListeners();
    }


    int get index=> _index;
    bool get isClickAnsw=> _isClickAnsw;
    Color get btnColor=>_btnColor;
    int get trueCounter=>_trueCounter;
    int get falseCounter=>_falseCounter;
}