import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> answNameList=['A', 'B', 'C', 'D'];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: context.padding.normal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/quessImage/1.jpg'),
               context.sized.emptySizedHeightBoxLow,
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Column(
                     children: [
                       Container(
                           width: context.sized.width * .4,
                           child: ElevatedButton(onPressed: (){}, child: Text('A'))),
                       context.sized.emptySizedHeightBoxLow,
                       Container(
                           width: context.sized.width * .4,
                           child: ElevatedButton(onPressed: (){}, child: Text('B'))),
                     ],
                   ),
                   Column(
                     children: [
                       Container(
                           width: context.sized.width * .4,
                           child: ElevatedButton(onPressed: (){}, child: Text('C'))),
                       context.sized.emptySizedHeightBoxLow,
                       Container(
                           width: context.sized.width * .4,
                           child: ElevatedButton(onPressed: (){}, child: Text('D'))),
                     ],
                   ),
                 ],
               )

              ],
            ),
          ),
        ),
      ),
    );
  }


}
