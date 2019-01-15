import 'package:flutter/material.dart';

//手势绘图
class CaiPainter extends CustomPainter {
  final List<Offset> points;
  CaiPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CaiPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}

class CaiPaint extends StatefulWidget {
  @override
  _CaiPaintState createState() => _CaiPaintState();
}

class _CaiPaintState extends State<CaiPaint> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
              referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: CustomPaint(
        painter: CaiPainter(_points),
        size: Size.infinite,
      ),
    );
  }
}
