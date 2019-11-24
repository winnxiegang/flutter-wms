import 'package:flutter_wms/models/user_info.dart';

import '../utils/tire_export.dart';

var API_DOMAIN = 'http://172.16.6.1:8080/';
const REQUEST_HEADERS = {'Content-Type': 'application/x-www-form-urlencoded'};
const REQUEST_HEADERS_JSON = {'Content-Type': 'application/json'};

class Global {
  static SharedPreferences _prefs;

  static bool get isDebug => !bool.fromEnvironment("dart.vm.product");
  static UseStatusProvide loginStatus;

  static UserInfo user;

  static String cartCookie = '';

  /// 初始化全局信息，会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    API_DOMAIN = _prefs.getString("api_domain") ?? API_DOMAIN;

    loginStatus = UseStatusProvide();

    user = UserInfo();

    user.token = _prefs.getString('token') ?? '';
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
