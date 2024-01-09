import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../utility/constants/text_constant.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({Key? key,required this.solveText, }) : super(key: key);

  final solveText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: const EdgeInsets.only(left: 25, right: 25),
        title: const Center(child: Text(TextConstant.solvedTEXT)),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: SizedBox(
          width: context.sized.width*.1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Text(solveText)

              ],
            ),
          ),
        ),
        actions: [
          Center(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(TextConstant.exitTEXT),
            ),
          )
        ],

    );
  }
}
