import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

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
              return Column(
                      children: [
                        Image.asset(imageList[testProvider.index]),
                        context.sized.emptySizedHeightBoxLow,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                answButton(context, 'A', testProvider.index,testProvider.increaseIndex, trueAnswer),
                                context.sized.emptySizedHeightBoxLow,
                                answButton(context, 'B', testProvider.index,testProvider.increaseIndex, trueAnswer),
                              ],
                            ),
                            Column(
                              children: [
                                answButton(context, 'C', testProvider.index, testProvider.increaseIndex,trueAnswer),
                                context.sized.emptySizedHeightBoxLow,
                                answButton(context, 'D', testProvider.index, testProvider.increaseIndex,trueAnswer),
                              ],
                            ),
                          ],
                        )

                      ],
                    );

            }
        ),
      ),
    );
  }

  Container answButton(BuildContext context, String buttonName, int index, Function func, List<String> trueAnswer) {
    return Container(
                       width: context.sized.width * .4,
                       child: ElevatedButton(onPressed: (){
                         if(buttonName==trueAnswer[index]){
                           print('doğru');
                           func();

                         } else {
                           print('yanlış');
                           func();                         }
                       }, child: Text(buttonName)));
  }


}
