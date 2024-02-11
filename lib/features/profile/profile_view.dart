import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/product/utility/constants/image_paths.dart';
import 'package:test_module/product/widgets/custom_text_form_field.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier _valueNotifier = ValueNotifier<bool>(false);

    return MyScaffold(
        child: Center(
      child: SingleChildScrollView(
        child: Container(
          height: context.sized.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagePaths.profileBgImagePath),
                  fit: BoxFit.fill,
                  opacity: 0.2)),
          child: Padding(
            padding: context.padding.high,
            child: ValueListenableBuilder(
              valueListenable: _valueNotifier,
              builder: (context, value, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: TextButton(
                      child: Text('Bilgileri Düzenle'),
                      onPressed: () {
                        _valueNotifier.value = !_valueNotifier.value;
                        print(_valueNotifier.value);
                      },
                    ),
                  ),
                  Text('Ad Soyad'),
                  CustomTextFormField(
                    labelText: 'Ahmet Hassan',
                    enabled: _valueNotifier.value,
                  ),
                  Text('Mail Adresi'),
                  CustomTextFormField(
                    labelText: 'ahmedhassan@gmail.com',
                    enabled: _valueNotifier.value,
                  ),
                  Text('Sınıf'),
                  CustomTextFormField(
                    labelText: '2. sınıf',
                    enabled: _valueNotifier.value,
                  ),
                  (_valueNotifier.value)
                      ? Center(
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Bilgileri Güncelle')))
                      : SizedBox(),
                  Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                          onPressed: () {},
                          child: Text(
                            'Hesabımı Sil',
                            style: TextStyle(color: Colors.white),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
