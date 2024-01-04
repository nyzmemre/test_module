import 'package:flutter/material.dart';
import 'package:test_module/product/utility/constants/color_constants.dart';
import 'package:test_module/product/utility/constants/list_constants.dart';

class TestViewModel extends ChangeNotifier {
    int _index=0;
    bool _isClickAnsw=false;
    int _trueCounter=0;
    int _falseCounter=0;


    void isClickAnswChange(){
      _isClickAnsw=!_isClickAnsw;

      notifyListeners();
    }

   void increaseIndex(){
      _index++;

      notifyListeners();
    }

    void decreaseIndex(){
      if(_index!=0){
        _index--;
      } else{
        _index=_index;
      }


      notifyListeners();
    }



    void scoreCounter( String userAnswer, int selectedIndex){

      isClickAnswChange();

/*print(selectedIndex);
      if(trueAnswer==userAnswer) {
        _selectedBtnColor=ColorConstants.trueAnswerCOLOR;
        _trueCounter++;
        clickAnswButton(selectedIndex);
      }else{
        _selectedBtnColor=ColorConstants.falseAnswerCOLOR;
        _btnColor=ColorConstants.trueAnswerCOLOR;

        _falseCounter++;
        clickAnswButton(selectedIndex);
      }*/

      /*  if(trueAnswer==userAnswer){
          _trueCounter++;
          clickAnswButton();
          print(_trueCounter);

        }else {
          _falseCounter++;
          clickAnswButton();
          print(_falseCounter);

        }*/

     /* if(trueAnswer==userAnswer){
        _trueCounter++;
        _btnColor=ColorConstants.trueAnswerCOLOR;

        print(_trueCounter);
        clickAnswButton();
      }else {
        _falseCounter++;
        _btnColor=ColorConstants.falseAnswerCOLOR;
        print(_falseCounter);
        clickAnswButton();
      }*/
print(isClickAnsw);

      notifyListeners();
    }


    int get index=> _index;
    bool get isClickAnsw=>_isClickAnsw;
    int get trueCounter=>_trueCounter;
    int get falseCounter=>_falseCounter;
}