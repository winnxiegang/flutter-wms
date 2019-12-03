import 'package:flutter/material.dart';

//class LayoutDemo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('水平方向布局'),
//      ),
//      body: new Row(
//          children: <Widget>[
//            new RaisedButton(
//              onPressed: () {
//                print('点击红色按钮事件');
//              },
//              color: const Color(0xffcc0000),
//              child: new Text('红色按钮'),
//            ),
//            new Expanded(
//              flex: 1,
//              child: new RaisedButton(
//                onPressed: () {
//                  print('点击黄色按钮事件222');
//                },
//                color: Colors.green,
//                child: new Text('黄色按钮1222'),
//              ),
//            ),
//            new RaisedButton(
//              onPressed: () {
//                print('点击粉色按钮事件');
//              },
//              color: const Color(0xffea9999),
//              child: new Text('粉色按钮'),
//            ),
//          ]
//      ),
//    );
//  }
//}
class LayoutDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('水平方向布局'),
        ),
        body: Container(
            color: Colors.black,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text("Flexible1"),
                      color: Colors.blue,
                    ),
                    Flexible(
                      flex: 10,
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text("Flexible"),
                        color: Colors.blue,
                      ),
                    ),
                    Flexible(
                      flex: 20,
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text("Flexible11111111111111111111111111111111"),
                        color: Colors.blue,
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text("Flexible"),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text("Flexible1"),
                      color: Colors.blue,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text("Flexible1"),
                      color: Colors.blue,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text("Flexible2"),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text("Flexible3"),
                      color: Colors.blue,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text("Expanded1"),
                      color: Colors.blue,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text("Expanded2"),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text("Expanded3"),
                      color: Colors.blue,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text("Expanded"),
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text("Expanded"),
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: Text("Expanded"),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
        ));
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter教程',
      home: Column(
        children: <Widget>[
          LayoutDemo2(),
        ],
      ),
    ),
  );
}
