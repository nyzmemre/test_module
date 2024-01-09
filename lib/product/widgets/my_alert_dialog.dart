import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../utility/constants/text_constant.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({Key? key,this.solveText, this.tipText }) : super(key: key);
  final String? solveText;
  final String? tipText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: const EdgeInsets.only(left: 25, right: 25),
        title: Center(child: (tipText!=null) ? const Text(TextConstant.tipTEXT): const Text(TextConstant.solveTEXT) ),
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
              (tipText!=null) ? Text(tipText??''): Text(solveText??''),

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
