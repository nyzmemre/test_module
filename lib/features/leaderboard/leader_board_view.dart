import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/product/utility/constants/image_paths.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';

class LeaderBoardView extends StatelessWidget {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Center(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImagePaths.leaderBoardBgImagePath),opacity: .2, fit: BoxFit.fill)
        ),
        child: Padding(
          padding: context.padding.normal,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: context.sized.width*.1,
                      child: Center(child: Image.asset(ImagePaths.cupImagePath),)),
                  context.sized.emptySizedWidthBoxNormal,
                  Text('En Yüksek Puanlar',style: TextStyle(fontSize: 30))
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, int index) {
                  return Container(
                    margin: context.padding.low,
                      padding: context.padding.normal,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(ImagePaths.levelWideButtonBgPath), fit: BoxFit.fill)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('İsim $index', textAlign: TextAlign.center, style: TextStyle(fontSize: 30),),
                          Text('Puan: 35', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),

                        ],
                      ));
                }),
              ),
            ],
          ),
        ),
      )
      ),
    );
  }
}
