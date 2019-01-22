import 'package:flutter/material.dart';
import 'CaiUser.dart';
import 'package:rxdart/rxdart.dart';

caiTest() {
  // test1();
  test2();
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

class TestClassA {
  // var firstA;
  // // var secondA;

  // firstFunA() {
  //   print("firstFunA");
  //   return "firstFunA";
  // }

  // secondFunA() {
  //   return "secondFunA";
  // }
}

class TestClassD {
  var firstD;
  // var secondA;

  firstFunD() {
    print("firstFunD");
    return "firstFunD";
  }

  // secondFunA() {
  //   return "secondFunA";
  // }
}

class TestClassC = TestClassB with TestClassD;

abstract class TestClassB implements TestClassA {
  var firstB;
  var secondB;

  // var firstA;
  TestClassB();

  firstFunB() {
    print("firstFunB");
    return "firstFunB";
  }

  secondFunB() {
    return "secondFunB";
  }

  @override
  firstFunA() {
    // super.f;
    return "b.firstFunA()";
  }
}

test2() {
  print("test2" + "-" * 100);
  var cc = TestClassC();
  cc.firstFunA();
  cc.firstFunB();

  var list1 = [1, 2, 3, 4, 5, 6]; //List();
  // list1.add(1);
  // list1.add(2);

  var list2 = List(10); //list1;
  // list2.add(3);

  List.copyRange(list2, 0, list1, 1, 2);

  list1.getRange(1, 3);
  print("------$list1 $list2");

  var bs = BehaviorSubject();
  var bs2 = BehaviorSubject();
  bs.add(1);
  bs2.add(3);
  bs2.add(4);
  bs2.add(6);
//  var os1= new Observable.just(1) // .just() creates an Observable that directly emits the past value
//     .zipWith(new Observable.just(2), (one, two) => one - two)
//     .listen((n){
//       bs.sink.add(n);
//     }); // prints 3
  var os2 = bs.zipWith(bs2.stream, (one, two) {
    return one + two;
  });
  os2.listen((n) {
    print("*" * 50 + "$n");
  });
  bs2.listen((n) {
    print("x" * 50 + "$n");
  });
  bs.close();
  bs2.close();
  //  bs.zipWith(other, zipper)

  // var b = TestClassB()..firstFunA();
  // print(b.firstFunA());
}
