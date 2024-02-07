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
      child: Container(
        height: context.sized.height,
        width: context.sized.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.8),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              left:_leftPos+0,
              top:_topPos+0,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.black,
              ),
            ),
            Positioned(
              left:_leftPos+150,
              top:_topPos+150,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left:_leftPos+300,
              top:_topPos+300,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left:_leftPos+450,
              top:_topPos+450,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left:_leftPos+700,
              top:_topPos+700,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left:_leftPos+900,
              top:_topPos+900,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blueAccent,
              ),
            )
          ],
        ),
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
}