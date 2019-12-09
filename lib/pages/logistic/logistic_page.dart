import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

import 'Logistics_head.dart';

class LogisticsDetalPage extends StatefulWidget {

  const LogisticsDetalPage({
    Key key,
  }) : super(key: key);

  @override
  LogisticsDetalPageState createState() => new LogisticsDetalPageState();
}

class LogisticsDetalPageState extends State<LogisticsDetalPage> {

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
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[LogisticsHeadPage()],
        ),
      ),
    );
  }
}
