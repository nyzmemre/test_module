import 'package:flutter/material.dart';
import 'package:test_module/features/test/test_questions/attention_questions.dart';

import 'level_model.dart';

class LevelViewModel extends ChangeNotifier{

  List<LevelModel> _list=[
    LevelModel(quesList: AttentionQuestions().attentionQuesList, isCompleted: false),
    LevelModel(quesList: AttentionQuestions().attentionQuesList, isCompleted: false),
    LevelModel(quesList: AttentionQuestions().attentionQuesList, isCompleted: false),
  ];

  isTestCompleted(int trueNum, int levelIndex){
    if(trueNum>_list[levelIndex].quesList.length*.6) {
      _list[levelIndex].isCompleted=true;

    }
    _list[levelIndex].numOfCorrect=trueNum;
    notifyListeners();

  }

  List<LevelModel> get list=> _list;

}