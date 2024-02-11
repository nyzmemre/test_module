import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../utility/constants/image_paths.dart';

class LevelWideButtonWidget extends StatelessWidget {
  const LevelWideButtonWidget({Key? key, required this.buttonText, required this.page}) : super(key: key);
  final String buttonText;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>page));
      },
      child: Container(
        width: context.sized.width*.5,
        padding: context.padding.normal,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(ImagePaths.levelWideButtonBg))
        ),
        child: Text(buttonText, textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 30),),
        //  child: Image.asset(ImagePaths.levelWideButtonBg)

      ),
    );
  }
}
