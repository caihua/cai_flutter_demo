import 'package:flutter/material.dart';

class CaiNavigator extends StatefulWidget {
  final buttonTitleCount;

  CaiNavigator({Key key,this.buttonTitleCount:"buttonTitle" }):super(key:key);
  @override
  _CaiNavigatorState createState() => _CaiNavigatorState();
}

class _CaiNavigatorState extends State<CaiNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: FlatButton(
              color: Colors.blue,
              child: Text("button $this ${this.widget.buttonTitleCount}"),
              onPressed: () {

                 Navigator.pop(context,this.widget.buttonTitleCount+1);
                // 
              },
            ),
    );
  }
}