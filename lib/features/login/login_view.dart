import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:test_module/features/homepage/homepage_view.dart';

import 'package:test_module/features/login/sign_up_view.dart';

import '../../product/utility/constants/text_constant.dart';
import '../../product/widgets/custom_text_form_field.dart';
import 'login_view_model.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey _key = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: context.padding.high,
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(TextConstant.signIn),

                  context.sized.emptySizedHeightBoxLow,
                  CustomTextFormField(
                    labelText: TextConstant.mailAdress,

                    controller: _emailCtrl,
                  ),
                  context.sized.emptySizedHeightBoxLow,
                  Consumer<LoginViewModel>(
                    builder: (context, provider, _) {
                      return CustomTextFormField(
                        labelText: TextConstant.password,
                        isVisible: !provider.isVisible,
                        controller: _passwordCtrl,
                      );
                    },
                  ),
                  Consumer<LoginViewModel>(builder: (context, provider, _) {
                    return Row(
                      children: [
                        Checkbox(
                            value: provider.isVisible,
                            onChanged: (val) {
                              provider.visibleChange();
                            }),
                        (provider.isVisible)
                            ? const Text(TextConstant.hidePassword)
                            : const Text(TextConstant.showPassword),
                      ],
                    );
                  }),
                  context.sized.emptySizedHeightBoxLow,
                  ElevatedButton(onPressed: ()async{
                    await LoginViewModel().singIn(context, _emailCtrl.text, _passwordCtrl.text);
                    print(FirebaseAuth.instance.currentUser?.email);


                  }, child: Text(TextConstant.signIn)),
                  context.sized.emptySizedHeightBoxLow,
                  context.sized.emptySizedHeightBoxLow,

                  const Text(TextConstant.or),
                  context.sized.emptySizedHeightBoxLow,
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpView()));
                  }, child: const Text(TextConstant.signUp),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}