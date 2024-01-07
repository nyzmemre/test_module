import 'package:flutter/material.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:kartal/kartal.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key, required this.trueCounter, required this.falseCounter}) : super(key: key);
  final int trueCounter;
  final int falseCounter;
  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Doğru Sayısı: $trueCounter'),
          context.sized.emptySizedHeightBoxLow,
          Text('Yanlış Sayısı: $falseCounter'),
        ],
      ),
    ));
  }
}
