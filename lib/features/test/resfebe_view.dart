import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:test_module/features/test/test_model.dart';
import 'package:test_module/features/test/test_view_model.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';



///ithiyaçlar
///tüm kelimeler girildikten sonra otomatik kontrol devreye girecek (onChanged de denetle, gelen kelime sayısını al. value.lenght e bak)
///resfebe için model oluştur. gerekirse test modele ekle
///her soru kalıbı için kolaylaştırılmış ekleme sayfası oluştur.
///resfebe soruları geldiğinde farklı bir soru tipi çıkacak şekilde test_view de düzenleme yap.
class ResfebeView extends StatelessWidget {
  const ResfebeView({Key? key, required this.testList, required this.currentIndex, required this.isTextFormsPassive,}) : super(key: key);
  final List<TestModel> testList;
  final int currentIndex;
  final bool isTextFormsPassive;

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> _controllerList=List.generate(testList[currentIndex].quessAnsw.length, (index) => TextEditingController());
    return SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: ScrollPhysics(),
            shrinkWrap: true,
              itemCount: _controllerList.length,
              itemBuilder: (context, index) {
            return Row(
              children: [
                letterTextForm(context, _controllerList[index], _controllerList),
                context.sized.emptySizedWidthBoxLow
              ],
            );
          }),
        );
  }

  SizedBox letterTextForm(BuildContext context, TextEditingController controller, List<TextEditingController> controllerList) {
    return SizedBox(
                width: 40,
                height: 60,
                child: TextFormField(
                  controller: controller,
                  readOnly: isTextFormsPassive,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),

                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();//whatever you want to do
                      if (_isAllLettersEntered(controllerList)) {
                        checkAnswer(context, controllerList);
                      }
                    }
                  },


                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1)
                  ],
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

  void checkAnswer(BuildContext context, List<TextEditingController> controllerList) {
    String typedWord = '';
    var testProvider=Provider.of<TestViewModel>(context, listen: false);
    for (TextEditingController controller in controllerList) {
      typedWord += controller.text;
    }

    if (typedWord == testList[currentIndex].quessAnsw) {
      testProvider.resfebeScoreCounter(true);


    } else {
      testProvider.resfebeScoreCounter(false);

    }
  }
}
