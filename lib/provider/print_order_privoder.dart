import 'package:flutter_wms/models/print_order_entity.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class PrintOrderListProvide extends ChangeNotifier {
  String searchOen = "";

  String getSearchOen() => searchOen ?? "";

  List<PrintOrderDataResult> goodsList = [];

  void setSearchOen(String searchOen) {
    this.searchOen = searchOen;
    notifyListeners();
  }

  //上拉加载列表
  addGoodsList(List<PrintOrderDataResult> list, int currentPage) {
    if (list == null) {
      return;
    }
    if (currentPage == 1) {
      goodsList = list;
    } else {
      Future.delayed(Duration.zero).then((e) {
        goodsList.addAll(list);
      });
    }
    notifyListeners();
  }
}
