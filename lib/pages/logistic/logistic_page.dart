import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/common/page_common.dart';
import 'package:flutter_wms/models/logistics_detal_entity.dart';
import 'package:flutter_wms/pages/logistic/logistics_map_page.dart';
import 'package:flutter_wms/provider/logistics_provide.dart';
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CommonColors.grayBg,
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[LogisticsHeadPage(), LogisticsMapPage()],
        ),
      ),
    );
  }


}
