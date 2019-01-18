import 'package:flutter/material.dart';

class CaiRouter extends StatefulWidget {
  @override
  _CaiRouterState createState() => _CaiRouterState();
}

class _CaiRouterState extends State<CaiRouter> {
  caiCall(s) {
    print("caiCall $s");
  }

  var x = 101;

  @override
  Widget build(BuildContext context) {
    print("page A build");
    return Container(
      child: Column(
        children: <Widget>[
          Text("data1 $x"),
          RaisedButton(
            child: Text("text2"),
            onPressed: () {
              x++;
              setState(() {});
            },
          ),
          GestureDetector(
            onTap: () {
              caiCall(1);
            },
            child: FlatButton(
                color: Colors.yellow,
                child: Text("Page B"),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration:
                              Duration(milliseconds: 500), //动画时间为500毫秒
                          pageBuilder: (BuildContext context,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return new SlideTransition(
                                position: new Tween<Offset>(
                                  begin: const Offset(0.0, 1.0),
                                  end: const Offset(0.0, 0.0),
                                ).animate(animation),
                                child: Scaffold(
                                  appBar: AppBar(
                                    title: Text("Page B"),
                                  ),
                                  body: ConstrainedBox(
                                    constraints: BoxConstraints.expand(),
                                    child: CaiRouterTop(),
                                  ),
                                ) //路由B
                                );
                          }));
                }),
          ),
        ],
      ),
    );
  }
}

class CaiRouterTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          color: Colors.blue,
          child: Text("Page B"),
          onPressed: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration:
                        Duration(milliseconds: 500), //动画时间为500毫秒
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return new SlideTransition(
                          position: new Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(animation),
                          child: Scaffold(
                            appBar: AppBar(
                              title: Text("Page C"),
                            ),
                            body: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: CaiRouterBottom(),
                            ),
                          ) //路由B
                          );
                    }));
          }),
    );
  }
}

class CaiRouterBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          color: Colors.blue,
          child: Text("界面路由跳转"),
          onPressed: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration:
                        Duration(milliseconds: 500), //动画时间为500毫秒
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return new FadeTransition(
                          //使用渐隐渐入过渡,
                          opacity: animation,
                          child: Scaffold(
                            appBar: AppBar(
                              title: Text("Page D"),
                            ),
                            body: ConstrainedBox(
                              constraints: BoxConstraints.expand(),
                              child: CaiRouterPageD(),
                            ),
                          ) //路由B
                          );
                    }));
          }),
    );
  }
}

class CaiRouterPageD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            child: Text("Page D"),
          ),
          RaisedButton(
            child: Text("Goto Page A"),
            onPressed: () {
              // Navigator.pushNamed(context, "/router/page_a");
              // Navigator.popAndPushNamed(context, "/router/page_a");
              Navigator.popUntil(
                  context, ModalRoute.withName('/router/page_a'));
              // Navigator.pushNamedAndRemoveUntil(context, "/router/page_home",
              //     (Route<dynamic> route) => false);
              // Navigator.of(context).pushNamedAndRemoveUntil(
              // "/router/page_a", ModalRoute.withName("/router/page_a"));
            },
          )
        ],
      ),
    );
  }
}
