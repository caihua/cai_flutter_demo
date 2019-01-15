import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// var a =  RawKeyboardListener();

class CaiAnimation extends StatefulWidget {
  @override
  _CaiAnimationState createState() => _CaiAnimationState();
}

class _CaiAnimationState extends State<CaiAnimation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Opacity(
          opacity: 0.9,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Text("透明度"),
          ),
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
        Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ],
    );
  }
}
