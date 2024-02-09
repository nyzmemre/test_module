import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
class LevelBgExam extends StatelessWidget {
  const LevelBgExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      double myWidth=(context.sized.width < 400) ? context.sized.width : 400;
      double myHeight=(context.sized.height<900) ? context.sized.height : 900;

    return Scaffold(
      appBar: AppBar(title: Text('example'),),
      body: Center(
        child: Container(
          width: myWidth,
          height: myHeight,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/appImage/levelImage/bg.jpg'),fit: BoxFit.fill)
          ),
          child: Stack(
            children: [
              Positioned(
                left: myWidth*.23,
                top: myHeight*.06,
                child: CircleAvatar(
                  child: Text('1'),
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                left: myWidth*.48,
                top: myHeight*.24,
                child: CircleAvatar(
                  child: Text('2'),
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                left: myWidth*.6,
                top: myHeight*.4,
                child: CircleAvatar(
                  child: Text('3'),
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                left: myWidth*.3,
                top: myHeight*.55,
                child: CircleAvatar(
                  child: Text('4'),
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
