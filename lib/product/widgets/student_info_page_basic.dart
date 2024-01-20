import 'package:flutter/material.dart';
import 'package:test_module/product/utility/constants/image_paths.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';
import 'package:test_module/product/widgets/my_mascot_widget.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:kartal/kartal.dart';

///Sayfa Kullanılmıyor

class StudentInfoPageBasic extends StatelessWidget {
  const StudentInfoPageBasic({Key? key, required this.buttonLength, required this.buttonTextList, required this.mascotText, required this.widget, required this.function}) : super(key: key);
  final int buttonLength;
  final List<String> buttonTextList;
  final String mascotText;
  final Widget widget;
  final Function(String val) function;


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        context.sized.emptySizedHeightBoxNormal,
        Expanded(
          flex: 2,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: buttonTextList.map((e) => Padding(
                padding: context.padding.low,
                child: Center(child: SizedBox(
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>widget));
                      function(e);
                    }, child: Padding(
                      padding: context.padding.normal,
                      child: Text(e, style: Theme.of(context).textTheme.headlineMedium,),
                    )))),
              )).toList(),
            ),
          ),
        ),
        MyMascotWidget(text: mascotText),
        Expanded(
            flex: 1,
            child: Image.asset(ImagePaths.mascotImage)),
      ],
    );
  }


}
