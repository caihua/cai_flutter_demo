import 'package:flutter/material.dart';

class CaiStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors =  
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return 
    Container(
          child: new InkWell(
            onTap: () {
              print(
                  '###########################点击了##################################');
            },
            child: new Container(
              //不要在这里设置背景色，for则会遮挡水波纹效果,如果设置的话尽量设置Material下面的color来实现背景色
              width: 300.0,
              height: 100.0,
              margin: EdgeInsets.all(0.0),
            ),
          ),
        );
// Column(
//       children: <Widget>[
        
        // DecoratedBox(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: _colors),
        //   ),
        //   child: Material(
        //     type: MaterialType.transparency,
        //     child: InkWell(
        //       // splashColor: colors.last,
        //       highlightColor: Colors.transparent,
        //       // onTap: onTap,
        //       child: ConstrainedBox(
        //         constraints:
        //             BoxConstraints.tightFor(height: height, width: width),
        //         child: Center(
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: DefaultTextStyle(
        //                 style: TextStyle(fontWeight: FontWeight.bold),
        //                 child: child),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        
      // ],
    // );
  }
}
