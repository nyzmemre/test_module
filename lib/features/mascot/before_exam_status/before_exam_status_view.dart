import 'package:flutter/material.dart';
import 'package:test_module/features/login/login_view.dart';
import 'package:test_module/product/utility/constants/text_constant.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';
import 'package:test_module/product/widgets/student_info_page_basic.dart';

class BeforeExamStatusView extends StatelessWidget {
  const BeforeExamStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> buttonTextList = [
      'İlk Kez Giriyorum',
      'Daha Önce Sınava Girdim'
    ];
    return MyScaffold(
        child: StudentInfoPageBasic(
      buttonLength: 2,
      buttonTextList: buttonTextList,
      mascotText: TextConstant.mascotTextBeforExamStatus,
      widget: LoginView(),
          function: (String selectedItem){
        print(selectedItem);
          },
    ));
  }
}
