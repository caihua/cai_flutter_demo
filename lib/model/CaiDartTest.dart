import 'package:flutter/material.dart';
import 'CaiUser.dart';


caiTest(){
  // test1();
}

test1(){
  //引用传递
  print("test1"+"-"*100);
  var u1 = CaiUser(id: "1",name: "name1",avatarUrl: "url1");
  var u2 = u1; //引用传递 
  printU1U2(u1, u2);
  u2.name = "u2 name2";
  printU1U2(u1, u2);
}

void printU1U2(CaiUser u1, CaiUser u2) {
  print("u1:${u1.name} u2:${u2.name}");
}