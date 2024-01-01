import 'package:flutter/material.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Text('Result Screen'));
  }
}
