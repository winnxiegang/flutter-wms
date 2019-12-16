import 'package:flutter/material.dart';
import 'package:flutter_wms/pages/scan/scanbottom.dart';
import 'package:flutter_wms/pages/scan/scanhead.dart';
import 'package:flutter_wms/wedghts/base/base_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({
    Key key,
  }) : super(key: key);

  @override
  ScanPageState createState() => new ScanPageState();
}

class ScanPageState extends State<ScanPage> with AutomaticKeepAliveClientMixin<ScanPage>, BaseState<ScanPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[ScanHeadPage(), ScanBottom()],
          ),
        ),
      ),
    );
  }
}
