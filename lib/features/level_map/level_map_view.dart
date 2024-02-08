import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LevelMapView extends StatefulWidget {
  const LevelMapView({Key? key}) : super(key: key);

  @override
  State<LevelMapView> createState() => _LevelMapViewState();
}

class _LevelMapViewState extends State<LevelMapView> {
  final double _mapWidth = 3000.0;
  final double _mapHeight = 3000.0;
  final double _cameraHeight = 800.0;
  final double _cameraWidth = 800.0;
  final List<double> _positionLeft=List.generate(10, (index) => index+100);
  bool _isClick=false;
  double _position=0;


  late double _leftPos; //the offset of the widget position relative to the camera
  late double _topPos;  //the offset of the widget position relative to the camera

  @override
  void didChangeDependencies() {
     _leftPos=context.sized.width*.4;
     _topPos=context.sized.height*.8;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var camera = GestureDetector(
      onPanUpdate: (details){
        var topPos = _topPos + details.delta.dy;
        var leftPos = _leftPos + details.delta.dx;
        topPos = _boundaryRule(topPos,_mapHeight, _cameraHeight);
        leftPos = _boundaryRule(leftPos,_mapWidth, _cameraWidth);
        //set the state
        setState(() {
          _topPos = topPos;
          _leftPos = leftPos;
        });
      },
      child:  Stack(
        children: <Widget>[
          Container(
            height: context.sized.height-56,
            child: ListView.builder(
              shrinkWrap: true, // ListView.builder'ın içeriğine sığacak şekilde boyutunu sıkıştır
              padding: EdgeInsets.all(0),
              itemCount: 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) => Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                height: 600, // ListView.builder'ın yüksekliği 200 piksel olarak ayarlanır
                width: context.sized.width, //* 15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/appImage/river2_bg.png'),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // _positionLeft listesindeki her öğe için bir Positioned widget'ı oluşturun
          for (int index = 0; index < _positionLeft.length; index++)
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              left: _position,
              top: (context.sized.height-56)*.5,//(context.sized.height-56-context.sized.width*.3)*.5,
              child: Container(
                width: context.sized.width*.2,
                height: context.sized.width*.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/appImage/ship.png'), fit: BoxFit.fill)
                  )
                ),
              ),
          Positioned(
              left:context.sized.width*.05,
              top: (context.sized.height-56)*.53,
              child: InkWell(
                onTap: (){
                  counter();
                },
                child:myContainer(),


              ),
            ),
          Positioned(
              left:context.sized.width*.25,
              top: (context.sized.height-56)*.53,
              child: InkWell(
                onTap: (){
                  counter();
                },
                child:myContainer(),
              ),
            ),
          Positioned(
              left:context.sized.width*.45,
              top: (context.sized.height-56)*.53,
              child: InkWell(
                onTap: (){
                  counter();
                },
                child:myContainer(),
              ),
            ),
          Positioned(
              left:context.sized.width*.65,
              top: (context.sized.height-56)*.53,
              child: InkWell(
                onTap: (){
                  counter();
                },
                child:myContainer(),
              ),
            ),
            /* Positioned(
              left:_leftPos+100,
              top:_topPos+0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left:_leftPos+200,
              top:_topPos+0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left:_leftPos+450,
              top:_topPos+0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left:_leftPos+700,
              top:_topPos+0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left:_leftPos+900,
              top:_topPos+0,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueAccent,
              ),
            )*/
          ],
        ),
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('widget.title'),

      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: camera,
      ),
    );
  }

  Container myContainer() {
    return Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Yuvarlak kenarlar
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFE74C3C), // Koyu kırmızı tonu
                      Color(0xFFC0392B), // Orta tonlu kırmızı
                      Color(0xFF922B21), // Daha açık kırmızı tonu
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // Gölgelendirme konumu
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
  }
  double _boundaryRule(position, mapLength, cameraLength){
    // this function will prevent the widget from moving if it reached the boundary
    if (position < (cameraLength-mapLength)){
      position = cameraLength- mapLength;
    }
   /* if (position> 0){
      position = 0.0;
    }*/

    return position;
  }

  void counter(){
_position+=context.sized.width*.2;
setState(() {

});
  }
}