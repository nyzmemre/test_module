import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';

class ResfebeView extends StatelessWidget {
  const ResfebeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: Padding(
        padding: context.padding.normal,
        child: Column(
          children: [
            Image.asset('assets/quessImage/19.jpg'),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),),
            )
          ],
        ),
      ),
    );
  }
}
