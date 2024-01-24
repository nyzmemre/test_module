import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../features/test/test_view_model.dart';

class MyAnswerButton extends StatelessWidget {
  MyAnswerButton(
      {Key? key,
      required this.isClick,
      required this.trueAnswer,
      required this.buttonName,
      required this.selectedIndex})
      : super(key: key);
  final bool isClick;
  final String trueAnswer;
  final String buttonName;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
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
