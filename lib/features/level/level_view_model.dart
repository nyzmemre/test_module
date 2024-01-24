import 'package:flutter/material.dart';
import 'package:test_module/features/level/level_model.dart';
import 'package:test_module/features/test/test_questions/attention_questions.dart';

class LevelViewModel extends ChangeNotifier{

  List<LevelModel> _list=[
    LevelModel(quesList: AttentionQuestions().attentionQuesList, isCompleted: false),
    LevelModel(quesList: AttentionQuestions().attentionQuesList, isCompleted: false),
    LevelModel(quesList: AttentionQuestions().attentionQuesList, isCompleted: false),
  ];

  isTestCompleted(int trueNum, int levelIndex){
    if(trueNum>2) {
      _list[levelIndex].isCompleted=true;
    }
    print(_list);
    notifyListeners();
  }

  List<LevelModel> get list=> _list;

}