import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';



///ithiyaçlar
///tüm kelimeler girildikten sonra otomatik kontrol devreye girecek (onChanged de denetle, gelen kelime sayısını al. value.lenght e bak)
///resfebe için model oluştur. gerekirse test modele ekle
///her soru kalıbı için kolaylaştırılmış ekleme sayfası oluştur.
///resfebe soruları geldiğinde farklı bir soru tipi çıkacak şekilde test_view de düzenleme yap.
class ResfebeView extends StatelessWidget {
  const ResfebeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> _controllerList=List.generate(3, (index) => TextEditingController());
    return MyScaffold(
      child: Padding(
        padding: context.padding.normal,
        child: Column(
          children: [
            Image.asset('assets/quessImage/19.jpg'),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                  itemCount: _controllerList.length,
                  itemBuilder: (context, index) {
                return Row(
                  children: [
                    letterTextForm(context, _controllerList[index]),
                    context.sized.emptySizedWidthBoxLow
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  SizedBox letterTextForm(BuildContext context, TextEditingController controller) {
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
                      FocusScope.of(context).nextFocus(); //whatever you want to do
                    }
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1)
                  ],
                ),
              );
  }
}
