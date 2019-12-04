import 'package:flutter_wms/models/duanzi_entity.dart';
import 'package:flutter_wms/models/login_entity.dart';
import 'package:flutter_wms/models/print_order_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "DuanziEntity") {
      return DuanziEntity.fromJson(json) as T;
    } else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    } else if (T.toString() == "PrintOrderEntity") {
      return PrintOrderEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}