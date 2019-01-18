import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'dart:developer';
import 'cai/CaiPaint.dart';
import 'package:cai_flutter_demo/cai/CaiMixedManageState.dart';
import 'cai/CaiKeyboard.dart';
import 'cai/CaiPage.dart';
import 'cai/CaiNavigator.dart';
import 'model/CaiDartTest.dart';
import 'cai/CaiAnimation.dart';
import 'cai/CaiAnimationWidget.dart';
import 'cai/CaiCustomPaint.dart';
import 'cai/CaiCustomScrollView.dart';
import 'cai/CaiCustomPaintRect.dart';
import 'cai/CaiStack.dart';
import 'cai/CaiBatteryView.dart';
import 'cai/CaiRouter.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pageA = Scaffold(
      appBar: AppBar(
        title: Text("Page A"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: CaiRouter(),
      ),
    );
    var pageHome = MyHomePage(title: 'Flutter Demo Home Page');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: pageHome,
      routes: <String, WidgetBuilder>{
        // 这里可以定义静态路由，不能传递参数
        '/router/page_home': (_) => pageHome,
        '/router/page_a': (_) => pageA,
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // var navButtonTitle = "nav";
  var navButtonTitleCount = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    caiTest();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is also layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text("data"),
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("Paint"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("Paint"),
                      ),
                      body: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: CaiPaint(),
                      ),
                    );
                  }));
                },
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("CustomScrollView"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("Paint"),
                      ),
                      body: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: CustomScrollViewTestRoute(),
                      ),
                    );
                  }));
                },
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("State1"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("state"),
                      ),
                      body: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: CaiMixedManageStateView(),
                      ),
                    );
                  }));
                },
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("进度条"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("state2"),
                      ),
                      body: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: GradientCircularProgressRoute(),
                      ),
                    );
                  }));
                },
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("Stack"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("state2"),
                      ),
                      body: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: CaiStack(),
                      ),
                    );
                  }));
                },
              ),
              FlatButton(
                  color: Colors.blue,
                  child: Text("界面路由跳转"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/router/page_a");
                  }),
              FlatButton(
                color: Colors.blue,
                child: Text("自定义绘制"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("state2"),
                      ),
                      body: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: CaiCustomPaintRect(),
                      ),
                    );
                  }));
                },
              ),
              FlatButton(
                color: Colors.blue,
                child: Text("Keyboard"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("Keyboard"),
                      ),
                      body: CaiKeyboard(),
                    );
                  }));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.blue,
                  child: Text("Page"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text("布局示例"),
                        ),
                        body: CaiPage(),
                      );
                    }));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.blue,
                  child: Text("获取电量"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text("获取电量"),
                        ),
                        body: CaiBatteryView(),
                      );
                    }));
                  },
                ),
              ),
              buildFlatButton(context),
              FlatButton(
                color: Colors.blue,
                child: Text("Animation"),
                onPressed: () {
                  navButtonTitleCount++;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text("Animation"),
                      ),
                      body: CaiAnimation(),
                    );
                  })).then((Object data) {});
                },
              ),
              Hero(
                tag: "Animation2",
                child: FlatButton(
                  color: Colors.blue,
                  child: Text("Animation2"),
                  onPressed: () {
                    navButtonTitleCount++;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text("Animation"),
                        ),
                        body: CaiAnimationRoute(),
                      );
                    })
                        // PageRouteBuilder(
                        //     transitionDuration: Duration(microseconds: 500),
                        //     pageBuilder: (BuildContext context,
                        //         Animation animation,
                        //         Animation secondaryAnimation) {
                        //       return FadeTransition(
                        //         opacity: animation,
                        //         child: Scaffold(
                        //           appBar: AppBar(
                        //             title: Text("Animation2"),
                        //           ),
                        //           body: CaiAnimationRoute(),
                        //         ),
                        //       );
                        //     }
                        ).then((Object data) {});
                  },
                ),
              ),
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  FlatButton buildFlatButton(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      child: Text("Nav  $this $navButtonTitleCount"),
      onPressed: () {
        //这里如果不是点击按钮返回的（有回传），而是右滑动返回的，就没有值喽
        if (navButtonTitleCount == null) {
          navButtonTitleCount = 1;
        }
        navButtonTitleCount++;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Nav $navButtonTitleCount"),
            ),
            body: CaiNavigator(
              buttonTitleCount: navButtonTitleCount,
            ),
          );
        })).then((Object data) {
          print("this is return $data");
          navButtonTitleCount = data;
          setState(() {});
        });
      },
    );
  }
}
