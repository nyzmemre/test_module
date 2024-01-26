import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/features/test/test_model.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';



///ithiyaçlar
///tüm kelimeler girildikten sonra otomatik kontrol devreye girecek (onChanged de denetle, gelen kelime sayısını al. value.lenght e bak)
///resfebe için model oluştur. gerekirse test modele ekle
///her soru kalıbı için kolaylaştırılmış ekleme sayfası oluştur.
///resfebe soruları geldiğinde farklı bir soru tipi çıkacak şekilde test_view de düzenleme yap.
class ResfebeView extends StatelessWidget {
  const ResfebeView({Key? key, required this.testList, required this.currentIndex}) : super(key: key);
  final List<TestModel> testList;
  final int currentIndex;
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
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();//whatever you want to do
                    checkAnswer(context, controllerList);
                    }
                  },


                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1)
                  ],
                ),
              );
  }

  void checkAnswer(BuildContext context, List<TextEditingController> controllerList) {
    String typedWord = '';
    for (TextEditingController controller in controllerList) {
      typedWord += controller.text;
    }

    if (typedWord == testList[currentIndex].quessAnsw) {
      print('true');
    } else {
      print('false');
    }
  }
}
