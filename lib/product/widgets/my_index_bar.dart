import 'package:flutter/material.dart';

import '../../features/test/test_model.dart';
import '../utility/constants/text_constant.dart';
import 'my_alert_dialog.dart';

class MyIndexBar extends StatelessWidget {
  const MyIndexBar({Key? key, required this.list, required this.index, required this.arrowFunction, required this.previousFunction}) : super(key: key);
  final List<TestModel> list;
  final int index;
  final Function arrowFunction;
  final Function previousFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed:(){
          arrowFunction();
        }, icon: const Icon(Icons.arrow_back_ios_new)),
        ElevatedButton(onPressed: (list.isNotEmpty && list[index].solve!=null) ? (){
          showDialog(context: context, builder: (_)=>MyAlertDialog( solveText: list[index].solve));
        } : null, child: const Text(TextConstant.solvedTEXT)),
        IconButton(onPressed: (){
          previousFunction();
        }, icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
