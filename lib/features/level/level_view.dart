import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:test_module/features/test/test_view.dart';
import 'package:test_module/product/utility/constants/color_constants.dart';
import 'package:test_module/product/widgets/level_circle_widget.dart';

import '../../product/widgets/my_scaffold.dart';
import '../test/test_view_model.dart';
import 'level_view_model.dart';

class LevelView extends StatelessWidget {
  const LevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MyScaffold(
        child: Consumer2<TestViewModel, LevelViewModel>(
          builder: (context, testProvider, levelProvider, _) {
            return Center(
              child: ListView.builder(
                  itemCount: levelProvider.list.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [

                          InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>TestView(levelModel: levelProvider.list, testIndex: index)), (route) => false);
                              },
                              child: Row(
                                children: [
                                  LevelCircleWidget(index: index, isCompleted: levelProvider.list[index].isCompleted,),
                                  context.sized.emptySizedWidthBoxNormal,
                                  Text('${index + 1} . Test')
                                ],
                              )),

                           ((levelProvider.list.length-1)==index) ? SizedBox(
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
                                  progressColor: (levelProvider.list[index].isCompleted) ? ColorConstants.trueAnswerCOLOR : ColorConstants.falseAnswerCOLOR,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
            );
          },
        ));
  }


}
