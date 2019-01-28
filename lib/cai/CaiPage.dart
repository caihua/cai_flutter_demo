import 'package:flutter/material.dart';

class CaiPage extends StatefulWidget {
  @override
  _CaiPageState createState() => _CaiPageState();
}

class _CaiPageState extends State<CaiPage> {
  @override
  Widget build(BuildContext context) {
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );
    var topImage = Image.asset(
      'image/bd_logo1.png',
      // width: 600,
      // height: 240.0,
      fit: BoxFit.cover,
      // color: Colors.yellow,
    );

    Widget titleSection = new Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
    var line = Divider(
      height: 1,
      color: Colors.red,
      indent: 0,
    );
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    var mainColume = Column(
      children: <Widget>[
        Container(
          child: topImage,
        ),
        ListTile(
            leading: const Icon(Icons.flight_land),
            title: const Text('Trix\'s airplane'),
            subtitle: Text('The airplane is only in Act II.'),
            trailing: Text("data"),
            enabled: true,
            selected: true,
            onTap: () {/* react to the tile being tapped */}),
        Container(
          child: line,
          padding: EdgeInsets.all(10),
        ),
        titleSection,
        buttonSection,
        textSection,
        Row(
          children: <Widget>[
            Text("1"),
            // Expanded(
            //   child: Column(
            //     children: <Widget>[
            //       Text("data1"),
            //       Text("data2"),
            //       Row(
            //         children: <Widget>[
            //           Text("data3"),
            //           Text("data4"),
            //           Expanded(
            //             child: Container(),
            //           ),
            //           Text("data5"),
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // Expanded(child: Container(),),
            // Expanded(
            //   child: Row(
            //     children: <Widget>[
            //       Expanded(
            //         child: Container(),
            //       ),
            //       Text("x"),
            //     ],
            //   ),
            // ),
            Align(
              alignment: Alignment.centerRight,
              child: Text("2"),
            ),
          ],
        ),
        Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('AH')),
              label: Text('Hamilton'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('ML')),
              label: Text('Lafayette'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('HM')),
              label: Text('Mulligan'),
            ),
            Chip(
              avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900, child: Text('JL')),
              label: Text('Laurens'),
            ),
          ],
        ),
      ],
    );

    return SingleChildScrollView(
      child: mainColume,
    );
  }
}
