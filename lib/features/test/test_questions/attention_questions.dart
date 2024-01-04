import 'package:test_module/features/test/test_model.dart';

class AttentionQuestions{
  final List<TestModel> _attentionQuesList=[
    TestModel(quessID: "1111", quessImagePath: 'assets/quessImage/1.jpg', quessCategory: 'Basit', quessGrade: '1', quessAnsw: 'C', quessLevel: 1),
    TestModel(quessID: "1112", quessImagePath: 'assets/quessImage/16.jpg', quessCategory: 'Orta', quessGrade: '2', quessAnsw: 'D', quessLevel: 2),
    TestModel(quessID: "1113", quessImagePath: 'assets/quessImage/19.jpg', quessCategory: 'Yüksek', quessGrade: '3', quessAnsw: 'A', quessLevel: 3),
  ];

  List<TestModel> get attentionQuesList=>_attentionQuesList;
}