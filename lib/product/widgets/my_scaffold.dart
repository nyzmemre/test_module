import 'package:flutter/material.dart';
class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key, required this.child, this.appBar}) : super(key: key);
  final Widget child;
  final PreferredSize? appBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: appBar,
      body: child
    ));
  }
}
