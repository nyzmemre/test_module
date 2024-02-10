import 'package:flutter/material.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';

class LeaderBoardView extends StatelessWidget {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Center(
      child: Text('Leader Board View'),
    ));
  }
}
