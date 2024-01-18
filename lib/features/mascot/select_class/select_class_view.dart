import 'package:flutter/material.dart';
import 'package:test_module/product/utility/constants/image_paths.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';
import 'package:test_module/product/widgets/my_mascot_widget.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:kartal/kartal.dart';


class SelectClassView extends StatelessWidget {
  const SelectClassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _classList=List.generate(3, (index) => '${index+1}. Sınıf');
    return MyScaffold(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        context.sized.emptySizedHeightBoxNormal,
        Expanded(
          flex: 1,
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: _classList.map((e) => Padding(
              padding: context.padding.low,
              child: Center(child: SizedBox(
                  child: ElevatedButton(onPressed: (){}, child: Padding(
                    padding: context.padding.normal,
                    child: Text(e, style: Theme.of(context).textTheme.headlineMedium,),
                  )))),
            )).toList(),
          ),
        ),
            MyMascotWidget(text: TextConstant.mascotTextSelectClass),
    Expanded(
       flex: 1,
        child: Image.asset(ImagePaths.mascotImage)),
      ],
    ));
  }
}
