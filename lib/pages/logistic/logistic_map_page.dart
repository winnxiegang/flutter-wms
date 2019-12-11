import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/manager/MapManager.dart';
import 'package:flutter_wms/models/store_list_model.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class DrawPointScreen extends StatefulWidget {
  DrawPointScreen({this.data});

  final List<dynamic> data;

  factory DrawPointScreen.forDesignTime() => DrawPointScreen();

  @override
  DrawPointScreenState createState() => DrawPointScreenState();
}

class DrawPointScreenState extends State<DrawPointScreen> {
  AmapController _controller;
  Map<LatLng, String> storeMap = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      _controller?.clearMarkers()?.whenComplete(() {
        storeMap.clear();
        List<MarkerOption> options = [];
        widget.data.forEach((d) {
          if (d is StoreListModel) {
            StoreListModel model = d;
            LatLng latLng = new LatLng(model?.latitude, model?.longitude);
            storeMap[latLng] = d.id.toString();
            options.add(MarkerOption(
              latLng: latLng,
              iconUri: Uri.parse('images/icon_location_gray.png'),
              draggable: false,
              title: model?.storeName ?? '',
              imageConfig: createLocalImageConfiguration(context),
            ));
          }
        });
        _controller?.addMarkers(options);
      });
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: AmapView(
          showZoomControl: false,
          zoomLevel: 11,
          onMapCreated: (controller) async {
            if (await MapManager.requestPermission()) {
              await controller.showMyLocation(true);
            }

            _controller = controller;

            _controller?.setMarkerClickedListener((marker) async {
              LatLng latLng = await marker.location;
              widget.data.forEach((d) {
                if (d is StoreListModel) {
                  if (d.latitude == latLng.latitude && d.longitude == latLng.longitude) {
//                    Routes.router.navigateTo(context, '${Routes.storeDetalPage}?storeCode=${d.id}',
//                        transition: TransitionType.native);
                    return;
                  }
                }
              });
            })?.whenComplete(() {
              if (widget.data.isNotEmpty) {
                storeMap.clear();
                List<MarkerOption> options = [];
                widget.data.forEach((d) {
                  if (d is StoreListModel) {
                    StoreListModel model = d;
                    LatLng latLng = new LatLng(model?.latitude, model?.longitude);
                    storeMap[latLng] = d.id.toString();
                    options.add(MarkerOption(
                      latLng: latLng,
                      iconUri: Uri.parse('images/icon_location_gray.png'),
                      draggable: false,
                      title: model?.storeName ?? '',
                      imageConfig: createLocalImageConfiguration(context),
                    ));
                  }
                });
                _controller?.addMarkers(options);
              }
            });
          },
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
