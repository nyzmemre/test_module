import 'package:flutter/material.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(child: Center(child: Text('Login'),));
  }
}
