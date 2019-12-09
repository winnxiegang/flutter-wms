///物流
class LogisticsDetalEntity {
  WuliuResult result;
  String reason;
  int errorCode;
  String resultcode;

  LogisticsDetalEntity({this.result, this.reason, this.errorCode, this.resultcode});

  LogisticsDetalEntity.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? new WuliuResult.fromJson(json['result']) : null;
    reason = json['reason'];
    errorCode = json['error_code'];
    resultcode = json['resultcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['reason'] = this.reason;
    data['error_code'] = this.errorCode;
    data['resultcode'] = this.resultcode;
    return data;
  }
}

class WuliuResult {
  String com;
  String no;
  String company;
  List<WuliuResultList> xList;
  String status;
  String statusDetail;

  WuliuResult({this.com, this.no, this.company, this.xList, this.status, this.statusDetail});

  WuliuResult.fromJson(Map<String, dynamic> json) {
    com = json['com'];
    no = json['no'];
    company = json['company'];
    if (json['list'] != null) {
      xList = new List<WuliuResultList>();
      (json['list'] as List).forEach((v) {
        xList.add(new WuliuResultList.fromJson(v));
      });
    }
    status = json['status'];
    statusDetail = json['status_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['com'] = this.com;
    data['no'] = this.no;
    data['company'] = this.company;
    if (this.xList != null) {
      data['list'] = this.xList.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['status_detail'] = this.statusDetail;
    return data;
  }
}

class WuliuResultList {
  String datetime;
  String zone;
  String remark;

  WuliuResultList({this.datetime, this.zone, this.remark});

  WuliuResultList.fromJson(Map<String, dynamic> json) {
    datetime = json['datetime'];
    zone = json['zone'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['zone'] = this.zone;
    data['remark'] = this.remark;
    return data;
  }
}
