import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class LogisticsMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[LogisticsBootomPage()],
      ),
    );
  }
}

class LogisticsBootomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: BottomSheet(
            backgroundColor: Colors.transparent,
            builder: (context) {
              Text("底部折叠");
            }));
  }
}
