import '../test_model.dart';
import '../../../product/utility/constants/text_constant.dart';

class AttentionQuestions{


  final List<TestModel> _attentionQuesList=[
    TestModel(quessID: '1114', quessImagePath: 'assets/quessImage/19.jpg', quessCategory: TextConstant.easyCATEGORY, quessGrade: 1, quessAnsw: 'AADS', quessLevel: 2,isResfebe: true),
    TestModel(quessID: "1111", quessImagePath: 'assets/quessImage/2.jpg', quessCategory: TextConstant.easyCATEGORY, quessGrade: 1, quessAnsw: TextConstant.answC, quessLevel: 1),
    TestModel(quessID: "1111", quessImagePath: 'assets/quessImage/1.jpg', quessCategory: TextConstant.easyCATEGORY, quessGrade: 1, quessAnsw: TextConstant.answA, quessLevel: 1, visibleTime: 3, secondImagePath: 'assets/quessImage/1ans.jpg'),
    TestModel(quessID: "1112", quessImagePath: 'assets/quessImage/16.jpg', quessCategory: TextConstant.normalCATEGORY, quessGrade: 2, quessAnsw: TextConstant.answD, quessLevel: 2, solve: 'Degidi de', tip: 'trrekkk'),
    TestModel(quessID: "1113", quessImagePath: 'assets/quessImage/19.jpg', quessCategory: TextConstant.difficultCATEGORY, quessGrade: 3, quessAnsw: TextConstant.answA, quessLevel: 3, tip: 'Yar Bana Bir Eğlence'),
  ];

  List<TestModel> get attentionQuesList=>_attentionQuesList;
}