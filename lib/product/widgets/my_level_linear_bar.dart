import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../utility/constants/color_constants.dart';

class MyLevelLinearBar extends StatelessWidget {
  MyLevelLinearBar({Key? key, required this.isCompleted}) : super(key: key);
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: (context.sized.height * .04) - 3),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RotatedBox(
          quarterTurns: -1,
          child: LinearPercentIndicator(
            percent: 1,
            width: 50,
            animation: true,
            progressColor:
            (isCompleted)
                ? ColorConstants.trueAnswerCOLOR
                : ColorConstants.falseAnswerCOLOR,
          ),
        ),
      ),
    );;
  }
}
