import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text("标题"),
          centerTitle: true,
        ),
        body: Content(),
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => new _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LogisticsHeadPage(),
    );
  }
}

class LogisticsHeadPage extends StatelessWidget {
  var stringList = [
    "顺丰快递",
    "申通快递",
    "圆通速递",
    "韵达快递",
    "天天快递",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text("物流公司"),
              ),
              DropdownButtonHideUnderline(
                child: new DropdownButton(
                  hint: new Text('下拉菜单选择一个物流公司'),
                  //设置这个value之后,选中对应位置的item，
                  //再次呼出下拉菜单，会自动定位item位置在当前按钮显示的位置处
                  value: "顺丰快递",
                  items: generateItemList(),
                  onChanged: (T) {},
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text("物流公司"),
            ],
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem> generateItemList() {
    List<DropdownMenuItem> items = new List();
    stringList.forEach((value) {
      items.add(DropdownMenuItem(value: value, child: new Center(child: Text(value))));
    });

    return items;
  }
}
