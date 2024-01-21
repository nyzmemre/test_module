import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';

import '../../product/utility/constants/text_constant.dart';
import '../../product/utility/validators/textform_validators.dart';
import '../../product/widgets/custom_text_form_field.dart';
import 'login_view_model.dart';


class SignUpView extends StatefulWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _key = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final surnameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  LoginViewModel _loginViewModel = LoginViewModel();

  @override
  void dispose() {
    nameCtrl.dispose();
    surnameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: context.padding.high,
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(TextConstant.signUp, style: Theme.of(context).textTheme.headlineMedium,),
                    context.sized.emptySizedHeightBoxLow,
                    CustomTextFormField(
                      controller: nameCtrl,
                      labelText: TextConstant.name,
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    CustomTextFormField(
                      controller: surnameCtrl,
                      labelText: TextConstant.surname,
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    CustomTextFormField(
                      controller: emailCtrl,
                      labelText: TextConstant.mailAdress,
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    passwordColumn(),
                    Consumer<LoginViewModel>(builder: (context, provider, _) {
                      return Row(
                        children: [
                          Checkbox(
                              value: provider.isVisible,
                              onChanged: (val) {
                                provider.visibleChange();
                              }),
                          (provider.isVisible)
                              ? Text(TextConstant.hidePassword)
                              : Text(TextConstant.showPassword),
                        ],
                      );
                    }),
                    context.sized.emptySizedHeightBoxLow,


                    context.sized.emptySizedHeightBoxLow,


                    Consumer<LoginViewModel>(
                      builder: (context, provider, _) {
                        return ElevatedButton(
                            onPressed: (provider.isClickButton)
                                ? null
                                : () async {
                              provider.buttonClickChange();
                              if (_key.currentState!.validate()) {


                                  await _loginViewModel
                                      .registerUserAndAddToFirestore(
                                      context: context,
                                    userName: nameCtrl.text,
                                    userSurname: surnameCtrl.text,
                                      email: emailCtrl.text,
                                      password: passwordCtrl.text,
                                    classGrade: 1

                     );
                                } else {
                                  MotionToast.error(
                                    title: const Text(TextConstant.beCareful),
                                    description: const Text(TextConstant.isInfoTrue),
                                    position: MotionToastPosition.center,
                                  ).show(context);
                                }



                              provider.buttonClickChange();
                            },
                            child: (provider.isClickButton)
                                ? CircularProgressIndicator()
                                : Text(TextConstant.signUp));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Consumer<LoginViewModel> passwordColumn() {
    return Consumer<LoginViewModel>(builder: (context, provider, _) {
      return Column(
        children: [
          CustomTextFormField(
            controller: passwordCtrl,
            isVisible: (provider.isVisible) ? false : true,
            labelText: TextConstant.password,
          ),
          context.sized.emptySizedHeightBoxLow,
          CustomTextFormField(
            controller: confirmPasswordCtrl,
            isVisible: (provider.isVisible) ? false : true,
            validator: (value) {
              return TextFormValidator.validatePasswordMatch(passwordCtrl.text, confirmPasswordCtrl.text);
            },
            labelText: TextConstant.passwordAgain,
          ),
        ],
      );
    });
  }
}