import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:test_module/product/utility/constants/color_constants.dart';

import '../../product/widgets/my_scaffold.dart';

class LevelView extends StatelessWidget {
  const LevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> levelList = List.generate(20, (index) => index);
    return MyScaffold(
        child: Center(
      child: ListView.builder(
          itemCount: levelList.length,
          itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              (index==0) ? SizedBox(
                height: context.sized.width*.05,
              ) : Padding(
                padding: EdgeInsets.only(left:(context.sized.height*.04)-3 ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: LinearPercentIndicator(
                      percent: 1,
                      width: 50,
                      animation: true,

                    ),
                  ),
                ),
              ),
              InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    print(index.toString());
                  },
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircularPercentIndicator(
                            progressColor: ColorConstants.trueAnswerCOLOR,
                            radius: context.sized.height*.04,
                            lineWidth: 5,
                            percent: 1,
                            animation: true,
                            center: CircleAvatar(
                              radius: context.sized.width*.08-5,
                              child: Text('${index + 1}'),
                            ),

                          ),
                          Positioned(
                              left: (context.sized.width*.08+10)/1.8,
                              bottom: -7,
                              child: CircleAvatar(
                                backgroundColor: ColorConstants.white,
                                  radius: (context.sized.width*.08-5)/2.5,
                                  child: Icon(Icons.check_circle_sharp, color: ColorConstants.trueAnswerCOLOR,size: (context.sized.width*.08-5)-5,))),
                        ],
                      ),
                      context.sized.emptySizedWidthBoxNormal,
                      Text('${index + 1} . Test')
                    ],
                  )),



            ],
          ),
        );
      }),
    ));
  }
}
