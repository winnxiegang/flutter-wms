import 'dart:math';

import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/common/manager/MapManager.dart';
import 'package:flutter_wms/common/page_common.dart';
import 'package:flutter_wms/provider/bus_provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';

class BusMapBottomPage extends StatefulWidget {
  const BusMapBottomPage({
    Key key,
  }) : super(key: key);

  @override
  BusMapBottomPageState createState() => new BusMapBottomPageState();
}

class BusMapBottomPageState extends State<BusMapBottomPage> {
  AmapController _controller; //地图控制

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      _controller?.clearMarkers()?.whenComplete(() {
        List<MarkerOption> options = [];
        ProviderUtils.Pro<BusProvider>(context)?.busstops?.forEach((model) {
          LatLng latLng = new LatLng(
              double.parse(model.location.split(",")[1]),
              double.parse(model.location.split(","
                  "")[0]));
          options.add(MarkerOption(
            latLng: latLng,
            iconUri: Uri.parse("images/qq.png"),
            draggable: false,
            title: '${model.name}',
            imageConfig: createLocalImageConfiguration(context),
          ));
        });
        _controller?.addMarkers(options);
        //添加线(自定义纹理) 暂无无法共存
//        _controller?.addPolyline(PolylineOption(
////          width: 40,
////          customTexture: Uri.parse("images/bus_iv.png"),
////          imageConfig: createLocalImageConfiguration(context),
//          width: 30,
//          strokeColor: Colors.amberAccent,
//          latLngList: List<LatLng>.generate(
//              ProviderUtils.Pro<BusProvider>(context).busstops.length,
//                  (i) => new LatLng(
//                  double.parse(ProviderUtils.Pro<BusProvider>(context).busstops[i].location.split(",")[1]),
//                  double.parse(ProviderUtils.Pro<BusProvider>(context).busstops[i].location.split(","
//                      "")[0]))),
//        ));
      });
    }
    //必须在 weight前部 进行添加marker
    return Consumer(builder: (BuildContext context, BusProvider value, Widget child) {
      if (value.busStationDetalEntity == null) return noDataText();
      return Container(
        height: 400,
        child: Column(
          children: <Widget>[
            Expanded(
              child: AmapView(
                showZoomControl: false,
                zoomLevel: 11,
                onMapCreated: (controller) async {
                  //显示自身定位
                  if (await MapManager.requestPermission()) {
                    await controller.showMyLocation(true);
                  }
                  _controller = controller;
                  _controller?.setMarkerClickedListener((marker) async {
                    LatLng latLng = await marker.location;
                    print("经度--------------${latLng.longitude}");
                    print("维度--------------${latLng.latitude}");
                  });
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
