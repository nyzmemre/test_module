import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

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
                              answButton(context,testProvider.isClickAnsw, 'A', testProvider.index,testProvider.clickAnswButton, trueAnswer),
                              context.sized.emptySizedHeightBoxLow,
                              answButton(context,testProvider.isClickAnsw, 'B', testProvider.index,testProvider.clickAnswButton, trueAnswer),
                            ],
                          ),
                          Column(
                            children: [
                              answButton(context,testProvider.isClickAnsw, 'C', testProvider.index, testProvider.clickAnswButton,trueAnswer),
                              context.sized.emptySizedHeightBoxLow,
                              answButton(context,testProvider.isClickAnsw, 'D', testProvider.index, testProvider.clickAnswButton,trueAnswer),
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

  Container answButton(BuildContext context,bool isClick, String buttonName, int index, Function func, List<String> trueAnswer) {
    return Container(
                       width: context.sized.width * .4,
                       child: ElevatedButton(onPressed: (isClick)? (){}: (){
                         if(buttonName==trueAnswer[index]){
                           print('doğru');
                           func();
                         } else {
                           func();
                           print('yanlış');
                         }
                       }, child: Text(buttonName)));
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
