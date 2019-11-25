import 'package:flutter/material.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class LoginProvide extends ChangeNotifier {
  String useWorld = "";
  String usePhone = "";

  void setUseWorld(String useWorld) {
    this.useWorld = useWorld;
    notifyListeners();
  }

  void setUsePhone(String usePhone) {
    this.usePhone = usePhone;
    notifyListeners();
  }

//登录
  void requestLogin(BuildContext context) async {
    if (!InputCheckUtils.isCanLogin(context, usePhone, useWorld)) {
      return;
    }
    DioRequestControl()
        .logion(usePhone, useWorld, context,
            backdiss: true, printError: (value) {})
        .then((value) {
      ProviderUtils.Pro<UseStatusProvide>(context, refushListen: true)
          ?.loginStatus(value.result, value.username, value.deptId.toString());
      Routes.router.navigateTo(context, Routes.root,
          transition: TransitionType.native, replace: true);
    });
  }
}
