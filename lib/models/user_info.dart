import 'package:flutter_wms/common/app_global.dart';

class UserInfo {
  UserInfo({this.userId, this.userName});

  String userId;
  String userName;
  String _token;

  String get token => _token ?? '';

  set token(String token) {
    if (_token != token) {
      _token = token;
      Global.loginStatus.notify();
      Global.saveUserProfileInfo();
    }
  }

  set setUserName(String userName) {
    if (userName.isNotEmpty) {
      this.userName = userName;
      Global.loginStatus.notify();
      Global.saveUserProfileInfo();
    }
  }

  set setUserId(String userId) {
    if (userId.isNotEmpty) {
      this.userId = userId;
      Global.loginStatus.notify();
      Global.saveUserProfileInfo();
    }
  }
}
