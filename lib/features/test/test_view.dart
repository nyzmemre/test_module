import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:test_module/product/utility/constants/color_constants.dart';

import '../result/result_view.dart';
import 'test_view_model.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> answNameList=['A', 'B', 'C','D'];
    List<String> imageList=['assets/quessImage/1.jpg','assets/quessImage/16.jpg','assets/quessImage/19.jpg'];
    List<String> trueAnswer=['C', 'D','A'];
    return SafeArea(
      child: Scaffold(
        body: Consumer<TestViewModel>(
          builder: (context, testProvider, _)
            {
              if(imageList.length>testProvider.index)
                {
                  return Column(
                    children: [
                      Image.asset(imageList[testProvider.index]),
                      context.sized.emptySizedHeightBoxLow,
                      (testProvider.isClickAnsw) ? indexBar( testProvider.decreaseIndex, testProvider.increaseIndex) : SizedBox(),
                      context.sized.emptySizedHeightBoxLow,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              answButton(context,testProvider.isClickAnsw, 'A', testProvider.index,testProvider.scoreCounter, trueAnswer,testProvider.btnColor),
                              context.sized.emptySizedHeightBoxLow,
                              answButton(context,testProvider.isClickAnsw, 'B', testProvider.index,testProvider.scoreCounter, trueAnswer,testProvider.btnColor),
                            ],
                          ),
                          Column(
                            children: [
                              answButton(context,testProvider.isClickAnsw, 'C', testProvider.index, testProvider.scoreCounter,trueAnswer,testProvider.btnColor),
                              context.sized.emptySizedHeightBoxLow,
                              answButton(context,testProvider.isClickAnsw, 'D', testProvider.index, testProvider.scoreCounter,trueAnswer,testProvider.btnColor),
                            ],
                          ),
                        ],
                      )

                    ],
                  );
                } else{
                return ResultView();
              }


            }
        ),
      ),
    );
  }

  Container answButton(BuildContext context, bool isClick, String buttonName, int index, Function(String, String)  func, List<String> trueAnswer, Color btnColor) {
    return Container(
                       width: context.sized.width * .4,
                       child: ElevatedButton(onPressed: (isClick)? (){}: (){
                        func(buttonName, trueAnswer[index]);
                       }, child: Text(buttonName, style: TextStyle(color: (isClick) ? Colors.white : Colors.black),),
                       style: ElevatedButton.styleFrom(
                         backgroundColor: btnColor

                       ),
                       ));
  }

  Widget indexBar(Function arrowFunction, Function previousFunction){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed:(){
          arrowFunction();
        }, icon: Icon(Icons.arrow_back_ios_new)),
        ElevatedButton(onPressed: (){}, child: Text('Çözüm')),
        IconButton(onPressed: (){
          previousFunction();
        }, icon: Icon(Icons.arrow_forward_ios)),


      ],
    );
  }


}
