import 'package:flutter/material.dart';

class CaiMixedManageStateView extends StatefulWidget {
  @override
  _CaiMixedManageStateViewState createState() =>
      _CaiMixedManageStateViewState();
}

class _CaiMixedManageStateViewState extends State<CaiMixedManageStateView> {
  bool _active = false;

  // Animation<double> animation;
  // AnimationController controller;

  // initState() {
  //   super.initState();

  //   controller = new AnimationController(duration: const Duration(seconds: 3));
  //   //图片宽高从0变到300
  //   animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
  //     ..addListener(() {
  //       setState(() => {});
  //     });
  //   //启动动画(正向执行)
  //   controller.forward();
  // }

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child:
       Column(
        children: <Widget>[
          // Image.asset("images/bg_logo1.png",
          //     width: animation.value, height: animation.value),
          TapboxA(),
          TapboxB(
            active: _active,
            onChanged: _handleTapboxChanged,
          ),
          TapboxC(
            active: _active,
            onChanged: _handleTapboxChanged,
          )
        ],
      )
    );
  }
}

// TapboxA 管理自身状态.

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        margin: EdgeInsets.all(20),
        constraints: BoxConstraints.tightFor(width: 100, height: 100),
        transform: Matrix4.rotationZ(.2),
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 22.0, color: Colors.white),
          ),
        ),
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'B Active' : 'B Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        transform: Matrix4.rotationZ(-.2),
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Column(
          children: <Widget>[
            Text(widget.active ? 'Active' : 'Inactive',
                style: new TextStyle(fontSize: 32.0, color: Colors.white)),
            Text("长按")
          ],
        ),
        width: 200.0,
        height: 100.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
