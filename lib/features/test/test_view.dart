import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:test_module/features/test/test_model.dart';
import 'package:test_module/features/test/test_questions/attention_questions.dart';
import 'package:test_module/product/utility/constants/list_constants.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';
import 'package:test_module/product/widgets/my_circle_second.dart';
import 'package:test_module/product/widgets/my_index_bar.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:test_module/product/widgets/my_tip_button.dart';

import '../result/result_view.dart';
import 'test_view_model.dart';

class TestView extends StatelessWidget {
  TestView({Key? key}) : super(key: key);

  AttentionQuestions attentionQuestions = AttentionQuestions();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MyScaffold(
        child: Consumer<TestViewModel>(builder: (context, testProvider, _) {
          if (attentionQuestions.attentionQuesList.length >
              testProvider.index) {
            List<TestModel> testList = attentionQuestions.attentionQuesList;
            int currentIndex = testProvider.index;

            return SingleChildScrollView(
              child: Padding(
                padding: context.padding.normal,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            '${TextConstant.trueTEXT}: ${testProvider.trueCounter}'),
                        context.sized.emptySizedWidthBoxNormal,
                        Text(
                            '${TextConstant.falseTEXT}: ${testProvider.falseCounter}'),
                      ],
                    ),
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
                    (testList[currentIndex].visibleTime != null && !testProvider.isStop) ? SizedBox() : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            answButton(
                                context,
                                testProvider.isClickAnsw,
                                testList[currentIndex].quessAnsw,
                                ListConstants.answerTextList[0],
                                0),
                            context.sized.emptySizedHeightBoxLow,
                            answButton(
                                context,
                                testProvider.isClickAnsw,
                                testList[currentIndex].quessAnsw,
                                ListConstants.answerTextList[2],
                                2),
                          ],
                        ),
                        Column(
                          children: [
                            answButton(
                                context,
                                testProvider.isClickAnsw,
                                testList[currentIndex].quessAnsw,
                                ListConstants.answerTextList[1],
                                1),
                            context.sized.emptySizedHeightBoxLow,
                            answButton(
                                context,
                                testProvider.isClickAnsw,
                                testList[currentIndex].quessAnsw,
                                ListConstants.answerTextList[3],
                                3),
                          ],
                        ),
                      ],
                    ),
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
                falseCounter: testProvider.falseCounter);
          }
        }),
      ),
    );
  }

  Container answButton(
    BuildContext context,
    bool isClick,
    String trueAnswer,
    String buttonName,
    int selectedIndex,
  ) {
    return Container(
        width: context.sized.width * .4,
        child: ElevatedButton(
          onPressed: (isClick)
              ? () {}
              : () {
                  Provider.of<TestViewModel>(context, listen: false)
                      .scoreCounter(trueAnswer, buttonName, selectedIndex);
                },
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  Provider.of<TestViewModel>(context, listen: false)
                      .btnColorList[selectedIndex]),
          child: Text(
            buttonName,
            style: const TextStyle(color: Colors.black),
          ),
        ));
  }
}
