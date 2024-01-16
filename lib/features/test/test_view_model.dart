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
  int? _second;
  bool _isStop=false;
  List<Color> _btnColorList = List.generate(4, (index) => ColorConstants.white);

  void isClickAnswChange() {
    _isClickAnsw = !_isClickAnsw;
    notifyListeners();
  }

  void increaseIndex() {
    _index++;
    isClickAnswChange();
    _btnColorList = List.generate(4, (index) => ColorConstants.white);
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

  void imageVisibleChange(int? second) {
    if (second != null) {
      Future<void> timerFunction() async {
        await Future.delayed(Duration(seconds: 1));
        if (second == 0 && !_isStop) {
          _second = second;
          print(_second);
          imageVisibleChange(second - 1);
        }
      }

      timerFunction();
    }
    notifyListeners();
  }


  int get index => _index;

  bool get isClickAnsw => _isClickAnsw;

  int get trueCounter => _trueCounter;

  int get falseCounter => _falseCounter;

  int? get second => _second;

  bool get isStop => _isStop;

  List<Color> get btnColorList => _btnColorList;
}
