import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/animation.dart';
import 'dart:math';

// var a =  RawKeyboardListener();

class CaiAnimation extends StatefulWidget {
  @override
  _CaiAnimationState createState() => _CaiAnimationState();
}

//mixin
class _CaiAnimationState extends State<CaiAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animationSize;
  Animation<double> animationOpacity;
  Animation<double> animationX;
  AnimationController controller;
  Animation<double> rotateAnimation;
  // final CurvedAnimation curve = CurvedAnimation(
  //   parent: c,
  //   curve: Curves.easeIn
  // )
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animationSize = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    animationX = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        print("$status");
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();

    rotateAnimation = Tween(begin: 0.0, end: pi * 2).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.2, curve: Curves.easeInOut),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Opacity(
            opacity: animationOpacity.value,
            child: Container(
              width: animationSize.value,
              height: animationSize.value,
              padding: EdgeInsets.all(30),
              color: Colors.red,
              child: Text(
                "透明度",
                textAlign: TextAlign.center,
              ),
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
      ),
    );
  }
}
