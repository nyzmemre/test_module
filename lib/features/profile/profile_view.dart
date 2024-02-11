import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/product/utility/constants/image_paths.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Center(
      child: SingleChildScrollView(
        child: Container(
          height: context.sized.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(ImagePaths.levelBgImagePath), fit: BoxFit.fill)
          ),
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    ));
  }
}
