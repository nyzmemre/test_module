import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:test_module/features/test/test_view.dart';
import 'package:test_module/product/utility/constants/color_constants.dart';
import 'package:test_module/product/widgets/my_level_circle_widget.dart';
import 'package:test_module/product/widgets/my_level_linear_bar.dart';

import '../../product/widgets/my_scaffold.dart';
import '../test/test_view_model.dart';
import 'level_view_model.dart';

class LevelView extends StatelessWidget {
  const LevelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Consumer2<TestViewModel, LevelViewModel>(
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
                          ///testin açılması için testin önceden tamamlanmış olması,
                          ///indexinin sıfır olması veya
                          ///önceki testin tamamlanmış olması gerekir.
                          ///bu sıralama önemlidir. yoksa index hatası verir (index-1 koşulu 0 iken eksi olacağı için)
                          onTap: (levelProvider.list[index].isCompleted ||
                                  index == 0 ||
                                  levelProvider.list[index - 1].isCompleted)
                              ? () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => TestView(
                                              levelModel: levelProvider.list,
                                              testIndex: index)),
                                      (route) => false);
                                }
                              : () {},
                          child: Row(
                            children: [
                              MyLevelCircleWidget(
                                index: index,
                                isCompleted:
                                    levelProvider.list[index].isCompleted,
                              ),
                              context.sized.emptySizedWidthBoxNormal,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${index + 1} . Test'),
                                  (levelProvider.list[index].numOfCorrect!=null) ? Text('Son Çözüm Doğru Sayısı: ${levelProvider.list[index].numOfCorrect}') : SizedBox()
                                ],
                              ),
                              context.sized.emptySizedWidthBoxNormal,

                            ],
                          )),
                      ((levelProvider.list.length - 1) == index)
                          ? SizedBox(
                              height: context.sized.width * .05,
                            )
                          : MyLevelLinearBar(isCompleted: levelProvider.list[index].isCompleted),
                    ],
                  ),
                );
              }),
        );
      },
    ));
  }


}
