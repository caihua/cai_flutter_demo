import 'package:flutter/material.dart';
import 'CaiUser.dart';

caiTest() {
  // test1();
}

test1() {
  //引用传递
  print("test1" + "-" * 100);
  var u1 = CaiUser(id: "1", name: "name1", avatarUrl: "url1");
  var u2 = u1; //引用传递
  printU1U2(u1, u2);
  u2.name = "u2 name2";
  printU1U2(u1, u2);

  //值拷贝
  var s1 = "s1";
  var s2 = s1;
  s2 = "s2";
  print("$s1 $s2");

  var sb1 = StringBuffer();
  sb1.write("sb1");
  var sb2 = sb1;
  sb2.write("sb2");
  print("$sb1  $sb2");

  List xl = List(3);
  xl[0] = 1;
  xl[1] = 2;
  // xl.add(1);
  // xl.add(2);
  // xl.add(3);
  // xl.add(4);
  print("$xl");

  Map mx = Map();
  mx["x"] = 1;
  print("$mx");

  assert(1 is Object);

  var x = [1.0];
  assert(x is List<double>);

  print("o" * 100);
  callback1(title) {
    print("callback1 $title");
  }

  var test1 = TestAddFunction(callback1);
  var test2 = TestAddF2(callback1);
}

void printU1U2(CaiUser u1, CaiUser u2) {
  print("u1:${u1.name} u2:${u2.name}");
}

class TestAddFunction {
  Function(String title) xRun;
  TestAddFunction(this.xRun);
}

class TestAddF2 extends StatelessWidget {
  final Function(String title) xRun;
  TestAddF2(this.xRun);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
