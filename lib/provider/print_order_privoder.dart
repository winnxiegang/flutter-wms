import 'package:flutter_wms/models/print_order_entity.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class PrintOrderListProvide extends ChangeNotifier {
  String searchOen = "";
  int page = 1;
  bool isNeedLoadCircl = true; //动态判断是否需要加载圆圈

  String getSearchOen() => searchOen ?? "";

  List<PrintOrderDataResult> goodsList = [];

  void setSearchOen(String searchOen) {
    this.searchOen = searchOen;
    notifyListeners();
  }

  void setLoadCircl(bool isNeedLoadCircl) {
    this.isNeedLoadCircl = isNeedLoadCircl;
    notifyListeners();
  }

  originPage() {
    page = 1;
  }

  addPage() {
    page++;
  }

  //上拉加载列表
  addGoodsList(List<PrintOrderDataResult> list) {
    if (list == null) {
      return;
    }
    if (page == 1) {
      goodsList = list;
    } else {
      Future.delayed(Duration.zero).then((e) {
        goodsList.addAll(list);
      });
    }
    notifyListeners();
  }

  bool isLoadEnd(int totalNum) {
    if (goodsList != null && goodsList.length >= totalNum) {
      return true;
    }
    return false;
  }
}
