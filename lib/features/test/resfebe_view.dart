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
          child: Consumer<TestViewModel>(
            builder: (context, providerTest,_) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                  itemCount: _controllerList.length,
                  itemBuilder: (context, index) {
                return Row(
                  children: [
                    letterTextForm(context,  _controllerList, providerTest, index),
                    context.sized.emptySizedWidthBoxLow
                  ],
                );
              });
            }
          ),
        );
  }

  SizedBox letterTextForm(BuildContext context,  List<TextEditingController> controllerList, TestViewModel providerTest, int index) {
    return SizedBox(
                width: 40,
                height: 60,
                child: TextFormField(
                  controller: controllerList[index],
                  readOnly: isTextFormsPassive,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    hintText: providerTest.textFormUserAnswer!=null ? providerTest.textFormUserAnswer![index] : '',
                    filled: true,
                    fillColor: (providerTest.textFormFieldColorList!=null) ? providerTest.textFormFieldColorList![index] : Colors.transparent,
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
   // List<Color> colorList=[];
    var testProvider=Provider.of<TestViewModel>(context, listen: false);
    for (TextEditingController controller in controllerList) {
      typedWord += controller.text;
    }


      testProvider.resfebeScoreCounter(typedWord, testList[currentIndex].quessAnsw);



   /* List<String> userAnsw=typedWord.split('');
    List<String> correctAnsw=testList[currentIndex].quessAnsw.split('');
    for(int i=0; i<correctAnsw.length;i++){

      if(userAnsw[i]==correctAnsw[i]){
        colorList.add(Colors.green);
      }else {
        colorList.add(Colors.red);
      }
    }
    print(colorList);
*/
  }
}
