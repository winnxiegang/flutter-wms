import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

import 'hanppy_list_page.dart';

class DuanziPage extends StatefulWidget {
  const DuanziPage({
    Key key,
  }) : super(key: key);

  @override
  DuanziPageState createState() => new DuanziPageState();
}

class DuanziPageState extends State<DuanziPage> {
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
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          children: <Widget>[HanppyListPage()],
        ),
      ),
    );
  }
}
