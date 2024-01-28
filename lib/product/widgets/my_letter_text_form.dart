import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_module/features/test/test_view_model.dart';

import '../../features/test/test_model.dart';

class MyLetterTextForm extends StatelessWidget {
  const MyLetterTextForm({Key? key, required this.controllerList, required this.providerTest, required this.index, required this.testList, required this.isTextFormsPassive}) : super(key: key);
  final List<TextEditingController> controllerList;
  final TestViewModel providerTest;
  final int index;
  final List<TestModel> testList;
  final bool isTextFormsPassive;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 60,
      child: TextFormField(
        controller: controllerList[index],
        readOnly: isTextFormsPassive,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            hintText: providerTest.textFormUserAnswer != null
                ? providerTest.textFormUserAnswer![index]
                : '',
            filled: true,
            fillColor: (providerTest.textFormFieldColorList != null)
                ? providerTest.textFormFieldColorList![index]
                : Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); //whatever you want to do
            if (_isAllLettersEntered(controllerList)) {
              checkAnswer(context, controllerList);
            }
          }
        },
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
      ),
    );
  }

  bool _isAllLettersEntered(List<TextEditingController> controllerList) {
    for (TextEditingController controller in controllerList) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void checkAnswer(
      BuildContext context, List<TextEditingController> controllerList) {
    String typedWord = '';
    for (TextEditingController controller in controllerList) {
      typedWord += controller.text;
    }

    providerTest.resfebeScoreCounter(
        typedWord, testList[index].quessAnsw);
  }
}
