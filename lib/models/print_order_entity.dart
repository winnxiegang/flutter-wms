class PrintOrderEntity {
	List<PrintOrderDataResult> result;
	int total;
	int totalPage;
	int pageSize;
	int currentPage;

  PrintOrderEntity({this.result, this.total, this.totalPage, this.pageSize, this.currentPage});

  PrintOrderEntity.fromJson(Map<String, dynamic> json) {
		if (json['result'] != null) {
			result = new List<PrintOrderDataResult>();(json['result'] as List).forEach((v) { result.add(new PrintOrderDataResult.fromJson(v)); });
		}
		total = json['total'];
		totalPage = json['totalPage'];
		pageSize = json['pageSize'];
		currentPage = json['currentPage'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.result != null) {
      data['result'] =  this.result.map((v) => v.toJson()).toList();
    }
		data['total'] = this.total;
		data['totalPage'] = this.totalPage;
		data['pageSize'] = this.pageSize;
		data['currentPage'] = this.currentPage;
		return data;
	}
}

class PrintOrderDataResult {
	String shipper;
	String oeNo;
	String city;
	int num;
	int pageSize;
	String shopName;
	dynamic picUrls;
	dynamic gmtIn;
	int stockNum;
	dynamic wareHouseId;
	int id;
	String state;
	dynamic wareHouseName;
	dynamic warehouseIds;
	String stockNo;
	String brandName;
	String preTaxPrice;
	String sparepartType;
	String gmtCreate;
	int skuType;
	dynamic expirationPeriod;
	String modelName;
	String unit;
	String sparepartName;
	int page;
	String qualityType;
	String category;
	String belongInfo;

	PrintOrderDataResult({this.shipper, this.oeNo, this.city, this.num, this.pageSize, this.shopName, this.picUrls, this.gmtIn, this.stockNum, this.wareHouseId, this.id, this.state, this.wareHouseName, this.warehouseIds, this.stockNo, this.brandName, this.preTaxPrice, this.sparepartType, this.gmtCreate, this.skuType, this.expirationPeriod, this.modelName, this.unit, this.sparepartName, this.page, this.qualityType, this.category, this.belongInfo});

	PrintOrderDataResult.fromJson(Map<String, dynamic> json) {
		shipper = json['shipper'];
		oeNo = json['oeNo'];
		city = json['city'];
		num = json['num'];
		pageSize = json['pageSize'];
		shopName = json['shopName'];
		picUrls = json['picUrls'];
		gmtIn = json['gmtIn'];
		stockNum = json['stockNum'];
		wareHouseId = json['wareHouseId'];
		id = json['id'];
		state = json['state'];
		wareHouseName = json['wareHouseName'];
		warehouseIds = json['warehouseIds'];
		stockNo = json['stockNo'];
		brandName = json['brandName'];
		preTaxPrice = json['preTaxPrice'];
		sparepartType = json['sparepartType'];
		gmtCreate = json['gmtCreate'];
		skuType = json['skuType'];
		expirationPeriod = json['expirationPeriod'];
		modelName = json['modelName'];
		unit = json['unit'];
		sparepartName = json['sparepartName'];
		page = json['page'];
		qualityType = json['qualityType'];
		category = json['category'];
		belongInfo = json['belongInfo'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['shipper'] = this.shipper;
		data['oeNo'] = this.oeNo;
		data['city'] = this.city;
		data['num'] = this.num;
		data['pageSize'] = this.pageSize;
		data['shopName'] = this.shopName;
		data['picUrls'] = this.picUrls;
		data['gmtIn'] = this.gmtIn;
		data['stockNum'] = this.stockNum;
		data['wareHouseId'] = this.wareHouseId;
		data['id'] = this.id;
		data['state'] = this.state;
		data['wareHouseName'] = this.wareHouseName;
		data['warehouseIds'] = this.warehouseIds;
		data['stockNo'] = this.stockNo;
		data['brandName'] = this.brandName;
		data['preTaxPrice'] = this.preTaxPrice;
		data['sparepartType'] = this.sparepartType;
		data['gmtCreate'] = this.gmtCreate;
		data['skuType'] = this.skuType;
		data['expirationPeriod'] = this.expirationPeriod;
		data['modelName'] = this.modelName;
		data['unit'] = this.unit;
		data['sparepartName'] = this.sparepartName;
		data['page'] = this.page;
		data['qualityType'] = this.qualityType;
		data['category'] = this.category;
		data['belongInfo'] = this.belongInfo;
		return data;
	}
}
