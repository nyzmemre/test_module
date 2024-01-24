import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../utility/constants/text_constant.dart';

class MyTestTrueFalseBar extends StatelessWidget {
  const MyTestTrueFalseBar({Key? key, required this.trueNum, required this.falseNum}) : super(key: key);
  final int trueNum;
  final int falseNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            '${TextConstant.trueTEXT}: ${trueNum}'),
        context.sized.emptySizedWidthBoxNormal,
        Text(
            '${TextConstant.falseTEXT}: ${falseNum}'),
      ],
    );
  }
}
