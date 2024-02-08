import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MyLevelExam extends StatelessWidget {
  const MyLevelExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            CustomPaint(
              painter: MyPaint(),
              size: Size(context.sized.width,context.sized.height),
            ),
            Positioned(
                left: context.sized.width*.15,
                top: context.sized.height*.05-15,
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
                left: context.sized.width*.55,
                top: context.sized.height*.05-15,
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
                left: context.sized.width*.55,
                top: context.sized.height*.2-15,
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
                left: context.sized.width*.3,
                top: context.sized.height*.2-15,
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
      ));
  }
}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

  final path=Path();

  path.moveTo(size.width*.1, size.height*.05);
  path.lineTo(size.width*.6, size.height*.05);
  path.arcToPoint(
    Offset(size.width*.6, size.height * .2,),
    radius: Radius.circular(20)
  );
    path.lineTo(size.width*.3, size.height*.2);
    path.arcToPoint(
      Offset(size.width*.3, size.height*.4),
        radius: Radius.circular(20),
clockwise: false    );
    path.lineTo(size.width*.6, size.height*.4);
    path.arcToPoint(
      Offset(size.width*.6, size.height*.6),
      radius: Radius.circular(20)
    );
    path.lineTo(size.width*.3, size.height*.6);

   //path.lineTo(300, 400); // Sağa doğru çizgi
   //path.cubicTo(350, 400, 300, 350, 250, 300);

//path.quadraticBezierTo(350, 400, 350, 300);
//path.quadraticBezierTo(350, 300, 350, 200);
//path.lineTo(50, 300);
    // Bezier eğrisi ile dönüş oluşturmak

/*    path.quadraticBezierTo(220, 20, 220, 30); // İlk kontrol noktası (sağa doğru), ikinci kontrol noktası (aşağı doğru)
    path.lineTo(220, 50); // Dikey çizgi

    // İlk ovalliğin tersi ile sola dönüş oluşturmak
    path.quadraticBezierTo(220, 60, 210, 60); // İlk kontrol noktası (aşağı doğru), ikinci kontrol noktası (sola doğru)
    path.lineTo(30, 60); // Sola doğru çizgi

    path.quadraticBezierTo(20, 60, 20, 150);
    path.lineTo(220, 150);*/
  canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Değişiklik olmadığında false döndür
  }
}




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
