import 'package:flutter/material.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:kartal/kartal.dart';

class MascotView extends StatelessWidget {
  const MascotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Center(
      child: Column(
        children: [
          context.sized.emptySizedHeightBoxHigh,
      Container(
        height: 100,
      width: 300,
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: .5,
              spreadRadius: 1.0,
              color: Colors.black.withOpacity(.12))
        ],

        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
      ),),),
          SizedBox(
              height: 300,
              child: Image.asset('assets/appImage/mascot.png'))
        ],
      ),
    ));
  }
}
