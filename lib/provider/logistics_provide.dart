import 'package:flutter_wms/utils/tire_export.dart';

class LogisticsDetalProvide extends ChangeNotifier {
  String getLogisticsId(String logisticsName) {
    switch (logisticsName.trim()) {
      case "顺丰快递":
        {
          return "sf";
        }
        break;
      case "申通快递":
        {
          return "sto";
        }
        break;
      case "圆通速递":
        {
          return "yt";
        }
        break;
      case "韵达快递":
        {
          return "yd";
        }
        break;
      case "天天快递":
        {
          return "tt";
        }
        break;
    }
  }
}
