import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/product/utility/constants/image_paths.dart';

class LevelMapView extends StatelessWidget {
  const LevelMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<bool> _isLock = [
      false, false, false, false, false, false, true, true, true, true,true, true, true, true,true, true, true, true,true, true, true, true,true, true, true, true,true, true, true, true,true, true, true, true,true, true, true, true,true, true, true, true,true, true, true, true,
    ];
    return SafeArea(
        child: Scaffold(

      body: level_map_background_cont(context, _isLock),
    ));
  }

  Container level_map_background_cont(BuildContext context, List<bool> _isLock) {
    return Container(
      width: context.sized.width,
      height: context.sized.height,
      padding: context.padding.normal,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                ImagePaths.levelBackgroundImagePath,
              ),
              fit: BoxFit.cover),
      color: Colors.blue),
      child: Column(
        children: [

          grid_container(context, _isLock),
          start_button(context),
        ],
      ),
    );
  }

  Expanded grid_container(BuildContext context, List<bool> _isLock) {
    return Expanded(
            child: Container(
              //width: context.sized.width * .9,
              //height: context.sized.height* .4,
              padding: context.padding.low,
              //alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white.withOpacity(.6),

              ),
              child: my_gridview(_isLock),
            ),
          );
  }

  GridView my_gridview(List<bool> _isLock) {
    return GridView.builder(
                shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0

                  ),
                  itemCount: 44,
                  itemBuilder: (context, int index) {
                    return levelBgContainer(context, _isLock, index);
                  });
  }

  Container start_button(BuildContext context) {
    return Container(
            width: context.sized.width*.5,
            height: context.sized.height*.1,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImagePaths.rectButtonImagePath), )
            ),
          );
  }

  Widget levelBgContainer(BuildContext context, List<bool> _isLock, int index) {
    return Padding(
      padding: context.padding.low,
      child: Container(
        width: context.sized.width * .3,
        height: context.sized.height*0.2,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePaths.levelBgImagePath))),
        child: Padding(
          padding: context.padding.normal,
          child: Center(
              child: Image.asset((_isLock[index])
                  ? ImagePaths.lockImagePath
                  : ImagePaths.starImagePath)),
        ),
      ),
    );
  }
}
