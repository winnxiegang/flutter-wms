import 'package:flutter_wms/models/logistics_detal_entity.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class LogisticsDetalProvide extends ChangeNotifier {
  LogisticsDetalEntity _logisticsDetalEntity;
  var logisticsList = [
    "顺丰快递",
    "申通快递",
    "圆通速递",
    "韵达快递",
    "天天快递",
  ];
  String _logisticsId = "sf";
  String _logisticsName = "顺丰快递";
  String _logisticsNome = "顺丰快递";

  String get logisticsId => _logisticsId;

  String get logisticsName => _logisticsName;

  String get logisticsNome => _logisticsNome;

  LogisticsDetalEntity get logisticsDetalEntity => _logisticsDetalEntity;

  void setLogisticsDetalEntity(LogisticsDetalEntity detalEntity) {
    _logisticsDetalEntity = detalEntity;
    notifyListeners();
  }

  changeLogisticsId(String logisticsName) {
    _logisticsName = logisticsName;
    switch (logisticsName.trim()) {
      case "顺丰快递":
        {
          _logisticsId = "sf";
        }
        break;
      case "申通快递":
        {
          _logisticsId = "sto";
        }
        break;
      case "圆通速递":
        {
          _logisticsId = "yt";
        }
        break;
      case "韵达快递":
        {
          _logisticsId = "yd";
        }
        break;
      case "天天快递":
        {
          _logisticsId = "tt";
        }
        break;
    }
  }

  List<DropdownMenuItem> generateItemList() {
    List<DropdownMenuItem> items = new List();
    logisticsList.forEach((value) {
      items.add(DropdownMenuItem(value: value, child: new Center(child: Text(value))));
    });

    return items;
  }
}
