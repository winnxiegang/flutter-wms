import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';


class InputCheckUtils {
  static bool isCanLogin(
      BuildContext context, String userName, String password) {
    if (userName.length < 11) {
      Toast.show("用户名有误哦", context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.CENTER,
          backgroundRadius: 5,
          backgroundColor: Colors.black38);
      return false;
    }

    if (password.isEmpty || password.length < 6) {
      Toast.show("密码有误哦", context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.CENTER,
          backgroundRadius: 5,
          backgroundColor: Colors.black38);
      return false;
    }

    return true;
  }
  ///提交忘记密码
  static bool isCheckForgetPassword(
      BuildContext context, String userPhone, String userCode) {
    if (userPhone.length < 11) {
      Toast.show("手机号有误", context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.CENTER,
          backgroundRadius: 5,
          backgroundColor: Colors.black38);
      return false;
    }

    if (userCode.isEmpty || userCode.length < 6) {
      Toast.show("验证码有误", context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.CENTER,
          backgroundRadius: 5,
          backgroundColor: Colors.black38);
      return false;
    }

    return true;
  }
}
