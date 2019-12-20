import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

import 'gesturedetector_page.dart';

class FlutterListPage extends StatefulWidget {
  const FlutterListPage({
    Key key,
  }) : super(key: key);

  @override
  FlutterListPageState createState() => new FlutterListPageState();
}

class FlutterListPageState extends State<FlutterListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: 销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: ListView(
        children: <Widget>[
          ListItem(
            titile: 'GestureDetector手势',
            page: GesturedetectorPage(),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String titile;
  final Widget page;

  ListItem({
    this.titile,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titile),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
