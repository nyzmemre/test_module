import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../features/test/test_view_model.dart';

class MyAnswerButton extends StatelessWidget {
  MyAnswerButton(
      {Key? key,
      required this.isClick,
      required this.buttonName,
        required this.backgroundColor,
        required this.onPressed})
      : super(key: key);
  final bool isClick;
  final String buttonName;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.sized.width * .4,
        child: ElevatedButton(
          onPressed: (isClick)
              ? () {}
              : onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor:backgroundColor),
          child: Text(
            buttonName,
            style: const TextStyle(color: Colors.black),
          ),
        ));
  }
}
