import 'package:flutter/material.dart';
import 'package:test_module/features/mascot/before_exam_status/before_exam_status_view.dart';
import 'package:test_module/product/utility/constants/image_paths.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';
import 'package:test_module/product/widgets/my_mascot_widget.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/product/widgets/student_info_page_basic.dart';


///Sayfa Kullanılmıyor
class SelectClassView extends StatelessWidget {
  const SelectClassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> buttonTextList=['1. Sınıf', '2. Sınıf', '3. Sınıf'];
    return MyScaffold(
        child: StudentInfoPageBasic(
            buttonLength: 3,
            buttonTextList: buttonTextList,
            mascotText: TextConstant.mascotTextSelectClass,
            widget: BeforeExamStatusView(),
          function: (String selectedItem){
              print(selectedItem);
          },
        ));
  }
}
