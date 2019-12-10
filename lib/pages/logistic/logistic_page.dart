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
  Future _futureLogisticDetal;

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
    return FutureBuilder<LogisticsDetalEntity>(
        future: _futureLogisticDetal,
        builder: (context, data) {
          if (data.hasData) {
            Provider.of<LogisticsDetalProvide>(context).setLogisticsDetalEntity(data.data);
          } else {
            return loadingCellBox();
          }
          return Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[LogisticsHeadPage(), LogisticsMapPage()],
              ),
            ),
          );
        });
  }

  ///定义的data基类接受
  Future<LogisticsDetalEntity> _requestLogisticDetal() async {
    var path = "http://v.juhe.cn/exp/index?senderPhone=&receiverPhone=&dtype=&key=be0d84e149f047b1fc32b50b50d9fc7f";
    var params = {
      "com": Provider.of<LogisticsDetalProvide>(context).logisticsId,
      "no": Provider.of<LogisticsDetalProvide>(context).logisticsNome
    };
    Response response = await Dio().post(path, queryParameters: params);
    return LogisticsDetalEntity.fromJson(json.decode(response.toString()));
  }
}
