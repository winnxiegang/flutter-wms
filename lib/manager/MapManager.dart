import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:flutter_wms/provider/locationload_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:permission_handler/permission_handler.dart';

class MapManager {
  static String key = "fb4abd4ec38854faa0ef1c7054baf216";

  static init() async {
    await AmapCore.init(key);
  }

  static Future<bool> requestPermission() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.locationWhenInUse);

    if (permission == PermissionStatus.unknown) {
      await PermissionHandler().requestPermissions([PermissionGroup.locationWhenInUse]);
      permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.locationWhenInUse);
      if (permission == PermissionStatus.granted) {
        return true;
      }
      ToastOk.show(msg: "定位服务未开启");
      return false;
    } else if (permission == PermissionStatus.granted) {
      return true;
    }
    ToastOk.show(msg: "定位服务未开启");
    return false;
  }

//得到定位经纬度
  static void getLocation(BuildContext context) async {
    Location _location;
    if (await requestPermission()) {
      _location = await AmapLocation.fetchLocation();
      if (_location != null) {
        ProviderUtils.Pro<LocationloadProvide>(context,refushListen: true).setLocationData(_location);
      }
    }
  }
}
