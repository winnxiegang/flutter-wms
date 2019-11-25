import 'package:flutter/material.dart';
import 'package:flutter_wms/common/app_global.dart';

class UseStatusProvide extends ChangeNotifier {
  /// 是否登录
  bool get isLogin =>
      Global.user.getToken() != null && Global.user.getToken().isNotEmpty;

  /// 是否登录
  String get userName => Global.user.getUserName() ?? '';

  /// 是否登录
  String get userId => Global.user.getUserId() ?? '';

  void loginStatus(String token, String useName, String useId) {
    if (token != null && token.isNotEmpty) {
      Global.user.setUserData(token, useName, useId);
    }
    notifyListeners();
  }

  /// 退出登录状态
  void logoutStatus() {
    Global.user.token = "";
    Global.user.userName = "";
    Global.user.userId = "";
    notifyListeners();
    Global.saveUserProfileInfo();
  }

  void notify() {
    notifyListeners();
  }
}
