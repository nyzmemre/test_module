import 'package:flutter/material.dart';
import 'package:test_module/features/mascot/select_class/select_class_view.dart';
import 'package:test_module/product/utility/constants/image_paths.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';
import 'package:test_module/product/widgets/my_mascot_widget.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:kartal/kartal.dart';

import '../login/login_view.dart';

class MascotView extends StatelessWidget {
  const MascotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Center(
      child: Column(
        children: [
          context.sized.emptySizedHeightBoxHigh,
      const MyMascotWidget(text: TextConstant.mascotText1),
          SizedBox(
              height: 300,
              child: Image.asset(ImagePaths.mascotImage)),
          context.sized.emptySizedHeightBoxNormal,
          ElevatedButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginView()), (route) => false);
          }, child: Text('Devam Et >'))
        ],
      ),
    ));
  }


}
