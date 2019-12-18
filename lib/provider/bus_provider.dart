import 'package:flutter/cupertino.dart';
import 'package:flutter_wms/models/bus_station_detal_entity.dart';

class BusProvider extends ChangeNotifier {
  BusStationDetalEntity _busStationDetalEntity;

  BusStationDetalEntity get busStationDetalEntity => _busStationDetalEntity;
  List<BusStationDetalResultBuslinesBusstop> _busstops;

  List<BusStationDetalResultBuslinesBusstop> get busstops => _busstops;
  String _clickName = "";

  String get clickName => _clickName;

  void setBusStationDetal(BusStationDetalEntity busStationDetalEntity) {
    _busStationDetalEntity = busStationDetalEntity;
    _busstops = _busStationDetalEntity.result.buslines[0].busstops;
    notifyListeners();
  }

  void setClickName(String clickName) {
    _clickName = clickName;
    notifyListeners();
  }
}
