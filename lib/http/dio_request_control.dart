import 'package:flutter/material.dart';
import 'package:flutter_wms/common/apiurls.dart';
import 'package:flutter_wms/models/login_entity.dart';
import 'package:flutter_wms/models/print_order_entity.dart';
import 'package:flutter_wms/router/routes.dart';
import 'package:flutter_wms/utils/toast_util.dart';
import '../wedghts/simple_dialog.dart' as dialog;
import 'httpUtil.dart';
import 'http_base_response.dart';

///
///
class DioRequestControl {
  DioRequestControl();

  DioRequestControl _dioModelControl;

  DioRequestControl.getInstans() {
    if (null == _dioModelControl) {
      _dioModelControl = new DioRequestControl();
    }
  }

/*
处理错误，可以自己在ui层.error处理
printError 在需要退出到其他界面中，可能导致dialog 或者其他的控件的context无法获取，需要网络请求时加上
 */
  Future _error<T>(BaseResp baseResp, BuildContext context,
      {Function printError}) {
    if (baseResp.code == 401 && context != null) {
      ToastOk.show(msg: "登录失效，重新登录");
      Routes.router.navigateTo(context, Routes.login, replace: true);
      return new Future<T>.error(baseResp.msg);
    }
    ToastOk.show(msg: baseResp.msg ?? '');
    if (printError != null) {
      printError(baseResp.msg);
      return new Future<T>.error(baseResp.msg);
    } else {
      if (baseResp.code == 401) {
        Routes.router.navigateTo(context, Routes.login, replace: true);
        return new Future<T>.error("登录失效，重新登录");
      }
      return new Future<T>.error(baseResp.msg);
    }
  }

  /**
   * 登陆
   */
  Future<LoginEntity> logion(
      String username, String password, BuildContext context,
      {bool backdiss, Function printError}) async {
    dialog.showLoadingProgress(context, backdiss);
    BaseResp<Map<String, dynamic>> baseResp =
        await HttpUtil.getInstance(context).request<Map<String, dynamic>>(
            Method.post, ApiUrls.getPath(path: ApiUrls.LOGIN),
            data: {"username": username, "password": password, "type": 1});
    dialog.dismissDialog(context);
    LoginEntity loginEntity;
    if (baseResp.code == 0) {
      if (baseResp.data != null) {
        loginEntity = LoginEntity.fromJson(baseResp.data);
      }
      return loginEntity;
    }
    return _error<LoginEntity>(baseResp, context, printError: printError);
  }

  /**
   * 登陆
   */
  Future<PrintOrderEntity> printOrderData(
      String oeNo, String page, String pageSize, BuildContext context,
      {bool backdiss, Function printError}) async {
    if (context == null) {
      print("logcontext===null");
    }
    if (context != null) {
      dialog.showLoadingProgress(context, backdiss);
    }
    BaseResp<Map<String, dynamic>> baseResp =
        await HttpUtil.getInstance(context).request<Map<String, dynamic>>(
            Method.post, ApiUrls.getPath(path: ApiUrls.printOrderPage),
            data: {"oeNo": oeNo, "page": page, "pageSize": pageSize});
    if (context != null) {
      dialog.dismissDialog(context);
    }
    PrintOrderEntity printOrderData;
    if (baseResp.code == 0) {
      if (baseResp.data != null) {
        printOrderData = PrintOrderEntity.fromJson(baseResp.data);
      }

      return printOrderData;
    }
    return _error<LoginEntity>(baseResp, context, printError: printError);
  }
}
