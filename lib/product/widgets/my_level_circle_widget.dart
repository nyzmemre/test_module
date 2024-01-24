import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:kartal/kartal.dart';

import '../utility/constants/color_constants.dart';

class MyLevelCircleWidget extends StatelessWidget {
  const MyLevelCircleWidget({Key? key, required this.index, required this.isCompleted}) : super(key: key);
  final int index;
  final bool isCompleted;


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircularPercentIndicator(
          progressColor: (isCompleted) ? ColorConstants.trueAnswerCOLOR : ColorConstants.grey,
          radius: context.sized.height*.04,
          lineWidth: 5,
          percent: 1,
          animation: true,
          center: CircleAvatar(
            radius: context.sized.width*.08-5,
            child: Text('${index + 1}'),
          ),

        ),
        (isCompleted) ? Positioned(
            left: (context.sized.width*.08+10)/1.8,
            bottom: -7,
            child: CircleAvatar(
                backgroundColor: ColorConstants.white,
                radius: (context.sized.width*.08-5)/2.5,
                child: Icon(Icons.check_circle_sharp, color: ColorConstants.trueAnswerCOLOR,size: (context.sized.width*.08-5)-5,))) : SizedBox(),
      ],
    );
  }
}
