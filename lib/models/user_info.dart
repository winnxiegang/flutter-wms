import 'package:flutter_wms/common/app_global.dart';

class UserInfo {
  String userId;
  String userName;
  String token;

  String getToken() => token ?? '';

  String getUserName() => userName ?? '';

  String getUserId() => userId ?? '';

  setUserData(String token, String userName, String userId) {
    if (token.isNotEmpty) {
      this.token = token;
    }
    if (userName.isNotEmpty) {
      this.userName = userName;
    }
    if (userId.isNotEmpty) {
      this.userId = userId;
    }
    Global.useStatusStatus.notify();
    Global.saveUserProfileInfo();
  }
}
