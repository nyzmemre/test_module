import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MyLevelExam extends StatelessWidget {
  const MyLevelExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctxWidth=context.sized.width;
    var ctxHeight=context.sized.height;
    return Scaffold(
       // appBar: AppBar(title: Text('sdfsf'),),
        body: Center(
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.5, // Resmin opaklığını belirler (0.0 - tamamen saydam, 1.0 - tamamen opak)
                  child: Image.asset(
                    'assets/appImage/levelImage/river2_bg.png', // Arka plan resminin yolu
                    fit: BoxFit.cover, // Resmi ekran boyutuna sığdırmak için
                  ),
                ),
              ),
              CustomPaint(
                painter: MyPaint(),
                size: Size(ctxWidth,ctxHeight),
              ),
              Positioned(
                  left: ctxWidth*.15,
                  top: ctxHeight*.8-15,
                  child: Container(
                    child: Center(child: Text('1', style: TextStyle(color: Colors.white))),
                    width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueAccent,
                ),
              )),

              Positioned(
                  left: ctxWidth*.55,
                  top: ctxHeight*.05-15,
                  child: Container(
                    child: Center(child: Text('2', style: TextStyle(color: Colors.white))),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueAccent,
                ),
              )),

              Positioned(
                  left: ctxWidth*.55,
                  top: ctxHeight*.2-15,
                  child: Container(
                    child: Center(child: Text('3', style: TextStyle(color: Colors.white))),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueAccent,
                ),
              )),

              Positioned(
                  left: ctxWidth*.3,
                  top: ctxHeight*.2-15,
                  child: Container(
                    child: Center(child: Text('4', style: TextStyle(color: Colors.white))),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueAccent,
                ),
              )),
            ],
          ),
        )
    );
  }
}

class MyPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint=Paint()
        ..color=(Colors.redAccent)
        ..strokeWidth=(20)
        ..style=PaintingStyle.stroke;
    final path=Path();
    double sizeW=size.width;
    double sizeH=size.height;
    path.moveTo(sizeW*.1, sizeH*.8);
    path.lineTo(sizeW*.6, sizeH*.8);
    path.arcToPoint(
      Offset(sizeW*.6, sizeH*.5),
      radius: Radius.circular(20),
      clockwise: false,
    );
    path.lineTo(sizeW*.4, sizeH*.5);
    path.arcToPoint(
      Offset(sizeW*.4, sizeH*.2),
      radius: Radius.circular(20)
    );
    path.lineTo(sizeW*.6, sizeH*.2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
return false;
  }
}

/*class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

  final path=Path();
double sizeH=size.height;
  path.moveTo(size.width*.1, sizeH*.05);
  path.lineTo(size.width*.6, sizeH*.05);
  path.arcToPoint(
    Offset(size.width*.6, sizeH * .2,),
    radius: Radius.circular(20)
  );
    path.lineTo(size.width*.3, sizeH*.2);
    path.arcToPoint(
      Offset(size.width*.3, sizeH*.4),
        radius: Radius.circular(20),
clockwise: false    );
    path.lineTo(size.width*.6, sizeH*.4);
    path.arcToPoint(
      Offset(size.width*.6, sizeH*.6),
      radius: Radius.circular(20)
    );
    path.lineTo(size.width*.3, sizeH*.6);
  canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Değişiklik olmadığında false döndür
  }
}*/




///üste doğru dallanan yapı
/*
class MyPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint=Paint()..color=Colors.amber
        ..strokeWidth=5
        ..style=PaintingStyle.stroke;

    var path=Path();
    path.moveTo(50,100);
    path.lineTo(250, 100);
    path.arcTo(
      Rect.fromCircle(center: Offset(200, 100), radius: 20),
      0, // Başlangıç açısı (radyan cinsinden)
      pi/2, // Bitiş açısı (radyan cinsinden), pi = 180 derece
      false, // Yayın saat yönünde çizilip çizilmeyeceği
    );path.arcTo(
      Rect.fromCircle(center: Offset(100, 100), radius: 20),
      0, // Başlangıç açısı (radyan cinsinden)
      pi/2, // Bitiş açısı (radyan cinsinden), pi = 180 derece
      true, // Yayın saat yönünde çizilip çizilmeyeceği
    );
    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    //throw UnimplementedError();
    return false;
  }

}
*/
