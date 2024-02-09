import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/product/utility/constants/image_paths.dart';

class LevelMapView extends StatelessWidget {
  const LevelMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<bool> _isLock=[false, false, true,true,true,true,true,true,true,true,];
    return SafeArea(
        child: Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: 10,
          itemBuilder: (context, int index) {
            return SizedBox(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            ImagePaths.levelImagePath+'level_bg.png'))),
                child: Padding(
                  padding: context.padding.normal,
                  child: Center(
                      child: Image.asset((_isLock[index]) ? ImagePaths.levelImagePath+'lock.png': ImagePaths.levelImagePath+'star.png')),
                ),
              ),
            );
          }),
    ));
  }
}
