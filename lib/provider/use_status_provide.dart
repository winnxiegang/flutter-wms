import 'package:flutter/material.dart';
import 'package:flutter_wms/common/app_global.dart';

class UseStatusProvide extends ChangeNotifier {
  /// 是否登录
  bool get isLogin => Global.user.token != null && Global.user.token.isNotEmpty;

  /// 是否登录
  String get userName => Global.user.userName ?? '';

  /// 是否登录
  String get userId => Global.user.userId ?? '';

  void loginStatus(String token, {String useName, String useId}) {
    if (token != null && token.isNotEmpty) {
      Global.user.token = token;
    }
    if (useName != null && useName.isNotEmpty) {
      Global.user.userName = useName;
    }
    if (useId != null && useId.isNotEmpty) {
      Global.user.setUserId = useId;
    }
    notifyListeners();
  }

  /// 退出登录状态
  void logoutStatus() {
    Global.user.token = "";
    Global.user.userName = "";
    Global.user.userId = "";
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}
