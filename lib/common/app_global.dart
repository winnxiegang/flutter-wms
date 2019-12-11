import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:flutter_wms/manager/MapManager.dart';
import 'package:flutter_wms/manager/PushManager.dart';
import 'package:flutter_wms/models/user_info.dart';

import '../utils/tire_export.dart';

var API_DOMAIN = 'http://172.16.6.1:8080/';
const REQUEST_HEADERS = {'Content-Type': 'application/x-www-form-urlencoded'};
const REQUEST_HEADERS_JSON = {'Content-Type': 'application/json'};

class Global {
  static SharedPreferences _prefs;

  static bool get isDebug => !bool.fromEnvironment("dart.vm.product");
  static UseStatusProvide useStatusStatus;

  static UserInfo user;

  /// 初始化全局信息，会在APP启动时执行
  static Future init() async {
   // await MapManager.init();
    await PushManager();
    _prefs = await SharedPreferences.getInstance();
    API_DOMAIN = _prefs.getString("api_domain") ?? API_DOMAIN;

    useStatusStatus = UseStatusProvide();

    user = UserInfo();

    user.setUserData(
        _prefs.getString('token') ?? '', _prefs.getString('userName') ?? '', _prefs.getString('userId') ?? '');
  }

  static String getBaseUrl() {
    return API_DOMAIN;
  }

  static void saveUserProfileInfo() {
    _prefs.setString("token", user.token);
    _prefs.setString("userName", user.userName);
    _prefs.setString("userId", user.userId);
    _prefs.setString("api_domain", API_DOMAIN);
  }
}
