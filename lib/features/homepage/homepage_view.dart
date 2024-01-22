import 'package:flutter/material.dart';
import 'package:test_module/product/widgets/my_scaffold.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> levelList=List.generate(20, (index) => index);
    return MyScaffold(child: Center(child:SingleChildScrollView(
      child: Column(
        children: levelList.map((e) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
                print(e.toString());
              },
              child: CircleAvatar(child: Text(e.toString()),)),
        )).toList()
      ),
    ),));
  }
}
