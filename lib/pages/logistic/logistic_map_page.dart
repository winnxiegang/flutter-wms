import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/common/manager/MapManager.dart';
import 'package:flutter_wms/models/location_model.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class DrawPointScreen extends StatefulWidget {
  DrawPointScreen({this.data});

//定位坐标对象
  final List<LocationUpLoadBean> data;
  List<Marker> _markers = [];

  factory DrawPointScreen.forDesignTime() => DrawPointScreen();

  @override
  DrawPointScreenState createState() => DrawPointScreenState();
}

class DrawPointScreenState extends State<DrawPointScreen> with AutomaticKeepAliveClientMixin {
  AmapController _controller; //地图控制

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      _controller?.clearMarkers()?.whenComplete(() {
        List<MarkerOption> options = [];
        widget.data.forEach((model) {
          LatLng latLng = new LatLng(model?.latitude, model?.longitude);
          options.add(MarkerOption(
            latLng: latLng,
            iconUri: Uri.parse('images/icon_location_gray.png'),
            draggable: false,
            title: '${model?.longitude}"/" ${model?.latitude}',
            imageConfig: createLocalImageConfiguration(context),
          ));
        });
        _controller?.addMarkers(options);
//        marker.then((value) {
//          widget._markers = value;
//        });
        // set();
      });
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AmapView(
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
              widget.data.forEach((d) {
                if (d.latitude == latLng.latitude && d.longitude == latLng.longitude) {
                  showDetalDialog(d);
                  return;
                }
              });
            })?.whenComplete(() {
              ToastOk.show(msg: "点击后进行数据恢复????????");
              if (widget.data.isNotEmpty) {
                List<MarkerOption> options = [];
                widget.data.forEach((model) {
                  LatLng latLng = new LatLng(model?.latitude, model?.longitude);
                  options.add(MarkerOption(
                    latLng: latLng,
                    iconUri: Uri.parse('images/icon_location_gray.png'),
                    draggable: false,
                    title: '',
                    imageConfig: createLocalImageConfiguration(context),
                  ));
                });
                _controller?.addMarkers(options);
              }
            });
          },
        ));
  }

//将地图缩放至可以显示所有Marker 方式不正确
  void set() async {
    Stream.fromIterable(widget._markers).asyncMap((marker) => marker.location).toList().then((value) {
      _controller.showZoomControl(true);
    });
  }

  void showDetalDialog(LocationUpLoadBean locationUpLoadBean) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: ScreenUtil().setHeight(320),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
            child: Column(
              children: <Widget>[
                Text("定位地址:弹窗展示具体信息"),
                SizedBox(
                  height: 30,
                ),
                Text("定位地址:    ${locationUpLoadBean.longitude ?? ""}"),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Text(
                    "查看定位详情",
                    style: TextStyle(color: Colors.black54),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Routes.router.navigateTo(context, Routes.forgetPassword, transition: TransitionType.native);
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
