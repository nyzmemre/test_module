import 'dart:async';

import 'package:flutter/material.dart';

class MyCircleSecond extends StatefulWidget {
  MyCircleSecond({Key? key, required this.imageSecond, required this.imageTimeCompletedFunc}) : super(key: key);
  final int imageSecond;
  Function imageTimeCompletedFunc;

  @override
  State<MyCircleSecond> createState() => _MyCircleSecondState();
}

class _MyCircleSecondState extends State<MyCircleSecond> {
  late int _imageSecond;


  @override
  void initState() {
    super.initState();
    _imageSecond = widget.imageSecond;
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(child: Text(_imageSecond.toString()));
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _imageSecond--;

        if (_imageSecond == 0) {
          ///saniye sıfıra gelince fonksiyon çalışacak.
          widget.imageTimeCompletedFunc();
          timer.cancel();

        }
      });
    });
  }
}
