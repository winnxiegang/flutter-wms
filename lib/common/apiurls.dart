/**

 * @Author:         xiegang
 * @CreateDate:     2019/11/11 15:12
 * @Description:
 */

import 'app_global.dart';

///
class ApiUrls {

  static String getPath({String path: ''}) {
    StringBuffer sb = new StringBuffer(path);
    return sb.toString();
  }

  //登录
  static const String LOGIN = "ucenter/auth/login";

  //登录
  static const String printOrderPage = "wms/sparepart/printPage";
}
