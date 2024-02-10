import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_module/features/test/test_view_model.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:kartal/kartal.dart';

import '../ex_level/level_view.dart';
import '../ex_level/level_view_model.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key, required this.trueCounter, required this.falseCounter, required this.testIndex}) : super(key: key);
  final int trueCounter;
  final int falseCounter;
  final int testIndex;
  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Doğru Sayısı: $trueCounter'),
          context.sized.emptySizedHeightBoxLow,
          Text('Yanlış Sayısı: $falseCounter'),
          ElevatedButton(onPressed: (){

              Provider.of<LevelViewModel>(context, listen: false).isTestCompleted(trueCounter, testIndex);
              Provider.of<TestViewModel>(context, listen: false).clearTestCounters();

            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LevelView()), (route) => false);
          }, child: Text('Anasayfaya Dön'))
        ],
      ),
    ));
  }
}
