import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/product/widgets/my_speech_bubble.dart';

class MyMascotWidget extends StatelessWidget {
  const MyMascotWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.normal,
      child: CustomPaint(
        painter: MySpeecBubble(),
        child: Container(
          margin: context.padding.normal,
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              )),
        ),
      ),
    );;
  }
}
