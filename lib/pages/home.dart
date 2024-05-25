import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _gestureDetected = '';
  Color? _paintedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This Gestures 11'),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGestureDetector(),
              const Divider(
                color: Colors.black,
                height: 44.0,
              ),
              _buildDraggable(),
              const Divider(
                height: 40.0,
              ),
              _buildDragTarget(),
              const Divider(
                color: Colors.black,
              ),

            ],
          ),
        ),
      ),
    );
  }
  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('on Tap ');
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },
      //onVerticalDragUpdate: ((DragUpdateDetails details) {
      // print('onVerticalDragUpdate: $details');
      // _displayGestureDetected('onVerticalDragUpdate:\n$details');
      //}),
      //onHorizontalDragUpdate: (DragUpdateDetails details) {
      // print('onHorizontalDragUpdate: $details');
      // _displayGestureDetected('onHorizontalDragUpdate:\n$details');
      //},
      //onHorizontalDragEnd: (DragEndDetails details) {
      // print('onHorizontalDragEnd: $details');
      // if (details.primaryVelocity < 0) {
      // print('Dragging Right to Left: ${details.velocity}');
      // } else if (details.primaryVelocity > 0) {
      // print('Dragging Left to Right: ${details.velocity}');
      // }
      //},
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.access_alarm,size: 98.0,),
            Text('$_gestureDetected'),
          ],
        ),
      ),
    );
  }
  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }
  Draggable<int> _buildDraggable() {
    return Draggable(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.palette,
              color: Colors.deepOrange,
              size: 48.0,
            ),
            Text(
              'Drag Me below to change color',
            ),
          ],
        ),
        childWhenDragging: Icon(
          Icons.palette,
          color: Colors.grey,
          size: 48.0,
        ),
        feedback: Icon(
          Icons.brush,
          color: Colors.deepOrange,
          size: 80.0,
        ),
      data: Colors.deepOrange.value,
    );
  }
  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      onAccept: (colorValue) {
        _paintedColor = Color(colorValue);
      },
      builder: (BuildContext context, List<dynamic> acceptedData, List<dynamic>
          rejectedData) => acceptedData.isEmpty ? Text('Drag To and see color change',style: TextStyle(color: _paintedColor),)
          :Text('Painting Color: $acceptedData',style: TextStyle(color: Color(acceptedData[0]), fontWeight: FontWeight.bold,),)
    );
  }
}
