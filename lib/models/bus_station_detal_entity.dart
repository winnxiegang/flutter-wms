class BusStationDetalEntity {
  BusStationDetalResult result;
  String reason;
  int errorCode;

  BusStationDetalEntity({this.result, this.reason, this.errorCode});

  BusStationDetalEntity.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? new BusStationDetalResult.fromJson(json['result']) : null;
    reason = json['reason'];
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['reason'] = this.reason;
    data['error_code'] = this.errorCode;
    return data;
  }
}

class BusStationDetalResult {
  List<BusStationDetalResultBusline> buslines;

  BusStationDetalResult({this.buslines});

  BusStationDetalResult.fromJson(Map<String, dynamic> json) {
    if (json['buslines'] != null) {
      buslines = new List<BusStationDetalResultBusline>();
      (json['buslines'] as List).forEach((v) {
        buslines.add(new BusStationDetalResultBusline.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.buslines != null) {
      data['buslines'] = this.buslines.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BusStationDetalResultBusline {
  String startStop;
  String distance;
  List<BusStationDetalResultBuslinesBusstop> busstops;
  double basicPrice;
  String endTime;
  String type;
  String startTime;
  String citycode;
  String name;
  String bounds;
  String company;
  String id;
  String polyline;
  String endStop;

  BusStationDetalResultBusline(
      {this.startStop,
      this.distance,
      this.busstops,
      this.basicPrice,
      this.endTime,
      this.type,
      this.startTime,
      this.citycode,
      this.name,
      this.bounds,
      this.company,
      this.id,
      this.polyline,
      this.endStop});

  BusStationDetalResultBusline.fromJson(Map<String, dynamic> json) {
    startStop = json['start_stop'];
    distance = json['distance'];
    if (json['busstops'] != null) {
      busstops = new List<BusStationDetalResultBuslinesBusstop>();
      (json['busstops'] as List).forEach((v) {
        busstops.add(new BusStationDetalResultBuslinesBusstop.fromJson(v));
      });
    }
    basicPrice = json['basic_price'];
    endTime = json['end_time'];
    type = json['type'];
    startTime = json['start_time'];
    citycode = json['citycode'];
    name = json['name'];
    bounds = json['bounds'];
    company = json['company'];
    id = json['id'];
    polyline = json['polyline'];
    endStop = json['end_stop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_stop'] = this.startStop;
    data['distance'] = this.distance;
    if (this.busstops != null) {
      data['busstops'] = this.busstops.map((v) => v.toJson()).toList();
    }
    data['basic_price'] = this.basicPrice;
    data['end_time'] = this.endTime;
    data['type'] = this.type;
    data['start_time'] = this.startTime;
    data['citycode'] = this.citycode;
    data['name'] = this.name;
    data['bounds'] = this.bounds;
    data['company'] = this.company;
    data['id'] = this.id;
    data['polyline'] = this.polyline;
    data['end_stop'] = this.endStop;
    return data;
  }
}

class BusStationDetalResultBuslinesBusstop {
  String sequence;
  String name;
  String location;
  String id;
  bool isClick=false;

  BusStationDetalResultBuslinesBusstop({this.sequence, this.name, this.location, this.id, this.isClick});

  BusStationDetalResultBuslinesBusstop.fromJson(Map<String, dynamic> json) {
    sequence = json['sequence'];
    name = json['name'];
    location = json['location'];
    id = json['id'];
    isClick = json['isClick'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sequence'] = this.sequence;
    data['name'] = this.name;
    data['location'] = this.location;
    data['id'] = this.id;
    data['isClick'] = this.isClick;
    return data;
  }
}
