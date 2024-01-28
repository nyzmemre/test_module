import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_module/product/utility/constants/color_constants.dart';
import 'package:test_module/product/utility/constants/list_constants.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';

class TestViewModel extends ChangeNotifier {
  int _index = 0;
  bool _isClickAnsw = false;
  int _trueCounter = 0;
  int _falseCounter = 0;
  bool _isStop = false;
  List<Color> _btnColorList = List.generate(4, (index) => ColorConstants.white);
  List<Color>? _textFormFieldColorList;
  List<String>? _textFormUserAnswer;



  void isClickAnswChange() {
    _isClickAnsw = !_isClickAnsw;
    notifyListeners();
  }

  void increaseIndex() {
    _textFormFieldColorList=null;
    _textFormUserAnswer=null;
    print(_textFormUserAnswer);
    _index++;
    isClickAnswChange();
    _btnColorList = List.generate(4, (index) => ColorConstants.white);

    if (isStop) {
      ///bunu yapma sebebim sonraki indexte saniye bilgisinin olup olmadığını bilmememdir.
      ///eğer saniyeli soru değilse burayı isStop false kalmalıdır.
      isStopChange();
    }
    notifyListeners();
  }

  void decreaseIndex() {
    if (_index != 0) {
      _index--;
    } else {
      _index = _index;
    }

    notifyListeners();
  }

  void scoreCounter(String trueAnswer, String userAnswer, int selectedIndex) {
    isClickAnswChange();
    if (userAnswer == trueAnswer) {
      _trueCounter++;
      _btnColorList[selectedIndex] = ColorConstants.trueAnswerCOLOR;
    } else {
      _falseCounter++;
      _btnColorList[selectedIndex] = ColorConstants.falseAnswerCOLOR;
      int trueIndex = 0;
      switch (trueAnswer) {
        case TextConstant.answB:
          trueIndex = 1;
        case TextConstant.answC:
          trueIndex = 2;
        case TextConstant.answD:
          trueIndex = 3;
          break;
      }
      _btnColorList[trueIndex] = ColorConstants.trueAnswerCOLOR;
    }
    print(_falseCounter);
    notifyListeners();
  }

/*  void resfebeScoreCounter(bool isTrue){
    isClickAnswChange();
    if(isTrue) {
      _trueCounter++;
    } else {
      _falseCounter++;
    }

    notifyListeners();
  }*/
   void resfebeScoreCounter(String userAnswer, String trueAnswer){
    isClickAnswChange();
    if(userAnswer==trueAnswer) {
      _trueCounter++;
    }else {
      _falseCounter++;
    }
    List<String> userAnswerList=userAnswer.split('');
    List<String> trueAnswerList=trueAnswer.split('');
    _textFormUserAnswer=userAnswerList;
    _textFormFieldColorList=List.generate(trueAnswer.length, (index) => Colors.transparent);
    for(int i=0;i<trueAnswerList.length;i++){
     if(userAnswerList[i]==trueAnswerList[i]){
       _textFormFieldColorList![i]=Colors.green;
     }else {
       _textFormFieldColorList![i]=Colors.red;
     }
    }

    notifyListeners();
  }

  void isStopChange() {
    _isStop = !_isStop;
    notifyListeners();
  }

  void clearTestCounters(){
    _trueCounter=0;
    _index=0;
    _falseCounter=0;

    notifyListeners();
  }

  int get index => _index;

  bool get isClickAnsw => _isClickAnsw;

  int get trueCounter => _trueCounter;

  int get falseCounter => _falseCounter;

  bool get isStop => _isStop;

  List<Color> get btnColorList => _btnColorList;
  List<Color>? get textFormFieldColorList => _textFormFieldColorList;
  List<String>? get textFormUserAnswer => _textFormUserAnswer;
}
