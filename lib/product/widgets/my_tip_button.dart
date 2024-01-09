import 'package:flutter/material.dart';

import 'my_alert_dialog.dart';

class MyTipButton extends StatelessWidget {
  const MyTipButton({Key? key, this.tipText}) : super(key: key);
  final String? tipText;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      showDialog(context: context, builder: (_)=> MyAlertDialog(tipText: tipText ?? ''));
    }, icon: const Icon(Icons.tips_and_updates_outlined));
  }
}
