import '../test_model.dart';
import '../../../product/utility/constants/text_constant.dart';

class AttentionQuestions{


  final List<TestModel> _attentionQuesList=[
    TestModel(quessID: "1111", quessImagePath: 'assets/quessImage/1.jpg', quessCategory: TextConstant.easyCATEGORY, quessGrade: '1', quessAnsw: 'C', quessLevel: 1),
    TestModel(quessID: "1112", quessImagePath: 'assets/quessImage/16.jpg', quessCategory: TextConstant.normalCATEGORY, quessGrade: '2', quessAnsw: 'D', quessLevel: 2),
    TestModel(quessID: "1113", quessImagePath: 'assets/quessImage/19.jpg', quessCategory: TextConstant.difficultCATEGORY, quessGrade: '3', quessAnsw: 'A', quessLevel: 3),
  ];

  List<TestModel> get attentionQuesList=>_attentionQuesList;
}