import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:test_module/features/level/level_model.dart';
import 'package:test_module/features/test/resfebe_view.dart';
import 'package:test_module/features/test/test_model.dart';
import 'package:test_module/features/test/test_questions/attention_questions.dart';
import 'package:test_module/product/utility/constants/list_constants.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';
import 'package:test_module/product/widgets/my_answer_button.dart';
import 'package:test_module/product/widgets/my_circle_second.dart';
import 'package:test_module/product/widgets/my_index_bar.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:test_module/product/widgets/my_test_true_false_bar.dart';
import 'package:test_module/product/widgets/my_tip_button.dart';

import '../result/result_view.dart';
import 'test_view_model.dart';

class TestView extends StatelessWidget {
  TestView({Key? key, required this.levelModel, required this.testIndex}) : super(key: key);
  final List<LevelModel> levelModel;
  final int testIndex;

 // AttentionQuestions attentionQuestions = AttentionQuestions();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MyScaffold(
        child: Consumer<TestViewModel>(builder: (context, testProvider, _) {
          if (levelModel[testIndex].quesList.length >
              testProvider.index) {
            List<TestModel> testList = levelModel[testIndex].quesList;
            int currentIndex = testProvider.index;

            return SingleChildScrollView(
              child: Padding(
                padding: context.padding.normal,
                child: Column(
                  children: [
                    MyTestTrueFalseBar(trueNum: testProvider.trueCounter, falseNum: testProvider.falseCounter),
                    context.sized.emptySizedHeightBoxLow,
                    (testList[currentIndex].visibleTime != null &&
                            testList[currentIndex].secondImagePath != null && !testProvider.isStop)
                        ? MyCircleSecond(
                            imageSecond: testList[currentIndex].visibleTime!, imageTimeCompletedFunc: testProvider.isStopChange,)
                        : SizedBox(),
                    context.sized.emptySizedHeightBoxLow,
                    context.sized.emptySizedHeightBoxLow,
                    (testProvider.isStop) ? Image.asset(testList[currentIndex].secondImagePath!) : Image.asset(testList[currentIndex].quessImagePath) ,
                    context.sized.emptySizedHeightBoxLow,
                    (testProvider.isClickAnsw)
                        ? MyIndexBar(
                            list: AttentionQuestions().attentionQuesList,
                            index: testProvider.index,
                            arrowFunction: testProvider.decreaseIndex,
                            previousFunction: testProvider.increaseIndex)
                        : SizedBox(),
                    context.sized.emptySizedHeightBoxLow,
                    ///bu kontrolü ekleme sebebim eğer soru saniyeli ise cevap kısmı gelmeden seçeneklere tıklamasını istemememdir.
                    ///ama soru saniyeli değilse seçenekler gelmeli. isStop saniyesi soruda sürekli false olacak.
                    ///bu yüzden sadece isStop yetmedi ve 2 değişken kontrolü kullandım.
                    (testList[currentIndex].visibleTime != null && !testProvider.isStop) ? SizedBox() : (testList[currentIndex].isResfebe!=null && testList[currentIndex].isResfebe!) ? ResfebeView(testList: testList, currentIndex: currentIndex, isTextFormsPassive: testProvider.isClickAnsw,) :answerButtons(testProvider, testList, currentIndex, context),
                    context.sized.emptySizedHeightBoxLow,
                    (testList[currentIndex].tip != null)
                        ? MyTipButton(tipText: testList[currentIndex].tip)
                        : const SizedBox()
                  ],
                ),
              ),
            );
          } else {
            return ResultView(
                trueCounter: testProvider.trueCounter,
                falseCounter: testProvider.falseCounter,
                testIndex: testIndex,
            );
          }
        }),
      ),
    );
  }

  Row answerButtons(TestViewModel testProvider, List<TestModel> testList, int currentIndex, BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          MyAnswerButton(
                            isClick: testProvider.isClickAnsw,
                            buttonName: ListConstants.answerTextList[0],
                            backgroundColor: testProvider.btnColorList[0],
                            onPressed: (){
                              testProvider.scoreCounter(testList[currentIndex].quessAnsw, ListConstants.answerTextList[0], 0);
                            } ,
                          ),
                          context.sized.emptySizedHeightBoxLow,
                          MyAnswerButton(
                              isClick: testProvider.isClickAnsw,
                              buttonName: ListConstants.answerTextList[2],
                              backgroundColor: testProvider.btnColorList[2],
                              onPressed: (){
                                testProvider.scoreCounter(testList[currentIndex].quessAnsw, ListConstants.answerTextList[2], 2);
                              } ,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          MyAnswerButton(
                            isClick: testProvider.isClickAnsw,
                            buttonName: ListConstants.answerTextList[1],
                            backgroundColor: testProvider.btnColorList[1],
                            onPressed: (){
                              testProvider.scoreCounter(testList[currentIndex].quessAnsw, ListConstants.answerTextList[1], 1);
                            } ,
                          ),
                          context.sized.emptySizedHeightBoxLow,
                          MyAnswerButton(
                            isClick: testProvider.isClickAnsw,
                            buttonName: ListConstants.answerTextList[3],
                            backgroundColor: testProvider.btnColorList[3],
                            onPressed: (){
                              testProvider.scoreCounter(testList[currentIndex].quessAnsw, ListConstants.answerTextList[3], 3);
                            } ,
                          ),
                        ],
                      ),
                    ],
                  );
  }


}
