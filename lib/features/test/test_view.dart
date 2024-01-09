import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:test_module/features/test/test_questions/attention_questions.dart';
import 'package:test_module/product/utility/constants/color_constants.dart';
import 'package:test_module/product/utility/constants/list_constants.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';
import 'package:test_module/product/widgets/my_index_bar.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:test_module/product/widgets/my_tip_button.dart';

import '../result/result_view.dart';
import 'test_view_model.dart';

class TestView extends StatelessWidget {
   TestView({Key? key}) : super(key: key);

  AttentionQuestions attentionQuestions=AttentionQuestions();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: MyScaffold(
        child: Consumer<TestViewModel>(
          builder: (context, testProvider, _)
            {
              if(attentionQuestions.attentionQuesList.length>testProvider.index)
                {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: context.padding.normal,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${TextConstant.trueTEXT}: ${testProvider.trueCounter}'),
                              context.sized.emptySizedWidthBoxNormal,
                              Text('${TextConstant.falseTEXT}: ${testProvider.falseCounter}'),
                            ],
                          ),
                          context.sized.emptySizedHeightBoxLow,
                          context.sized.emptySizedHeightBoxLow,
                          Image.asset(attentionQuestions.attentionQuesList[testProvider.index].quessImagePath),
                          context.sized.emptySizedHeightBoxLow,
                          (testProvider.isClickAnsw) ? MyIndexBar(list: AttentionQuestions().attentionQuesList, index: testProvider.index, arrowFunction: testProvider.decreaseIndex, previousFunction: testProvider.increaseIndex) : SizedBox(),
                          context.sized.emptySizedHeightBoxLow,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  answButton(context, testProvider.isClickAnsw, attentionQuestions.attentionQuesList[testProvider.index].quessAnsw,ListConstants.answerTextList[0], 0),
                                  context.sized.emptySizedHeightBoxLow,
                                  answButton(context, testProvider.isClickAnsw, attentionQuestions.attentionQuesList[testProvider.index].quessAnsw,ListConstants.answerTextList[2], 2),
                                ],
                              ),
                              Column(
                                children: [
                                  answButton(context, testProvider.isClickAnsw, attentionQuestions.attentionQuesList[testProvider.index].quessAnsw,ListConstants.answerTextList[1], 1),
                                  context.sized.emptySizedHeightBoxLow,
                                  answButton(context, testProvider.isClickAnsw, attentionQuestions.attentionQuesList[testProvider.index].quessAnsw,ListConstants.answerTextList[3], 3),
                                ],
                              ),
                            ],
                          ),
                          context.sized.emptySizedHeightBoxLow,
                          (attentionQuestions.attentionQuesList[testProvider.index].tip != null) ? MyTipButton(tipText: attentionQuestions.attentionQuesList[testProvider.index].tip) : SizedBox()


                        ],
                      ),
                    ),
                  );
                } else{
                return ResultView(trueCounter: testProvider.trueCounter, falseCounter: testProvider.falseCounter);
              }


            }
        ),
      ),
    );
  }


  Container answButton(BuildContext context, bool isClick, String trueAnswer,String buttonName, int selectedIndex,) {

    return Container(
                       width: context.sized.width * .4,
                       child: ElevatedButton(onPressed: (isClick)? (){}: (){
                        Provider.of<TestViewModel>(context, listen: false).scoreCounter(trueAnswer,buttonName, selectedIndex);
                       }, child: Text(buttonName, style: TextStyle(color: Colors.black),),
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Provider.of<TestViewModel>(context, listen: false).btnColorList[selectedIndex]

                       ),
                       ));
  }





}
