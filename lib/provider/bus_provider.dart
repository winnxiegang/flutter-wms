import 'package:flutter/cupertino.dart';
import 'package:flutter_wms/models/bus_station_detal_entity.dart';

class BusProvider extends ChangeNotifier {
  BusStationDetalEntity _busStationDetalEntity;

  BusStationDetalEntity get busStationDetalEntity => _busStationDetalEntity;
  List<BusStationDetalResultBuslinesBusstop> _busstops;

  List<BusStationDetalResultBuslinesBusstop> get busstops => _busstops;

  void setBusStationDetal(BusStationDetalEntity busStationDetalEntity) {
    _busStationDetalEntity = busStationDetalEntity;
    notifyListeners();
  }

  void setBusStationDetalResultBuslinesBusstop(List<BusStationDetalResultBuslinesBusstop> busstops) {
    _busstops = busstops;
    notifyListeners();
  }
}
