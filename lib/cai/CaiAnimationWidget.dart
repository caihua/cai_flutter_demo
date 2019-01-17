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
  Animation<double> animationTransfrom;
  Animation animationBorder;
  Animation animationColor;
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
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animationTransfrom = Tween(begin: 0.0, end: pi * 2.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));
    animationTransfrom.addStatusListener(listener);

    animationBorder = BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(50.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );

    animationBorder.addStatusListener(listener);

    animationColor = ColorTween(
      begin: Colors.blue[300],
      end: Colors.blue[900],
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.linear,
        ),
      ),
    );

    animationColor.addStatusListener(listener);

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
          animation: animationTransfrom,
        ),
        AnimatedBuilder(
          animation: animationBorder,
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
              borderRadius: animationBorder.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: animationBorder
                      .value, //BorderRadius.all(Radius.circular(10)),
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
          animationBorder: animationBorder,
          animationColor: animationColor,
          controller: controller,
        ),
        // CaiGrow(
        //   child: Container(
        //       // color: Colors.blue,
        //       ),
        //   animation: controller,
        // ),
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
  CaiGrow(
      {this.child, this.animationBorder, this.animationColor, this.controller});
  final Widget child;
  final Animation animationBorder;
  final Animation animationColor;
  final Animation controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
            width: 100,
            height: 100,
            child: child,
            decoration: BoxDecoration(
              borderRadius: animationBorder
                  .value, //BorderRadius.all(Radius.circular(10)),
              border: Border.all(width: 5, color: Colors.red),
              color: animationColor.value,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
