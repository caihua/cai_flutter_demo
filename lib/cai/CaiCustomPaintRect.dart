import 'dart:math';
import 'package:flutter/material.dart';

class CaiCustomPaintRect extends StatefulWidget {
  @override
  _CaiCustomPaintRectState createState() => _CaiCustomPaintRectState();
}

class _CaiCustomPaintRectState extends State<CaiCustomPaintRect> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: CustomPaint(
            size: Size(200, 200),
            painter: CaiPainter(),
          ),
        ),
      ],
    );
  }
}

class CaiPainter extends CustomPainter {
  @override
  paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0x77cdb175); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
    //画一个白子
    paint.color = Colors.yellow;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    // paint.shader = SweepGradient(
    //     startAngle: 0.0,
    //     endAngle: 0.8,
    //     colors:  [Colors.blue, Colors.blue],
    //     stops: null,
    //   ).createShader(Rect.fromLTWH(0, 0, 100, 100));

    //   canvas.drawArc(
    //       Rect.fromLTWH(0, 0, 100, 100),
    //       0.0,
    //       0.0,
    //       false,
    //       paint
    //   );

    Paint _paint = Paint()
      ..color = Colors.blueAccent //画笔颜色
      ..strokeCap = StrokeCap.round //画笔笔触类型
      ..isAntiAlias = true //是否启动抗锯齿
      ..blendMode = BlendMode.exclusion //颜色混合模式
      ..style = PaintingStyle.stroke //绘画风格，默认为填充
      ..colorFilter = ColorFilter.mode(Colors.blueAccent,
          BlendMode.exclusion) //颜色渲染模式，一般是矩阵效果来改变的,但是flutter中只能使用颜色混合模式
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果，flutter中只有这个
      ..filterQuality = FilterQuality.high //颜色渲染模式的质量
      ..strokeWidth = 15.0; //画笔的宽度

// 原文：https://blog.csdn.net/u011272795/article/details/83828732

    Path path = new Path()..moveTo(10.0, 100.0);

    path.lineTo(200.0, 200.0);
    path.lineTo(100.0, 300.0);
    path.lineTo(150.0, 350.0);
    path.lineTo(150.0, 500.0);

    canvas.drawPath(path, _paint);

    var width = 200;
    var height = 300;
    path.moveTo(width / 2, height / 4);
    path.cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12);
    canvas.drawPath(path, _paint);

    Path path2 = new Path();
    path2.moveTo(width / 2, height / 4);
    path2.cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5,
        width / 2, (height * 7) / 12);
    canvas.drawPath(path2, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
