import 'package:flutter/material.dart';
import 'package:test_module/product/utility/constants/color_constants.dart';
import 'package:test_module/product/utility/constants/list_constants.dart';

class TestViewModel extends ChangeNotifier {
    int _index=0;
    bool _isClickAnsw=false;
    int _trueCounter=0;
    int _falseCounter=0;
    List<Color> bntColorList=List.generate(4, (index) => ColorConstants.white);


    void isClickAnswChange(){
      _isClickAnsw=!_isClickAnsw;
      notifyListeners();
    }

   void increaseIndex(){
      _index++;
      isClickAnswChange();
      bntColorList=List.generate(4, (index) => ColorConstants.white);
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



    void scoreCounter(String trueAnswer, String userAnswer, int selectedIndex){

      isClickAnswChange();
     if(userAnswer==trueAnswer){
       _trueCounter++;
       bntColorList[selectedIndex]=ColorConstants.trueAnswerCOLOR;
     } else{
       _falseCounter++;
       bntColorList[selectedIndex]=ColorConstants.falseAnswerCOLOR;
       int trueIndex=0;
      switch(trueAnswer){
        case 'B':
          trueIndex=1;
        case 'C':
         trueIndex=2;
        case 'D':
          trueIndex=3;
          break;
      }
      bntColorList[trueIndex]=ColorConstants.trueAnswerCOLOR;
     }
     print(_falseCounter);
      notifyListeners();
    }


    int get index=> _index;
    bool get isClickAnsw=>_isClickAnsw;
    int get trueCounter=>_trueCounter;
    int get falseCounter=>_falseCounter;
}