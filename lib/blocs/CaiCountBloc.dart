import 'dart:async';

class CaiCountBloc {
  int _count;
  StreamController _controller;
  CaiCountBloc() {
    _count = 0;
    _controller = StreamController();
  }

  Stream get value => _controller.stream;

  incdement(){
    _controller.sink.add(++_count);
  }
  dispose(){
    _controller.close();
  }
}
