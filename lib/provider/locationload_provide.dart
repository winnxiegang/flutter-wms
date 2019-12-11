import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wms/models/location_model.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class LocationloadProvide extends ChangeNotifier {
  LocationUpLoadBean _locationUpLoadBean = new LocationUpLoadBean();

  LocationUpLoadBean get locationUpLoadBean => _locationUpLoadBean;

  void setLocationData(Location location) async {
    location.latLng.then((value) {
      _locationUpLoadBean.longitude = value.longitude ?? "";
    });
    location.latLng.then((value) {
      _locationUpLoadBean.latitude = value.latitude ?? "";
    });
    _locationUpLoadBean.province = await location.province ?? "";
    _locationUpLoadBean.city = await location.city;
    _locationUpLoadBean.cityCode = await location.cityCode ?? "";
    _locationUpLoadBean.adCode = await location.adCode ?? "";
    _locationUpLoadBean.address = await location.address ?? "";
    notifyListeners();
  }
}
