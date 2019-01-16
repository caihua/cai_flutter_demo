import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CaiAnimationWidget extends AnimatedWidget {
  CaiAnimationWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;

    return Center(
        child: Transform.rotate(
      angle: animation.value,
      alignment: Alignment.center,
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.green,
      ),
    ));
  }
}

class CaiAnimationRoute extends StatefulWidget {
  @override
  _CaiAnimationRouteState createState() => _CaiAnimationRouteState();
}

class _CaiAnimationRouteState extends State<CaiAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation1;
  Animation animation2;
  Animation animation3;
  AnimationController controller;
  @override
  void initState() {
    super.initState();

    AnimationStatusListener listener = (status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    };
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation1 = Tween(begin: 0.0, end: pi * 2.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));
    animation1.addStatusListener(listener);

    animation2 = BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(50.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );

    animation2.addStatusListener(listener);

    animation3 = ColorTween(
      begin: Colors.blue[300],
      end: Colors.blue[900],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          0.75,
          curve: Curves.linear,
        ),
      ),
    );

    animation3.addStatusListener(listener);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedEvaluation x;

    return Column(
      children: <Widget>[
        Hero(
            tag: "Animation2",
            child: FlatButton(
                color: Colors.red,
                child: Text("Animation2"),
                onPressed: () {})),
        CaiAnimationWidget(
          animation: animation1,
        ),
        AnimatedBuilder(
          animation: animation2,
          child: Container(
            // decoration: BoxDecoration(
            //      //BorderRadius.all(Radius.circular(10)),
            //     border: Border.all(width: 5, color: Colors.red),
            // ),

            width: 100,
            height: 100,
          ),
          builder: (BuildContext ctx, Widget child) {
            return ClipRRect(
              borderRadius: animation2.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      animation2.value, //BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 5, color: Colors.red),
                  color: Colors.yellow,
                ),
                child: child,
              ),
            );
          },
        ),
        CaiGrow(
          child: Container(
              // color: Colors.blue,
              ),
          animation: animation3,
        ),
      ],
    );
  }

  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }
}

class CaiGrow extends StatelessWidget {
  CaiGrow({this.child, this.animation});
  final Widget child;
  final Animation animation;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            width: 100,
            height: 100,
            child: child,
            color: animation.value,
          );
        },
        child: child,
      ),
    );
  }
}
