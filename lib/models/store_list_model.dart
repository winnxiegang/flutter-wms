import 'dart:convert';

/// address : "��� ����� ��ƽ�� 1213131"
/// areaId : 395
/// areaName : "��ƽ��"
/// balance : null
/// businessLicense : ""
/// businessLicenseReview : 0
/// cityId : 37
/// cityName : "�����"
/// commuterTime : "00:10--00:40"
/// distanceDesc : "δ������λ"
/// employeesNumber : 0
/// latitude : 39.099726553
/// longitude : 117.1954001332
/// merchantId : 21
/// offWorkTime : "00:40"
/// page : 0
/// pageSize : 10
/// partsPremiumRate : ""
/// phoneNumber : ""
/// principalID : null
/// principalName : "123"
/// provinceId : 3
/// provinceName : "���"
/// rechargeMiniqrQr : ""
/// regMiniqrQr : ""
/// serverTypeIds : "3"
/// serverTypeName : "����"
/// stationNumber : 1
/// storeAddr : "1213131"
/// id : "65152"
/// storeImge : "http://s1.haoqipei.com/car_pickup/be/b5234e738cc1790a"
/// storeName : "����000005"
/// storeStatus : 1
/// storeTel : "138000000000"
/// workingHours : "00:10"

class StoreListModel {
  String address;
  int areaId;
  String areaName;
  dynamic balance;
  String businessLicense;
  int businessLicenseReview;
  int cityId;
  String cityName;
  String commuterTime;
  String distanceDesc;
  int employeesNumber;
  double latitude;
  double longitude;
  int merchantId;
  String offWorkTime;
  int page;
  int pageSize;
  String partsPremiumRate;
  String phoneNumber;
  dynamic principalID;
  String principalName;
  int provinceId;
  String provinceName;
  String rechargeMiniqrQr;
  String regMiniqrQr;
  String serverTypeIds;
  String serverTypeName;
  int stationNumber;
  String storeAddr;
  String storeImge;
  String storeName;
  int storeStatus;
  String storeTel;
  String workingHours;
  int id;

  static StoreListModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    StoreListModel storeListModelBean = StoreListModel();
    storeListModelBean.address = map['address'];
    storeListModelBean.areaId = map['areaId'];
    storeListModelBean.id = map['id'];
    storeListModelBean.areaName = map['areaName'];
    storeListModelBean.balance = map['balance'];
    storeListModelBean.businessLicense = map['businessLicense'];
    storeListModelBean.businessLicenseReview = map['businessLicenseReview'];
    storeListModelBean.cityId = map['cityId'];
    storeListModelBean.cityName = map['cityName'];
    storeListModelBean.commuterTime = map['commuterTime'];
    storeListModelBean.distanceDesc = map['distanceDesc'];
    storeListModelBean.employeesNumber = map['employeesNumber'];
    storeListModelBean.latitude = map['latitude'];
    storeListModelBean.longitude = map['longitude'];
    storeListModelBean.merchantId = map['merchantId'];
    storeListModelBean.offWorkTime = map['offWorkTime'];
    storeListModelBean.page = map['page'];
    storeListModelBean.pageSize = map['pageSize'];
    storeListModelBean.partsPremiumRate = map['partsPremiumRate'];
    storeListModelBean.phoneNumber = map['phoneNumber'];
    storeListModelBean.principalID = map['principalID'];
    storeListModelBean.principalName = map['principalName'];
    storeListModelBean.provinceId = map['provinceId'];
    storeListModelBean.provinceName = map['provinceName'];
    storeListModelBean.rechargeMiniqrQr = map['rechargeMiniqrQr'];
    storeListModelBean.regMiniqrQr = map['regMiniqrQr'];
    storeListModelBean.serverTypeIds = map['serverTypeIds'];
    storeListModelBean.serverTypeName = map['serverTypeName'];
    storeListModelBean.stationNumber = map['stationNumber'];
    storeListModelBean.storeAddr = map['storeAddr'];
    storeListModelBean.id = map['id'];
    storeListModelBean.storeImge = map['storeImge'];
    storeListModelBean.storeName = map['storeName'];
    storeListModelBean.storeStatus = map['storeStatus'];
    storeListModelBean.storeTel = map['storeTel'];
    storeListModelBean.workingHours = map['workingHours'];
    return storeListModelBean;
  }

  Map toJson() => {
        "address": address,
        "areaId": areaId,
        "areaName": areaName,
        "balance": balance,
        "businessLicense": businessLicense,
        "businessLicenseReview": businessLicenseReview,
        "cityId": cityId,
        "cityName": cityName,
        "commuterTime": commuterTime,
        "distanceDesc": distanceDesc,
        "employeesNumber": employeesNumber,
        "latitude": latitude,
        "longitude": longitude,
        "merchantId": merchantId,
        "offWorkTime": offWorkTime,
        "page": page,
        "id": id,
        "pageSize": pageSize,
        "partsPremiumRate": partsPremiumRate,
        "phoneNumber": phoneNumber,
        "principalID": principalID,
        "principalName": principalName,
        "provinceId": provinceId,
        "provinceName": provinceName,
        "rechargeMiniqrQr": rechargeMiniqrQr,
        "regMiniqrQr": regMiniqrQr,
        "serverTypeIds": serverTypeIds,
        "serverTypeName": serverTypeName,
        "stationNumber": stationNumber,
        "storeAddr": storeAddr,
        "id": id,
        "storeImge": storeImge,
        "storeName": storeName,
        "storeStatus": storeStatus,
        "storeTel": storeTel,
        "workingHours": workingHours,
      };
}
